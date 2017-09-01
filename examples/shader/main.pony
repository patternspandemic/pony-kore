use "../../kore"
use "logger"

actor Main
  new create(env: Env) =>
    let kore_system = KoreSystem(
      env,
      Info
    where
      title = "Shader Example",
      width = 640,
      height = 480)

    kore_system({ref() => ShaderExample(kore_system)} ref)


class ShaderExample
  var pipeline: KoreGraphics4PipelineState
  var vertex_buffer: KoreGraphics4VertexBuffer
  var index_buffer: KoreGraphics4IndexBuffer

  new create(
    system: KoreSystem)
  =>
    var structure = KoreGraphics4VertexStructure
    structure.add("pos", VertexDataFloat3VertexData)
    let structure': KoreGraphics4VertexStructure val = consume structure

    pipeline = KoreGraphics4PipelineState
    vertex_buffer = KoreGraphics4VertexBuffer(3, structure')
    index_buffer = KoreGraphics4IndexBuffer(3)

    try
      pipeline.set_vertex_shader(system.shaders("shader.vert")?)
      pipeline.set_fragment_shader(system.shaders("shader.frag")?)
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
    else
      system.logger(Error) and system.logger.log(
        "[Error] Failed to setup ShaderExample.")
    end

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
