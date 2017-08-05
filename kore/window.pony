// use "lib:korec"

struct KoreRendererOptions
  var textureFormat: I32 = 0
  var depthBufferBits: I32 = 16
  var stencilBufferBits: I32 = 8
  var antialiasing: I32 = 0

primitive WindowModeWindow
  fun apply(): I32 => 0
primitive	WindowModeBorderless
  fun apply(): I32 => 1
primitive WindowModeFullscreen
  fun apply(): I32 => 2

type KoreWindowMode is
  ( WindowModeWindow
  | WindowModeBorderless
  | WindowModeFullscreen
  )

struct KoreWindowOptions
  var title: Pointer[U8] tag
  var width: I32 = 800
  var height: I32 = 600
  var x: I32 = 100
  var y: I32 = 100
  var targetDisplay: I32 = -1
  var vSync: Bool = true
  var resizable: Bool = false
  var maximizable: Bool = false
  var minimizable: Bool = true
  var mode: I32 = WindowModeWindow() // W_Kore_WindowMode enum
  var showWindow: Bool = true
  embed rendererOptions: KoreRendererOptions = KoreRendererOptions

  new create(title': String val) =>
    title = title'.cstring()
