use "lib:korec"
use "logger"
use "collections"
use "files"

use @Kore_System__updateWithSystemObject[None](
  system: KoreSystem,
  system_callback: @{(KoreSystem, I32)})

use @Kore_System_init[None](name: Pointer[U8] tag, width: I32, height: I32)

use @Kore_System_currentDevice[I32]()

use @Kore_System_initWindow[I32](options: KoreWindowOptions)
use @Kore_System_destroyWindow[None](id: I32)
use @Kore_System_windowHandle[Pointer[_KoreWindowHandle]](windowId: I32)
use @Kore_System_windowWidth[I32](id: I32)
use @Kore_System_windowHeight[I32](id: I32)
use @Kore_System_windowCount[I32]()

use @Kore_System_screenDpi[I32]()

use @Kore_System_changeResolution[None](
  width: I32, height: I32, fullscreen: Bool)
use @Kore_System_handleMessages[Bool]()
// use @Kore_System_mousePos[?]()
use @Kore_System_showKeyboard[None]()
use @Kore_System_hideKeyboard[None]()
// use @Kore_System_showsKeyboard[Bool]()
use @Kore_System_loadURL[None](url: Pointer[U8] tag)
use @Kore_System_desktopWidth[I32]()
use @Kore_System_desktopHeight[I32]()
use @Kore_System_systemId[Pointer[U8]]() // TODO: Check return
use @Kore_System_setTitle[None](title: Pointer[U8] tag)
use @Kore_System_savePath[Pointer[U8]]() // TODO: Check return
// use @Kore_System_videoFormats[Pointer[Pointer[U8]]]() // TODO: Check return
use @Kore_System_showWindow[None]()
use @Kore_System_swapBuffers[None](context_id: I32)
use @Kore_System_makeCurrent[None](context_id: I32)
use @Kore_System_clearCurrent[None]()

use @Kore_System_frequency[F64]()
use @Kore_System_timestamp[U128]()
use @Kore_System_time[F64]()

use @Kore_System_setName[None](name: Pointer[U8] tag)
use @Kore_System_name[Pointer[U8]]()

use @Kore_System_hasShowWindowFlag[Bool]()
use @Kore_System_setShowWindowFlag[None](value: Bool)

use @Kore_System_setup[None]()
use @Kore_System_start[None]()
use @Kore_System_stop[None]()
use @Kore_System__shutdown[None]()
use @Kore_System_isFullscreen[Bool]()

use @Kore_System_setCallback[None](callback: @{()})
use @Kore_System_setForegroundCallback[None](callback: @{()})
use @Kore_System_setResumeCallback[None](callback: @{()})
use @Kore_System_setPauseCallback[None](callback: @{()})
use @Kore_System_setBackgroundCallback[None](callback: @{()})
use @Kore_System_setShutdownCallback[None](callback: @{()})
use @Kore_System_setOrientationCallback[None](callback: @{(I32)})
// TODO: How to deal with callback taking wchar_t* ?
// use @Kore_System_setDropFilesCallback[None](callback: @{(Pointer[U32])})
use @Kore_System_setKeepScreenOn[None](on: Bool)

use @Kore_System_callback[None]()
use @Kore_System_foregroundCallback[None]()
use @Kore_System_resumeCallback[None]()
use @Kore_System_pauseCallback[None]()
use @Kore_System_backgroundCallback[None]()
use @Kore_System_shutdownCallback[None]()
use @Kore_System_orientationCallback[None](orientation: I32)
// TODO: How to deal with callback taking wchar_t* ?
// use @Kore_System_dropFilesCallback[None](file_path: Pointer[U32] tag)

primitive _KoreWindowHandle

primitive OrientationLandscapeLeft
  fun apply(): I32 => 0
primitive OrientationLandscapeRight
  fun apply(): I32 => 1
primitive OrientationPortrait
  fun apply(): I32 => 2
primitive OrientationPortraitUpsideDown
  fun apply(): I32 => 3
primitive OrientationUnknown
  fun apply(): I32 => 4

type KoreOrientation is
  ( OrientationLandscapeLeft
  | OrientationLandscapeRight
  | OrientationPortrait
  | OrientationPortraitUpsideDown
  | OrientationUnknown
  )

class _SystemOptions
  var title: String = "Kore"
	var width: I32 = 800
	var height: I32 = 600
	var samples_per_pixel: I32 = 1
	var vsync: Bool = true
	var window_mode: KoreWindowMode = WindowModeWindow
	var resizable: Bool = false
	var maximizable: Bool = false
  var minimizable: Bool = true

// TODO: Convert returns to non-FFI types where it makes sense

