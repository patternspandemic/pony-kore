use "../../kore"
use "files"

actor Main
  new create(env: Env) =>
    let kore_system = KoreSystem(
      where
        title = "Shader Example",
        width = 640,
        height = 480)

    try
      (let vertex_shader, let fragment_shader) =
        load_shaders(env)? as
          (KoreGraphics4Shader val^, KoreGraphics4Shader val^)

      kore_system({ref() =>
        ShaderExample(kore_system, vertex_shader, fragment_shader)} ref)
    else
      env.out.print("Could not load shaders.")
    end

  fun tag load_shaders(
    env: Env)
    : ((KoreGraphics4Shader val^, KoreGraphics4Shader val^) | None val^) ?
  =>
    let caps = recover val FileCaps.>set(FileRead).>set(FileStat) end
    let au: AmbientAuth = env.root as AmbientAuth
    var vs_file_data: String val = ""
    var fs_file_data: String val = ""
    
    with
      vs_file = OpenFile(
        FilePath(au, "shader.vert.glsl", caps)?) as File,
      fs_file = OpenFile(
        FilePath(au, "shader.frag.glsl", caps)?) as File
    do
      vs_file_data = vs_file.read_string(vs_file.size())
      fs_file_data = fs_file.read_string(fs_file.size())
      (
        KoreGraphics4Shader(vs_file_data, ShaderTypeVertexShader),
        KoreGraphics4Shader(fs_file_data, ShaderTypeFragmentShader)
      )
    end


class ShaderExample
  var pipeline: KoreGraphics4PipelineState
  var vertex_buffer: KoreGraphics4VertexBuffer
  var index_buffer: KoreGraphics4IndexBuffer

  new create(
    system: KoreSystem,
    vertex_shader: KoreGraphics4Shader val,
    fragment_shader: KoreGraphics4Shader val)
  =>
    var structure = KoreGraphics4VertexStructure
    structure.add("pos", VertexDataFloat3VertexData)
    let structure': KoreGraphics4VertexStructure val = consume structure

    pipeline = KoreGraphics4PipelineState
    pipeline.set_vertex_shader(consume vertex_shader)
    pipeline.set_fragment_shader(consume fragment_shader)
    pipeline.input_layout.push(structure')
    pipeline.compile()

    vertex_buffer = KoreGraphics4VertexBuffer(3, structure')
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

  fun render() =>
    KoreGraphics4.clear(KoreGraphics4.clear_color_flag())
    KoreGraphics4.set_pipeline(pipeline)
    KoreGraphics4.set_vertex_buffer(vertex_buffer)
    KoreGraphics4.set_index_buffer(index_buffer)
    KoreGraphics4.draw_indexed_vertices()
