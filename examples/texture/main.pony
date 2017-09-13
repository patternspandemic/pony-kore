use "../../kore"
use "logger"

actor Main
  var system: KoreSystem
  var vs: (KoreGraphics4Shader val | None) = None
  var fs: (KoreGraphics4Shader val | None) = None
  var mascot: (Image iso | None) = None
  var logo: (Image iso | None) = None
  var k: (Image iso | None) = None

  new create(env: Env) =>
    system = KoreSystem(
      env,
      Info
    where
      title = "Texture Example",
      width = 640,
      height = 480)

    // Require needed shaders
    system.shaders("shader.vert")
      .next[None](recover this~receive_shader("vs") end)
    system.shaders("shader.frag")
      .next[None](recover this~receive_shader("fs") end)

    // Require needed images
    system.assets.load_image("pony-mascot.k")
      .next[None](recover this~receive_image("mascot") end)
    system.assets.load_image("pony-logo.png")
      .next[None](recover this~receive_image("logo") end)
    system.assets.load_image("kode-k.png")
      .next[None](recover this~receive_image("k") end)

  be receive_shader(
    name: String,
    shader: KoreGraphics4Shader val)
  =>
    match name
    | "vs" => vs = shader
    | "fs" => fs = shader
    end
    try_complete()

  be receive_image(
    name: String,
    image: Image iso)
  =>
    match name
    | "mascot" => mascot = consume image
    | "logo" => logo = consume image
    | "k" => k = consume image
    end
    try_complete()

  fun ref try_complete() =>
    if
      not (vs is None) and
      not (fs is None) and
      not (mascot is None) and
      not (logo is None) and
      not (k is None)
    then
      try
        let vs' = vs as KoreGraphics4Shader val
        let fs' = fs as KoreGraphics4Shader val
        //let mascot': Image iso = (mascot = None) as Image iso^
        //let logo': Image iso = (logo = None) as Image iso^
        //let k': Image iso = (k = None) as Image iso^

        let entry_point = {ref(m: Image iso, l: Image iso, k: Image iso) =>
          TextureExample(
            system, vs', fs',
            consume m, consume l, consume k)} ref
        
        system(entry_point~apply(
          (mascot = None) as Image iso^, // consume mascot',
          (logo = None) as Image iso^, // consume logo',
          (k = None) as Image iso^)) // consume k'))
      else
        system.logger(Error) and system.logger.log(
          "[Error] Could not create TextureExample")
      end
    end
/*
      // All needed resources exist and are loaded.
      system({ref()(mascot'' = consume mascot', logo'' = logo', k'' = k') =>
        try
          TextureExample(
            system,
            vs as KoreGraphics4Shader val,
            fs as KoreGraphics4Shader val,
            consume mascot'',
            consume logo'',
            consume k'')
        end
      } ref)
    end
*/

class TextureExample
  let system: KoreSystem
  let mascot: Image ref
  let logo: Image ref
  let k: Image ref
  let structure: KoreGraphics4VertexStructure val
  var pipeline: KoreGraphics4PipelineState
  var vertex_buffer: KoreGraphics4VertexBuffer
  var index_buffer: KoreGraphics4IndexBuffer

  new create(
    system': KoreSystem,
    vertex_shader: KoreGraphics4Shader val,
    fragment_shader: KoreGraphics4Shader val,
    mascot': Image iso,
    logo': Image iso,
    k': Image iso)
  =>
    system = system'
    mascot = consume mascot'
    logo = consume logo'
    k = consume k'

    var structure' = KoreGraphics4VertexStructure
    structure'.add("pos", VertexDataFloat3VertexData)
    structure = consume structure'

    let pipeline' = KoreGraphics4PipelineState
    let vertex_buffer' = KoreGraphics4VertexBuffer(3, structure)
    let index_buffer' = KoreGraphics4IndexBuffer(3)

    pipeline'.set_vertex_shader(vertex_shader)
    pipeline'.set_fragment_shader(fragment_shader)
    pipeline'.input_layout.push(structure)
    pipeline'.compile()

    with v = vertex_buffer'.lock() do
      v(0)? = -1; v(1)? = -1; v(2)? = 0.5
      v(3)? =  1; v(4)? = -1; v(5)? = 0.5
      v(6)? =  0; v(7)? =  1; v(8)? = 0.5
    end

    with i = index_buffer'.lock() do
      i(0)? = 0; i(1)? = 1; i(2)? = 2
    end

    pipeline = pipeline'
    vertex_buffer = vertex_buffer'
    index_buffer = index_buffer'

    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g4 = framebuffer.g4()
    let g2 = framebuffer.g2()
    let grey: U32 = 0xff666666

    g4.begin_gfx()
    g4.clear(grey)
    g4.set_pipeline(pipeline)
    g4.set_vertex_buffer(vertex_buffer)
    g4.set_index_buffer(index_buffer)
    g4.draw_indexed_vertices()
    g4.end_gfx()

    g2.begin_gfx(false)
    g2.set_color(Colors.white())
    g2.fill_rect(100, 100, 100, 100)
    g2.set_color(Colors.yellow())
    g2.draw_line(250, 100, 350, 200, 5.0)
    g2.fill_triangle(300, 150, 350, 150, 300, 100)
    g2.set_color(Colors.green())
    g2.draw_rect(250, 100, 100, 100, 10.0)
    g2.set_color(Colors.blue())
    // g2.set_opacity(0.3)
    g2.fill_triangle(400, 100, 400, 200, 500, 100)
    g2.draw_image(mascot, 100, 150)
    g2.end_gfx()
