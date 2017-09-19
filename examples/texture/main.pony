use "../../kore"
use "logger"

actor Main
  var system: KoreSystem

  let vertex_shader_path: String val = "texture.vert"
  var vertex_shader: (KoreGraphics4Shader val | None) = None

  let fragment_shader_path: String val = "texture.frag"
  var fragment_shader: (KoreGraphics4Shader val | None) = None

  let parrot_path: String val = "parrot.png"
  var parrot: (ImageAsset val | None) = None

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

    // Request assets
    system.assets.load_image(this, parrot_path)

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
    image_asset: ImageAsset val)
  =>
    match path
    | parrot_path => parrot = image_asset
    end
    try_proceed()

  fun ref try_proceed() =>
    if
      not (vertex_shader is None) and
      not (fragment_shader is None) and
      not (parrot is None)
    then
      try
        let entry_point =
          object
            var vertex_shader': KoreGraphics4Shader val =
              vertex_shader as KoreGraphics4Shader val
            var fragment_shader': KoreGraphics4Shader val =
              fragment_shader as KoreGraphics4Shader val
            var parrot': ImageAsset val =
              parrot as ImageAsset val

            fun ref apply() =>
              TextureExample(
                system,
                vertex_shader',
                fragment_shader',
                parrot')
          end

        system(entry_point)
      end
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
    parrot': ImageAsset)
  =>
    system = system'
    parrot = parrot'() // Apply asset to receive it.

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

    g4.begin_gfx()
      g4.clear(grey)
      g4.set_pipeline(pipeline)
      g4.set_vertex_buffer(vertex_buffer)
      g4.set_index_buffer(index_buffer)
      g4.set_texture(texunit, parrot)
      g4.draw_indexed_vertices()
    g4.end_gfx()
