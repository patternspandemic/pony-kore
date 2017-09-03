use "collections"
use "files"
use "logger"
use "regex"

// TODO: Load assets concurrently?
class Assets
  let _logger: Logger[String]
  var _dir_path: (FilePath | None) = None

  let images: Map[String val, Image ref]
  // TODO: Other Asset Types
  // let sounds: Map[String val, Sound ref]
  // let blobs: Map[String val, Blob ref]
  // let fonts: Map[String val, Font ref]
  // let videos: Map[String val, Video ref]

  new create(logger: Logger[String]) =>
    _logger = logger
    images = images.create()
    // TODO: Other Asset Types
    // sounds = sounds.create()
    // blobs = blobs.create()
    // fonts = fonts.create()
    // videos = videos.create()

  fun ref _init(dir_path: FilePath) =>
    _dir_path = dir_path


  fun ref load_everything(done: {ref()}) =>
    """Load everything into this Assets' collections."""
    match _dir_path
    | let assets_path: FilePath =>
      assets_path.walk(
        object ref is WalkHandler
        // let shaders_path: FilePath = dir_path
        fun ref apply(
          dir_path': FilePath val,
          dir_entries: Array[String val] ref)
          : None val
        =>
          try
            let dir = Directory(dir_path')?
            var loaded_type: String val = ""

            for entry in dir_entries.values() do
              let file_info = dir.infoat(entry)?
              let file_path = file_info.filepath
              let extention = Path.ext(file_path.path)

              if file_info.file then
                try
                  with asset_file = OpenFile(file_path) as File do
                    let asset_rel =
                      Path.rel(
                        assets_path.path,
                        file_path.path)?

                    match extention
                    | "hdr" | "jpg" | "k" | "kng" | "png" | "pvr" =>
                      // handle image
                      let image: Image ref =
                        Image.from_file(file_path.path, true)
                        images(asset_rel) = image
                        loaded_type = "image"

                    | "ogg" | "wav" =>
                      // TODO: handle sound
                      None

                    | "ttf" =>
                      // TODO: handle font
                      None

                    | "mp4" =>
                      // TODO: handle video
                      None
                    else
                      // TODO: handle as blob? (other/no ext)
                      None
                    end
                    _logger(Info) and _logger.log(
                      "[Info] Loaded " + loaded_type +
                      " asset at: " + asset_rel)
                  end
                else
                  _logger(Error) and _logger.log(
                    "[Error] Failed to load asset: " + file_path.path)
                end
              end
            end

            done()
          else
            _logger(Error) and _logger.log(
              "[Error] Problem loading assets")
          end
        end)
    | None =>
      _logger(Error) and _logger.log(
        "[Error] Cannot load assets, path not provided.")
    end

  /*

  Load individual assets, adding them into this Assets' corresponding
  collection under the relative path name including extention. Then
  return the asset in the done callback.

  */

  // fun load_image(
  //   rel_path: String val,
  //   done: {(Image)},
  //   readable: Bool = true)
  // =>
  //   // TODO


  // fun load_blob(rel_path: String val, done: {(Blob)}) =>
  // fun load_sound(rel_path: String val, done: {(Sound)}) =>
  // fun load_font(rel_path: String val, done: {(Font)}) =>
  // fun load_video(rel_path: String val, done: {(Video)}) =>

  fun get_image_formats(): Array[String val] =>
    ["hdr"; "jpg"; "k"; "kng"; "png"; "pvr"]
  // fun get_sound_formats(): Array[String val] => ["wav"; "ogg"]
  // fun get_font_formats(): Array[String val] =>
  // fun get_video_formats(): Array[String val] => // Kore_System_videoFormats