class KoreSystem
  let _options: _SystemOptions
  let _render_listeners: Map[USize, Array[{ref(Framebuffer)}]]
  let _framebuffers: Map[USize, Framebuffer]

  let logger: Logger[String]
  let shaders: Shaders
  let assets: Assets

  new create(
    env: Env,
    log_level: LogLevel,
    title: String = "Kore",
    width: I32 = 800,
    height: I32 = 600,
    samples_per_pixel: I32 = 1,
    vsync: Bool = true,
    window_mode: KoreWindowMode = WindowModeWindow,
    resizable: Bool = false,
    maximizable: Bool = false,
    minimizable: Bool = true)
  =>
    _options = _SystemOptions
    _options.title = title
    _options.width = width
    _options.height = height
    _options.samples_per_pixel = samples_per_pixel
    _options.vsync = vsync
    _options.window_mode = window_mode
    _options.resizable = resizable
    _options.maximizable = maximizable
    _options.minimizable = minimizable
    _render_listeners = _render_listeners.create()
    // Pre-allocation here causes problems :(
    // _render_listeners(0) = Array[{ref(Framebuffer)}].create(1)

    _framebuffers = _framebuffers.create()

    logger = Logger[String](
      log_level,
      env.out,
      {(s: String): String => s },
      {(msg: String val, loc: SourceLoc val): String val => msg})

    let caps = recover val
      FileCaps.>set(FileRead).>set(FileStat).>set(FileLookup)
    end

    shaders = Shaders(logger)
    try
      let bin_dir =
        Directory(FilePath(env.root as AmbientAuth, Path.cwd(), caps)?)?
      try
        let shaders_path = bin_dir.infoat("Shaders")?.filepath
        shaders._load(shaders_path)
      else
        logger(Warn) and logger.log("[Warning] ./Shaders not found")
      end
    else
      logger(Error) and logger.log("[Error] Problem accessing ./Shaders")
    end

    assets = Assets(logger)
    try
      let bin_dir =
        Directory(FilePath(env.root as AmbientAuth, Path.cwd(), caps)?)?
      try
        let assets_path = bin_dir.infoat("Assets")?.filepath
        assets._init(assets_path)
      else
        logger(Warn) and logger.log("[Warning] ./Assets not found")
      end
    else
      logger(Error) and logger.log("[Error] Problem accessing ./Assets")
    end

  fun ref apply(callback': {ref()} ref) =>
    KoreRandom.init()
    KoreSystemPrimitive.set_name(_options.title)
    KoreSystemPrimitive.setup()

    var window_options = KoreWindowOptions(_options.title)
    window_options.width = _options.width.min(
      KoreSystemPrimitive.desktop_width())
    window_options.height = _options.height.min(
      KoreSystemPrimitive.desktop_height())
    window_options.renderer_options.antialiasing = _options.samples_per_pixel
    window_options.vsync = _options.vsync
    window_options.mode = _options.window_mode()
    window_options.resizable = _options.resizable
    window_options.maximizable = _options.maximizable
    window_options.minimizable = _options.minimizable

    KoreSystemPrimitive.init_window(window_options)

    // See: https://github.com/Kode/Kha/blob/master/Backends/Kore/kha/SystemImpl.hx#L108

    let window_id: I32 = 0
    let g4 = KoreGraphics4
    let framebuffer = Framebuffer(window_id where g4' = g4)
    framebuffer(
      KoreGraphics1(framebuffer),
      KoreGraphics2(framebuffer),
      g4)
    _framebuffers(USize.from[I32](window_id)) = framebuffer

    // Other post init stuff, see:
    // https://github.com/Kode/Kha/blob/master/Backends/Kore/kha/SystemImpl.hx#L155

    callback'()

    KoreSystemPrimitive._update_with_system_object(
      this,
      @{(system: KoreSystem, context_id: I32) =>
        system.frame(USize.from[I32](context_id))
      })

    KoreSystemPrimitive.start()
    // KoreSystemPrimitive.stop()?

  fun ref notify_on_render(
    listener: {ref(Framebuffer)},
    id: USize = 0)
  =>
    if not _render_listeners.contains(id) then
      _render_listeners(id) = Array[{ref(Framebuffer)}].create(1)
    end
    try _render_listeners(id)?.push(listener) end
    // try
    //   let listeners: Array[{ref(Framebuffer)}] = _render_listeners(id)?
    //   listeners.push(listener)
    // end

  // TODO: KoreSystem.remove_render_listener

  fun ref frame(id: USize) =>
    try _render(id, _framebuffers(id)?) end

  fun ref _render(id: USize, framebuffer: Framebuffer) =>
    if _render_listeners.size() > 0 then
      try
        for listener in _render_listeners(id)?.values() do
          listener(framebuffer)
        end
      end
    end


// TODO: Make most or all privite?
primitive KoreSystemPrimitive

  fun _update_with_system_object(
    system: KoreSystem,
    system_callback: @{(KoreSystem, I32)})
  =>
    @Kore_System__updateWithSystemObject(system, system_callback)

  /* Handled by KoreSystem */
  // fun init(name': String val, width: I32, height: I32) =>
  //   @Kore_System_init(name'.cstring(), width, height)

  fun current_device(): I32 =>
    @Kore_System_currentDevice()

  fun init_window(options: KoreWindowOptions): I32 =>
    @Kore_System_initWindow(options)

  fun destroy_window(id: I32) =>
    @Kore_System_destroyWindow(id)

  fun window_handle(window_id: I32): Pointer[_KoreWindowHandle] =>
    @Kore_System_windowHandle(window_id)

  fun window_width(id: I32 = 0): I32 =>
    @Kore_System_windowWidth(id)

  fun window_height(id: I32 = 0): I32 =>
    @Kore_System_windowHeight(id)

  fun window_count(): I32 =>
    @Kore_System_windowCount()

  fun screen_dpi(): I32 =>
    @Kore_System_screenDpi()

  fun change_resolution(width: I32, height: I32, fullscreen: Bool) =>
    @Kore_System_changeResolution(width, height, fullscreen)

  fun handle_messages(): Bool =>
    @Kore_System_handleMessages()

  fun show_keyboard() =>
    @Kore_System_showKeyboard()

  fun hide_keyboard() =>
    @Kore_System_hideKeyboard()

  /* Nothing useful ATM */
  // fun load_url(url: String val) =>
  //   @Kore_System_loadURL(url.cstring())

  fun desktop_width(): I32 =>
    @Kore_System_desktopWidth()

  fun desktop_height(): I32 =>
    @Kore_System_desktopHeight()

  fun system_id(): Pointer[U8] => // TODO: Check return
    @Kore_System_systemId()

  /* Handled by KoreSystem */
  // fun set_title(title: String val) =>
  //   @Kore_System_setTitle(title.cstring())

  fun save_path(): Pointer[U8] => // TODO: Check return
    @Kore_System_savePath()

  fun show_window() =>
    @Kore_System_showWindow()

  fun swap_buffers(context_id: I32) =>
    @Kore_System_swapBuffers(context_id)

  fun make_current(context_id: I32) =>
    @Kore_System_makeCurrent(context_id)

  fun clear_current() =>
    @Kore_System_clearCurrent()

  fun frequency(): F64 =>
    @Kore_System_frequency()

  fun timestamp(): U128 =>
    @Kore_System_timestamp()

  fun time(): F64 =>
    @Kore_System_time()

  fun set_name(name': String val) =>
    @Kore_System_setName(name'.cstring())

  fun name(): Pointer[U8] =>
    @Kore_System_name()

  fun has_show_window_flag(): Bool =>
    @Kore_System_hasShowWindowFlag()

  fun set_show_window_flag(value: Bool) =>
    @Kore_System_setShowWindowFlag(value)

  fun setup() =>
    @Kore_System_setup()

  fun start() =>
    @Kore_System_start()

  fun stop() =>
    @Kore_System_stop()

  fun _shutdown() =>
    @Kore_System__shutdown()

  fun is_fullscreen(): Bool =>
    @Kore_System_isFullscreen()

  fun set_callback(callback': @{()}) =>
    @Kore_System_setCallback(callback')

  fun set_foreground_callback(callback': @{()}) =>
    @Kore_System_setForegroundCallback(callback')

  fun set_resume_callback(callback': @{()}) =>
    @Kore_System_setResumeCallback(callback')

  fun set_pause_callback(callback': @{()}) =>
    @Kore_System_setPauseCallback(callback')

  fun set_background_callback(callback': @{()}) =>
    @Kore_System_setBackgroundCallback(callback')

  fun set_shutdown_callback(callback': @{()}) =>
    @Kore_System_setShutdownCallback(callback')

  fun set_orientation_callback(callback': @{(I32)}) =>
    @Kore_System_setOrientationCallback(callback')

  // TODO: How to deal with callback taking wchar_t* ?
  // fun set_drop_files_callback(callback': @{(Pointer[U32])}) =>
  //   @Kore_System_setDropFilesCallback(callback')

  fun set_keep_screen_on(on: Bool) =>
    @Kore_System_setKeepScreenOn(on)

  fun callback() =>
    @Kore_System_callback()

  fun foreground_callback() =>
    @Kore_System_foregroundCallback()

  fun resume_callback() =>
    @Kore_System_resumeCallback()

  fun pause_callback() =>
    @Kore_System_pauseCallback()

  fun background_callback() =>
    @Kore_System_backgroundCallback()

  fun shutdown_callback() =>
    @Kore_System_shutdownCallback()

  fun orientation_callback(orientation: KoreOrientation) =>
    @Kore_System_orientationCallback(orientation())

// TODO: How to deal with callback taking wchar_t* ?
  // fun drop_files_callback(file_path: String val) =>
  //   @Kore_System_dropFilesCallback(file_path.cstring())
