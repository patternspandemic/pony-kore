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

  // fun ref load_everything(done: {()}) =>

  // fun load_image(rel_path: String val, done: {(Image)}):  =>
  // fun load_blob(rel_path: String val, done: {(Blob)}):  =>
  // fun load_sound(rel_path: String val, done: {(Sound)}):  =>
  // fun load_font(rel_path: String val, done: {(Font)}):  =>
  // fun load_video(rel_path: String val, done: {(Video)}):  =>

  // fun get_image_formats(): Array[String val] =>
  // fun get_sound_formats(): Array[String val] =>
  // fun get_font_formats(): Array[String val] =>
  // fun get_video_formats(): Array[String val] =>
