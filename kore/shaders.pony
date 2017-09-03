use "collections"
use "files"
use "logger"
use "regex"

// TODO: Load shaders concurrently?
class Shaders
  let _logger: Logger[String]
  let _shaders: Map[String val, KoreGraphics4Shader val]

  new create(logger: Logger[String]) =>
    _logger = logger
    _shaders = _shaders.create()

  fun ref _load(dir_path: FilePath) =>
    dir_path.walk(
      object ref is WalkHandler
        let shaders_path: FilePath = dir_path
        fun ref apply(
          dir_path': FilePath val,
          dir_entries: Array[String val] ref)
          : None val
        =>
          try
            let shader_file_re =
              Regex("(?i)(?<name>.+)\\.(?<type>vert|frag|geom|tesc|tese|comp){1}(\\.glsl)?$")?
            let dir = Directory(dir_path')?

            for entry in dir_entries.values() do
              let file_info = dir.infoat(entry)?
              let file_path = file_info.filepath

              if file_info.file and (shader_file_re == entry) then
                let matched = shader_file_re(entry)?

                try
                  with shader_file = OpenFile(file_path) as File do
                    var shader_data: String val =
                      shader_file.read_string(shader_file.size())
                    let shader_type =
                      match matched.find("type")?
                      | "vert" => ShaderTypeVertexShader
                      | "frag" => ShaderTypeFragmentShader
                      | "geom" => ShaderTypeGeometryShader
                      | "tesc" => ShaderTypeTessellationControlShader
                      | "tese" => ShaderTypeTessellationEvaluationShader
                      // | "comp" => ShaderTypeComputeShader // TODO: Support Compute shaders
                      else
                        ShaderTypeVertexShader // Noop
                      end
                    let shader: KoreGraphics4Shader val =
                      KoreGraphics4Shader(shader_data, shader_type)
                    let short_name =
                      matched.find("name")? + "." + matched.find("type")?
                    let shader_rel =
                      Path.rel(
                        shaders_path.path,
                        Path.join(Path.dir(file_path.path), short_name))?
                    _shaders(shader_rel) = shader
                    _logger(Info) and _logger.log(
                      "[Info] Loaded shader: " + shader_rel)
                  end
                else
                  _logger(Error) and _logger.log(
                    "[Error] Failed to load shader: " + file_path.path)
                end
              end
            end
          else
            _logger(Error) and _logger.log(
              "[Error] Problem loading shaders")
          end
      end)

    if _shaders.size() == 0 then
      _logger(Warn) and _logger.log("[Warning] No shaders found in ./Shaders")
    end

  fun apply(name: String): KoreGraphics4Shader val ? =>
    """Where name is the relative path the the shader from ./Shaders"""
    _shaders(name)?
