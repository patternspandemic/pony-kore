use "../../kore"
use "files"

actor Main
  new create(env: Env) =>
    let kore_system = KoreSystem(
      where
        title = "Shader Example",
        width = 640,
        height = 480)

    kore_system({(system: KoreSystem)(env) => ShaderExample(env, system)} val)

class ShaderExample
  var pipeline: KoreGraphics4PipelineState
  var vertex_buffer: KoreGraphics4VertexBuffer
  var index_buffer: KoreGraphics4IndexBuffer

  new create(env: Env, system: KoreSystem) =>
    var shaders_loaded: Bool = false
    var vertex_shader: (KoreGraphics4Shader iso | None) = None
    var fragment_shader: (KoreGraphics4Shader iso | None) = None
    var structure: KoreGraphics4VertexStructure trn

    try
      (vertex_shader, fragment_shader) =
        load_shaders(env)? as (KoreGraphics4Shader iso^, KoreGraphics4Shader iso^)
      shaders_loaded = true
    end

    structure = recover trn KoreGraphics4VertexStructure end
    structure.add("pos", VertexDataFloat3VertexData)
    let structure': KoreGraphics4VertexStructure val = consume structure
    vertex_buffer = KoreGraphics4VertexBuffer(3, structure')
    index_buffer = KoreGraphics4IndexBuffer(3)

    pipeline = KoreGraphics4PipelineState

    if shaders_loaded then
      try
        pipeline.set_vertex_shader(
          consume vertex_shader as KoreGraphics4Shader iso^)
        pipeline.set_fragment_shader(
          consume fragment_shader as KoreGraphics4Shader iso^)
      end
      pipeline.input_layout.push(structure')
      pipeline.compile()

      with v = vertex_buffer.lock() do
        v(0)? = -1; v(1)? = -1; v(2)? = 0.5
        v(3)? =  1; v(4)? = -1; v(5)? = 0.5
        v(6)? = -1; v(7)? =  1; v(8)? = 0.5
      end

      with i = index_buffer.lock() do
        i(0)? = 0; i(1)? = 1; i(2)? = 2
      end

      system.notify_on_render(this~render())
    end

  fun render() =>
    // KoreGraphics4.begin_gfx()
    KoreGraphics4.clear(KoreGraphics4.clear_color_flag())
    KoreGraphics4.set_pipeline(pipeline)
    KoreGraphics4.set_vertex_buffer(vertex_buffer)
    KoreGraphics4.set_index_buffer(index_buffer)
    KoreGraphics4.draw_indexed_vertices()
    // KoreGraphics4.end_gfx()
    // KoreGraphics4.swap_buffers()

  fun tag load_shaders(
    env: Env)
    : ((KoreGraphics4Shader iso^, KoreGraphics4Shader iso^) | None val^) ?
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
        recover KoreGraphics4Shader(vs_file_data, ShaderTypeVertexShader) end,
        recover KoreGraphics4Shader(fs_file_data, ShaderTypeFragmentShader) end
      )
    end
