use "lib:korec"

use @Kore_System_init[None](name: Pointer[U8] tag, width: I32, height: I32)

use @Kore_System_currentDevice[I32]()

use @Kore_System_initWindow[I32](options: WKoreWindowOptions)
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
use @Kore_System_setOrientationCallback[None](callback: @{(WKoreOrientation)})
use @Kore_System_setDropFilesCallback[None](callback: @{(Pointer[U32])})
use @Kore_System_setKeepScreenOn[None](on: Bool)

use @Kore_System_callback[None]()
use @Kore_System_foregroundCallback[None]()
use @Kore_System_resumeCallback[None]()
use @Kore_System_pauseCallback[None]()
use @Kore_System_backgroundCallback[None]()
use @Kore_System_shutdownCallback[None]()
use @Kore_System_orientationCallback[None](orientation: WKoreOrientation)
// TODO: Check file_path type
use @Kore_System_dropFilesCallback[None](file_path: Pointer[U32] tag) // if unix

primitive _KoreWindowHandle

primitive WOrientationLandscapeLeft
  fun apply(): I32 => 0
primitive WOrientationLandscapeRight
  fun apply(): I32 => 1
primitive WOrientationPortrait
  fun apply(): I32 => 2
primitive WOrientationPortraitUpsideDown
  fun apply(): I32 => 3
primitive WOrientationUnknown
  fun apply(): I32 => 4

type WKoreOrientation is
  ( WOrientationLandscapeLeft
  | WOrientationLandscapeRight
  | WOrientationPortrait
  | WOrientationPortraitUpsideDown
  | WOrientationUnknown
  )

primitive KoreSystem
  fun init(name: String val, width: I32, height: I32) =>
    @Kore_System_init(name.cstring(), width, height)

  fun set_name(name: String val) =>
    @Kore_System_setName(name.cstring())

  fun setup() =>
    @Kore_System_setup()

  fun init_window(options: WKoreWindowOptions): I32 =>
    @Kore_System_initWindow(options)

  fun set_callback(callback: @{()}) =>
    @Kore_System_setCallback(callback)

  fun start() =>
    @Kore_System_start()
