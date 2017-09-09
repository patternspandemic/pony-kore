use "../../kore"
use "logger"

actor Main
  var system: KoreSystem
  var vs: (KoreGraphics4Shader val | None) = None
  var fs: (KoreGraphics4Shader val | None) = None

  new create(env: Env) =>
    system = KoreSystem(
      env,
      Info
    where
      title = "Shader Example",
      width = 640,
      height = 480)

    // Require needed shaders
    system.shaders("shader.vert")
      .next[None](recover this~receive_shader("vert") end)
    system.shaders("shader.frag")
      .next[None](recover this~receive_shader("frag") end)

  be receive_shader(
    name: String,
    shader: KoreGraphics4Shader val)
  =>
    match name
    | "vert" => vs = shader
    | "frag" => fs = shader
    end
    try_complete()

  fun ref try_complete() =>
    if
      not (vs is None) and
      not (fs is None)
    then
      // All needed resources exist and are loaded.
      system({ref() =>
        try
          ShaderExample(
            system,
            vs as KoreGraphics4Shader val,
            fs as KoreGraphics4Shader val)
        end
      } ref)
    end

class ShaderExample
  let system: KoreSystem
  let pipeline: KoreGraphics4PipelineState
  let vertex_buffer: KoreGraphics4VertexBuffer
  let index_buffer: KoreGraphics4IndexBuffer

  new create(
    system': KoreSystem,
    vertex_shader: KoreGraphics4Shader val,
    fragment_shader: KoreGraphics4Shader val)
  =>
    system = system'

    var structure = KoreGraphics4VertexStructure
    structure.add("pos", VertexDataFloat3VertexData)
    let structure': KoreGraphics4VertexStructure val = consume structure

    pipeline = KoreGraphics4PipelineState
    vertex_buffer = KoreGraphics4VertexBuffer(3, structure')
    index_buffer = KoreGraphics4IndexBuffer(3)

    pipeline.set_vertex_shader(vertex_shader)
    pipeline.set_fragment_shader(fragment_shader)
    pipeline.input_layout.push(structure')
    pipeline.compile()

    with v = vertex_buffer.lock() do
      v(0)? = -1; v(1)? = -1; v(2)? = 0.5
      v(3)? =  1; v(4)? = -1; v(5)? = 0.5
      v(6)? =  0; v(7)? =  1; v(8)? = 0.5
    end

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
