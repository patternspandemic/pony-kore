// use "lib:korec"

struct WKoreRendererOptions
  var textureFormat: I32 = 0
  var depthBufferBits: I32 = 16
  var stencilBufferBits: I32 = 8
  var antialiasing: I32 = 0

primitive WWindowModeWindow
  fun apply(): I32 => 0
primitive	WWindowModeBorderless
  fun apply(): I32 => 1
primitive WWindowModeFullscreen
  fun apply(): I32 => 2

type WKoreWindowMode is
  ( WWindowModeWindow
  | WWindowModeBorderless
  | WWindowModeFullscreen
  )

struct WKoreWindowOptions
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
  var mode: I32 = WWindowModeWindow() // W_Kore_WindowMode enum
  var showWindow: Bool = true
  embed rendererOptions: WKoreRendererOptions = WKoreRendererOptions

  new create(title': String val) =>
    title = title'.cstring()
