use "../../kore"
use "logger"

actor Main
  var system: KoreSystem

  let vertex_shader_path: String val = "shader.vert"
  var vertex_shader: (KoreGraphics4Shader val | None) = None

  let fragment_shader_path: String val = "shader.frag"
  var fragment_shader: (KoreGraphics4Shader val | None) = None

  new create(env: Env) =>
    system = KoreSystem(
      env,
      Info
    where
      title = "Shader Example",
      width = 640,
      height = 480)

    // Request shaders
    system.shaders.load_shader(this, vertex_shader_path)
    system.shaders.load_shader(this, fragment_shader_path)

  be receive_shader(
    path: String val,
    shader: KoreGraphics4Shader val)
  =>
    match path
    | vertex_shader_path => vertex_shader = shader
    | fragment_shader_path => fragment_shader = shader
    end
    try_proceed()

  fun ref try_proceed() =>
    if
      not (vertex_shader is None) and
      not (fragment_shader is None)
    then
      let entry_point =
        object
          var vertex_shader': (KoreGraphics4Shader val | None) =
            (vertex_shader = None)
          var fragment_shader': (KoreGraphics4Shader val | None) =
            (fragment_shader = None)

          fun ref apply() =>
            try
              ShaderExample(
                system,
                (vertex_shader' = None) as KoreGraphics4Shader val,
                (fragment_shader' = None) as KoreGraphics4Shader val)
            end
        end

      system(entry_point)
    end

class ShaderExample
  let system: KoreSystem

  let structure: KoreGraphics4VertexStructure val
  var pipeline: KoreGraphics4PipelineState
  var vertex_buffer: KoreGraphics4VertexBuffer
  var index_buffer: KoreGraphics4IndexBuffer

  new create(
    system': KoreSystem,
    vertex_shader: KoreGraphics4Shader val,
    fragment_shader: KoreGraphics4Shader val)
  =>
    system = system'

    var structure' = KoreGraphics4VertexStructure
    structure'.add("pos", VertexDataFloat3VertexData)
    structure = consume structure'

    pipeline = KoreGraphics4PipelineState
    pipeline.input_layout.push(structure)
    pipeline.set_vertex_shader(vertex_shader)
    pipeline.set_fragment_shader(fragment_shader)
    pipeline.compile()

    vertex_buffer = KoreGraphics4VertexBuffer(3, structure)
    with v = vertex_buffer.lock() do
      v(0)? = -1; v(1)? = -1; v(2)? = 0.5
      v(3)? =  1; v(4)? = -1; v(5)? = 0.5
      v(6)? =  0; v(7)? =  1; v(8)? = 0.5
    end

    index_buffer = KoreGraphics4IndexBuffer(3)
    with i = index_buffer.lock() do
      i(0)? = 0; i(1)? = 1; i(2)? = 2
    end

    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g = framebuffer.g4()
    let white = Colors.white()

    g.begin_gfx()

    g.clear(white)
    g.set_pipeline(pipeline)
    g.set_vertex_buffer(vertex_buffer)
    g.set_index_buffer(index_buffer)
    g.draw_indexed_vertices()

    g.end_gfx()
