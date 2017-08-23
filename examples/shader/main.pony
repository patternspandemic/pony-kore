use "../../kore"
use "files"

actor Main
  new create(env: Env) =>
    let name: String = "KoreC"
    let title: String = "Shader Example"

    var options: KoreWindowOptions = KoreWindowOptions(title)
    options.width = 640
    options.height = 480
    options.x = 100
    options.y = 100

    KoreSystem.set_name(name)
    KoreSystem.setup()
    KoreSystem.init_window(options)

    var vertex_shader: KoreGraphics4Shader iso
    var fragment_shader: KoreGraphics4Shader iso
    var structure: KoreGraphics4VertexStructure trn
    var pipeline: KoreGraphics4PipelineState
    var vertex_buffer: KoreGraphics4VertexBuffer
    var index_buffer: KoreGraphics4IndexBuffer

    let cb: @{()} =
      @{() =>
        KoreGraphics4.begin_gfx()
        KoreGraphics4.clear(KoreGraphics4.clear_color_flag())

        KoreGraphics4.set_pipeline(pipeline)
        KoreGraphics4.set_vertex_buffer(vertex_buffer)
        KoreGraphics4.set_index_buffer(index_buffer)
        KoreGraphics4.draw_indexed_vertices()

        KoreGraphics4.end_gfx()
        KoreGraphics4.swap_buffers()
      }

    KoreSystem.set_callback(cb)

    
    try
      let caps = recover val FileCaps.>set(FileRead).>set(FileStat) end
      var vs_data: (String val | None) = None
      var fs_data: (String val | None) = None
      let au: AmbientAuth = env.root as AmbientAuth

      with 
        vs_file = OpenFile(
          FilePath(au, "shader.vert.glsl", caps)?) as File,
        fs_file = OpenFile(
          FilePath(au, "shader.frag.glsl", caps)?) as File
      do
        let vs_file_data: String iso = vs_file.read_string(vs_file.size())
        vs_data = consume vs_file_data
        let fs_file_data: String iso = fs_file.read_string(fs_file.size())
        fs_data = consume fs_file_data
      end

      vertex_shader =
        recover KoreGraphics4Shader(vs_data, ShaderTypeVertexShader) end
      fragment_shader =
        recover KoreGraphics4Shader(fs_data, ShaderTypeFragmentShader) end

      structure = KoreGraphics4VertexStructure
      structure.add("pos", VertexDataFloat3VertexData)
      let structure': KoreGraphics4VertexStructure val = consume structure

      pipeline = KoreGraphics4PipelineState
      pipeline.set_vertex_shader(vertex_shader)
      pipeline.set_fragment_shader(fragment_shader)
      pipeline.input_layout.push(structure')
      pipeline.compile()

      vertex_buffer = KoreGraphics4VertexBuffer(3, structure')
      with v = vertex_buffer.lock() do
        v(0) = -1; v(1) = -1; v(2) = 0.5
        v(3) =  1; v(4) = -1; v(5) = 0.5
        v(6) = -1; v(7) =  1; v(8) = 0.5
      end

      index_buffer = KoreGraphics4IndexBuffer(3)
      with i = index_buffer.lock() do
        i(0) = 0; i(1) = 1; i(2) = 2
      end

      KoreSystem.start()
    else
      env.out.print("Could not read shaders.")
    end

    
