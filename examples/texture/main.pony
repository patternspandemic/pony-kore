use "../../kore"
use "logger"

actor Main
  var system: KoreSystem

  let vertex_shader_path: String val = "texture.vert"
  var vertex_shader: (KoreGraphics4Shader val | None) = None

  let fragment_shader_path: String val = "texture.frag"
  var fragment_shader: (KoreGraphics4Shader val | None) = None

  let parrot_path: String val = "parrot.png"
  var parrot: (Image iso | None) = None

  new create(env: Env) =>
    system = KoreSystem(
      env,
      Info
    where
      title = "Texture Example",
      width = 640,
      height = 480)

    // Request shaders
    system.shaders.load_shader(this, vertex_shader_path)
    system.shaders.load_shader(this, fragment_shader_path)

    // Request image
    // system.assets.load_image(this, parrot_path)
    // try parrot = system.sync_assets.load_image(parrot_path)? end

    /*
        TODO: Try an async Image load where the receive_image receives a lambda
        that produces the Image when applied. That way its creation can be defered to being in the same thread where needed.
    */

  be receive_shader(
    path: String val,
    shader: KoreGraphics4Shader val)
  =>
    match path
    | vertex_shader_path => vertex_shader = shader
    | fragment_shader_path => fragment_shader = shader
    end
    try_proceed()

  be receive_image(
    path: String val,
    image: Image iso)
  =>
    match path
    | parrot_path => parrot = consume image
    end
    try_proceed()

  fun ref try_proceed() =>
    if
      not (vertex_shader is None) and
      not (fragment_shader is None) and
      not (parrot is None)
    then
      let entry_point =
        object
          var vertex_shader': (KoreGraphics4Shader val | None) =
            (vertex_shader = None)
          var fragment_shader': (KoreGraphics4Shader val | None) =
            (fragment_shader = None)
          var parrot': (Image iso | None) = (parrot = None)

          fun ref apply() =>
            try
              TextureExample(
                system,
                (vertex_shader' = None) as KoreGraphics4Shader val,
                (fragment_shader' = None) as KoreGraphics4Shader val,
                (parrot' = None) as Image iso^)
            end
        end

      system(entry_point)
    end

class TextureExample
  let system: KoreSystem

  let structure: KoreGraphics4VertexStructure val
  var pipeline: KoreGraphics4PipelineState
  var vertex_buffer: KoreGraphics4VertexBuffer
  var index_buffer: KoreGraphics4IndexBuffer

  let parrot: Image ref
  let texunit: KoreGraphics4TextureUnit val

  new create(
    system': KoreSystem,
    vertex_shader: KoreGraphics4Shader val,
    fragment_shader: KoreGraphics4Shader val,
    parrot': Image iso)
  =>
    system = system'
    parrot = consume parrot'
    // parrot =
    //   try system.sync_assets.load_image("parrot.png")?
    //   else Image.create_render_target(100, 100)
    //   end

    var structure' = KoreGraphics4VertexStructure
    structure'.add("pos", VertexDataFloat3VertexData)
    structure'.add("tex", VertexDataFloat2VertexData)
    structure = consume structure'

    pipeline = KoreGraphics4PipelineState
    pipeline.input_layout.push(structure)
    pipeline.set_vertex_shader(vertex_shader)
    pipeline.set_fragment_shader(fragment_shader)
    pipeline.compile()

    texunit = pipeline.get_texture_unit("texsampler")

    vertex_buffer = KoreGraphics4VertexBuffer(3, structure)
    with v = vertex_buffer.lock() do
      v( 0)? = -1; v( 1)? = -1; v( 2)? = 0.5; v( 3)? = 0.0; v( 4)? = 1.0
      v( 5)? =  1; v( 6)? = -1; v( 7)? = 0.5; v( 8)? = 1.0; v( 9)? = 1.0
      v(10)? =  0; v(11)? =  1; v(12)? = 0.5; v(13)? = 0.5; v(14)? = 0.0
    end

    index_buffer = KoreGraphics4IndexBuffer(3)
    with i = index_buffer.lock() do
      i(0)? = 0; i(1)? = 1; i(2)? = 2
    end

    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let grey: U32 = 0xff666666

    let g4 = framebuffer.g4()
    let g2 = framebuffer.g2()

    g4.begin_gfx()
      g4.clear(grey)
      g4.set_pipeline(pipeline)
      g4.set_vertex_buffer(vertex_buffer)
      g4.set_index_buffer(index_buffer)
      g4.set_texture(texunit, parrot)
      g4.draw_indexed_vertices()
    g4.end_gfx()

    g2.begin_gfx(false)
      g2.draw_image(parrot, 300, 300)
    g2.end_gfx()
