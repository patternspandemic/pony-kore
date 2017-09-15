use "../../kore"
use "logger"
use "debug"

actor Main is AssetReceiver
  var system: KoreSystem
  var vertex_shader: (KoreGraphics4Shader val | None) = None
  var fragment_shader: (KoreGraphics4Shader val | None) = None
  let parrot_path: String val = "parrot.png"
  var parrot: (Image iso | None) = None

  // let mascot_path: String val = "pony-mascot.png"
  // var mascot: (Image iso | None) = None
  // let logo_path: String val = "pony-logo.png"
  // var logo: (Image iso | None) = None
  // let k_path: String val = "kode-k.png"
  // var k: (Image iso | None) = None

  new create(env: Env) =>
    system = KoreSystem(
      env,
      Info
    where
      title = "Texture Example",
      width = 640,
      height = 480)

    // Require needed shaders
    system.shaders("texture.vert")
      .next[None](recover this~receive_shader("vs") end)
    system.shaders("texture.frag")
      .next[None](recover this~receive_shader("fs") end)

    // Require needed images
    system.assets.load_image(this, parrot_path)
    // system.assets.load_image(this, mascot_path)
    // system.assets.load_image(this, logo_path)
    // system.assets.load_image(this, k_path)

  be receive_shader(
    name: String,
    shader: KoreGraphics4Shader val)
  =>
    match name
    | "vs" => vertex_shader = shader
    | "fs" => fragment_shader = shader
    end
    try_complete()

  be receive_image(
    path: String,
    image: Image iso)
  =>
    match path
    | parrot_path => parrot = consume image
    // | mascot_path => mascot = consume image
    // | logo_path => logo = consume image
    // | k_path => k = consume image
    end
    try_complete()

  fun ref try_complete() =>
    if
      not (vertex_shader is None) and
      not (fragment_shader is None) and
      not (parrot is None)
      // not (mascot is None) and
      // not (logo is None) and
      // not (k is None)
    then
      let entry_point =
        object
          var vertex_shader': (KoreGraphics4Shader val | None) =
            (vertex_shader = None)
          var fragment_shader': (KoreGraphics4Shader val | None) =
            (fragment_shader = None)
          var parrot': (Image iso | None) = (parrot = None)
          // var mascot': (Image iso | None) = (mascot = None)
          // var logo': (Image iso | None) = (logo = None)
          // var k': (Image iso | None) = (k = None)

          fun ref apply() =>
            try
              TextureExample(
                system,
                (vertex_shader' = None) as KoreGraphics4Shader val,
                (fragment_shader' = None) as KoreGraphics4Shader val,
                (parrot' = None) as Image iso^)
                // (mascot' = None) as Image iso^,
                // (logo' = None) as Image iso^,
                // (k' = None) as Image iso^)
            end
        end

      system(entry_point)
    end

class TextureExample
  let system: KoreSystem
  let parrot: Image ref
  // let mascot: Image ref
  // let logo: Image ref
  // let k: Image ref
  let structure: KoreGraphics4VertexStructure val
  var pipeline: KoreGraphics4PipelineState
  var vertex_buffer: KoreGraphics4VertexBuffer
  var index_buffer: KoreGraphics4IndexBuffer
  let texunit: KoreGraphics4TextureUnit val

  new create(
    system': KoreSystem,
    vertex_shader: KoreGraphics4Shader val,
    fragment_shader: KoreGraphics4Shader val,
    parrot': Image iso)
    // mascot': Image iso,
    // logo': Image iso,
    // k': Image iso)
  =>
    system = system'
    parrot = consume parrot'
    // mascot = consume mascot'
    // logo = consume logo'
    // k = consume k'

    var structure' = KoreGraphics4VertexStructure
    structure'.add("pos", VertexDataFloat3VertexData)
    structure'.add("tex", VertexDataFloat2VertexData)
    structure = consume structure'

    let pipeline' = KoreGraphics4PipelineState
    let vertex_buffer' = KoreGraphics4VertexBuffer(3, structure)
    let index_buffer' = KoreGraphics4IndexBuffer(3)

    pipeline'.set_vertex_shader(vertex_shader)
    pipeline'.set_fragment_shader(fragment_shader)
    pipeline'.input_layout.push(structure)
    pipeline'.compile()

    with v = vertex_buffer'.lock() do
      v( 0)? = -1; v( 1)? = -1; v( 2)? = 0.5; v( 3)? = 0.0; v( 4)? = 1.0 //0 1
      v( 5)? =  1; v( 6)? = -1; v( 7)? = 0.5; v( 8)? = 1.0; v( 9)? = 1.0 //1 1
      v(10)? =  0; v(11)? =  1; v(12)? = 0.5; v(13)? = 0.5; v(14)? = 0.0 //0 0
    end

    with i = index_buffer'.lock() do
      i(0)? = 0; i(1)? = 1; i(2)? = 2
    end

    texunit = pipeline'.get_texture_unit("texsampler")
    pipeline = pipeline'
    vertex_buffer = vertex_buffer'
    index_buffer = index_buffer'

    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g4 = framebuffer.g4()
    // let g2 = framebuffer.g2()
    let grey: U32 = 0xff666666

    g4.begin_gfx()
    g4.clear(grey)
    g4.set_pipeline(pipeline)
    g4.set_vertex_buffer(vertex_buffer)
    g4.set_index_buffer(index_buffer)
    g4.set_texture(texunit, parrot)
    g4.draw_indexed_vertices()
    g4.end_gfx()

    // g2.begin_gfx(true, grey)
    // g2.begin_gfx(false)
    // g2.set_color(Colors.white())
    // g2.fill_rect(100, 100, 100, 100)
    // g2.set_color(Colors.yellow())
    // g2.draw_line(250, 100, 350, 200, 5.0)
    // g2.fill_triangle(300, 150, 350, 150, 300, 100)
    // g2.set_color(Colors.green())
    // g2.draw_rect(250, 100, 100, 100, 10.0)
    // g2.set_color(Colors.blue())
    // g2.fill_triangle(400, 100, 400, 200, 500, 100)
    // g2.set_color(Colors.red())
    // g2.draw_image(parrot, 50, 50)
    // g2.end_gfx()

    // g2.begin_gfx(false)
    // g2.set_color(Colors.orange())
    // g2.set_opacity(0.5)
    // g2.draw_image(mascot, 100, 210)
    // g2.end_gfx()

    // g4.end_gfx()