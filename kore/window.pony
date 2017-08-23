// use "lib:korec"

struct KoreRendererOptions
  var texture_format: I32 = 0
  var depth_buffer_bits: I32 = 16
  var stencil_buffer_bits: I32 = 8
  var antialiasing: I32 = 0

primitive WindowModeWindow
  fun apply(): I32 => 0
primitive	WindowModeBorderless
  fun apply(): I32 => 1
primitive WindowModeFullscreen
  fun apply(): I32 => 2

primitive ToKoreWindowMode
  fun from(value: I32): KoreWindowMode =>
    match value
    | 0 => WindowModeWindow
    | 1 => WindowModeBorderless
    | 2 => WindowModeFullscreen
    else
      WindowModeWindow
    end

type KoreWindowMode is
  ( WindowModeWindow
  | WindowModeBorderless
  | WindowModeFullscreen
  )

struct KoreWindowOptions
  var title: Pointer[U8] tag
  var width: I32 = 800
  var height: I32 = 600
  var x: I32 = -1
  var y: I32 = -1
  var target_display: I32 = -1
  var vsync: Bool = true
  var resizable: Bool = false
  var maximizable: Bool = false
  var minimizable: Bool = true
  var mode: I32 = WindowModeWindow() // W_Kore_WindowMode enum
  var show_window: Bool = true
  embed renderer_options: KoreRendererOptions = KoreRendererOptions

  new create(title': String val = "KoreWindow") =>
    title = title'.cstring()
