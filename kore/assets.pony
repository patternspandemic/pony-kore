use "collections"
use "files"
use "logger"
use "promises"
use "regex"

interface AssetReceiver
  be receive_image(name: String val, image: Image iso) => None
  // TODO: Other receive_*

// Not sure how useful Assets will be as a holder of various collections, as
// the asset needs to be sendable from this actor back to the requester. This
// has the consequence of all collected items being val from a load_everything.
// This is not so useful for Images, for example, as their underlying texture
// will not be accessible for drawing for instance. For other asset types it
// may still be useful to store a collection. Regardless, the Assets actor can
// provide async loading of an asset and return it iso through the various
// load_<asset-type> methods.

// TODO: Load assets concurrently?
// class Assets
actor Assets
  let _logger: Logger[String]
  var _dir_path: (FilePath | None) = None

  // let images: Map[String val, Image val]
  // TODO: Other Asset Types
  // let sounds: Map[String val, Sound ref]
  // let blobs: Map[String val, Blob ref]
  // let fonts: Map[String val, Font ref]
  // let videos: Map[String val, Video ref]

  new create(logger: Logger[String]) =>
    _logger = logger
    // images = images.create()
    // TODO: Other Asset Types
    // sounds = sounds.create()
    // blobs = blobs.create()
    // fonts = fonts.create()
    // videos = videos.create()

  // fun ref _init(dir_path: FilePath) =>
  be _init(dir_path: FilePath) =>
    _dir_path = dir_path

/*
  fun tag load_everything(): Promise[None] tag =>
    let loaded_promise = Promise[None]
    _load_everything(loaded_promise)
    loaded_promise

  // fun ref load_everything(loaded_promise: Promise[None]) =>
  be _load_everything(loaded_promise: Promise[None]) =>
    """Load everything into this Assets' collections."""
    match _dir_path
    | let assets_path: FilePath =>
      assets_path.walk(
        object ref is WalkHandler
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
                  // with asset_file = OpenFile(file_path) as File do
                    let asset_rel =
                      Path.rel(
                        assets_path.path,
                        file_path.path)?

                    match extention
                    | "hdr" | "jpg" | "k" | "kng" | "png" | "pvr" =>
                      // handle image
                      let image: Image val =
                        recover Image.from_file(file_path.path, true) end
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
                  // end // end of with
                else
                  _logger(Error) and _logger.log(
                    "[Error] Failed to load asset: " + file_path.path)
                  loaded_promise.reject()
                end
              end
            end
            // Fulfill promise to attempt load of everything.
            loaded_promise(None)
          else
            _logger(Error) and _logger.log(
              "[Error] Problem loading assets")
            loaded_promise.reject()
          end
        end)
    | None =>
      _logger(Error) and _logger.log(
        "[Error] Cannot load assets. Assets path not provided.")
      loaded_promise.reject()
    end
*/

// TODO: LOL, forgot Promises are not for iso types. :(
// Will need to replace with behavior interaction, have
// load_* behaviors accept a AssetReceiver traited tag,
// and will then be able to send back loaded assets iso.

/*
  fun tag load_image(
    rel_path: String val,
    readable: Bool = true)
    : Promise[Image iso] tag
  =>
    let image_promise = Promise[Image iso]
    _load_image(rel_path, readable, image_promise)
    image_promise
*/

  be load_image(
    requester: AssetReceiver tag,
    rel_path: String val,
    readable: Bool = true)
  =>
    match _dir_path
    | let assets_path: FilePath =>
      try
        let image_path = assets_path.join(rel_path)?
        let image_info = FileInfo(image_path)?
        let extention = Path.ext(image_path.path)

        if image_info.file and
           get_image_formats().contains(
             extention,
             {(s1: String val, s2: String val): Bool => s1 == s2})
        then
          try
            let image_rel = // possibly cleaned rel path
              Path.rel(
                assets_path.path,
                image_path.path)?
            let image: Image iso =
              recover Image.from_file(image_path.path, readable) end
            _logger(Info) and _logger.log(
              "[Info] Loaded image asset at: " + image_rel)
            requester.receive_image(rel_path, consume image)
          else
            _logger(Error) and _logger.log(
              "[Error] Failed to load image asset: " + image_path.path)
          end
        else
          _logger(Error) and _logger.log(
            "[Error] Image asset not a file or is unsupported format: " +
            image_path.path)
        end
      else
        _logger(Error) and _logger.log(
          "[Error] Image asset (" + rel_path +
          ") not found in assets path of: " + assets_path.path)
      end
    | None =>
      _logger(Error) and _logger.log(
        "[Error] Cannot load image asset. Assets path not provided.")
    end

  // fun load_blob(rel_path: String val, done: {(Blob)}) =>
  // fun load_sound(rel_path: String val, done: {(Sound)}) =>
  // fun load_font(rel_path: String val, done: {(Font)}) =>
  // fun load_video(rel_path: String val, done: {(Video)}) =>

  fun get_image_formats(): Array[String val] =>
    ["hdr"; "jpg"; "k"; "kng"; "png"; "pvr"]
  // fun get_sound_formats(): Array[String val] => ["wav"; "ogg"]
  // fun get_font_formats(): Array[String val] =>
  // fun get_video_formats(): Array[String val] => // Kore_System_videoFormats
