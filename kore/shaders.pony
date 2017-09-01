use "collections"
use "files"
use "logger"
use "regex"

// TODO: Load shaders in concurrently?
class Shaders
  let _shaders: Map[String val, KoreGraphics4Shader val]

  new create() =>
    _shaders = _shaders.create()

  fun ref init(logger: StringLogger, dir_path: FilePath) =>
    dir_path.walk(
      object ref is WalkHandler
        fun ref apply(
          dir_path: FilePath val,
          dir_entries: Array[String val] ref)
          : None val
        =>
          try
            let shader_file =
              Regex("(?i)(?<name>.+)\\.(?<type>vert|frag|geom|tesc|tese|comp){1}(\\.glsl)?$")?
            let dir = Directory(dir_path)?
            for entry in dir_entries.values() do
              let file_info = dir.infoat(entry)?
              if file_info.file and (shader_file == file_info.filepath.path) then
                let matched = shader_file(Path.base(file_info.filepath.path))
                logger(Warn) and logger.log(
                  "Matched " + matched.find("type") + "shader named " +
                  matched.find("name"))
              end
            end
          else
            logger(Error) and logger.log("Error loading shaders.")
          end
      end)

    // Walk the shaders directory
    // Only deal with *.{vert,frag,geom,tesc,tese,comp}[.glsl]
    // Map shaders to their 'dirname/subdir/name.type' (lose the .glsl)

  fun apply(name: String): KoreGraphics4Shader val ? =>
    """Where name is the relative path the the shader from ./Shaders"""
    _shaders(name)


/*
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
*/