use "../../kore"
use "logger"

actor Main
  var system: KoreSystem
  var vs: (KoreGraphics4Shader val | None) = None
  var fs: (KoreGraphics4Shader val | None) = None
  var mascot: (Image val | None) = None
  var logo: (Image val | None) = None
  var k: (Image val | None) = None

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
      .next[None](recover this~receive_shader("vert") end)
    system.shaders("shader.frag")
      .next[None](recover this~receive_shader("frag") end)
    // Require needed images
    system.assets.load_image("pony-mascot.png")
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
    | "vert" => vs = shader
    | "frag" => fs = shader
    end
    try_complete()

  be receive_image(
    name: String,
    image: Image val)
  =>
    match name
    | "mascot" => mascot = image
    | "logo" => logo = image
    | "k" => k = image
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
      // All needed resources exist and are loaded.
      system({ref() =>
        try
          TextureExample(
            system,
            vs as KoreGraphics4Shader val,
            fs as KoreGraphics4Shader val,
            mascot as Image val,
            logo as Image val,
            k as Image val)
        end
      } ref)
    end

  // kore_system({ref() => TextureExample(kore_system)} ref)

class TextureExample
  let system: KoreSystem
  let mascot: Image val
  let logo: Image val
  let k: Image val
  var pipeline: KoreGraphics4PipelineState
  var vertex_buffer: KoreGraphics4VertexBuffer
  var index_buffer: KoreGraphics4IndexBuffer

  new create(
    system': KoreSystem,
    vertex_shader: KoreGraphics4Shader val,
    fragment_shader: KoreGraphics4Shader val,
    mascot': Image val,
    logo': Image val,
    k': Image val)
  =>
    system = consume system'
    mascot = mascot'
    logo = logo'
    k = k'

    var structure = KoreGraphics4VertexStructure
    structure.add("pos", VertexDataFloat3VertexData)
    let structure': KoreGraphics4VertexStructure val = consume structure

    let pipeline' = KoreGraphics4PipelineState
    let vertex_buffer' = KoreGraphics4VertexBuffer(3, structure')
    let index_buffer' = KoreGraphics4IndexBuffer(3)

    pipeline'.set_vertex_shader(vertex_shader)
    pipeline'.set_fragment_shader(fragment_shader)
    pipeline'.input_layout.push(structure')
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
    g2.end_gfx()

    