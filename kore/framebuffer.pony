class Framebuffer
  var _window_id: I32
  var _graphics1: KoreGraphics1
  var _graphics2: KoreGraphics2
  var _graphics4: KoreGraphics4

  new create(
    window_id: I32,
    g1': KoreGraphics1 = KoreGraphics1,
    g2': KoreGraphics2 = KoreGraphics2,
    g4': KoreGraphics4 = KoreGraphics4)
  =>
    _window_id = window_id
    _graphics1 = g1'
    _graphics2 = g2'
    _graphics4 = g4'

  fun ref apply(
    g1': KoreGraphics1,
    g2': KoreGraphics2,
    g4': KoreGraphics4)
  =>
    _graphics1 = g1'
    _graphics2 = g2'
    _graphics4 = g4'

  fun ref g1(): KoreGraphics1 =>
    _graphics1

  fun ref g2(): KoreGraphics2 =>
    _graphics2

  fun ref g4(): KoreGraphics4 =>
    _graphics4

  fun width(): I32 =>
    KoreSystemPrimitive.window_width(_window_id)

  fun height(): I32 =>
    KoreSystemPrimitive.window_height(_window_id)
