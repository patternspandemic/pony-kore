class Framebuffer
  var _window_id: I32
  var _graphics1: (KoreGraphics1 | None)
  var _graphics2: (KoreGraphics2 | None)
  var _graphics4: (KoreGraphics4 | None)

  new create(
    window_id: I32,
    g1': (KoreGraphics1 | None) = None,
    g2': (KoreGraphics2 | None) = None,
    g4': (KoreGraphics4 | None) = None)
  =>
    _window_id = window_id
    _graphics1 = g1'
    _graphics2 = g2'
    _graphics4 = g4'

  fun ref apply(
    g1': (KoreGraphics1 | None) = None,
    g2': (KoreGraphics2 | None) = None,
    g4': (KoreGraphics4 | None) = None)
  =>
    _graphics1 = g1'
    _graphics2 = g2'
    _graphics4 = g4'

  // fun ref g1(): KoreGraphics1 =>
  //   _graphics1
  fun ref g1(): KoreGraphics1 =>
    try
      _graphics1 as KoreGraphics1
    else
      var g1': KoreGraphics1 ref = KoreGraphics1(this)
      _graphics1 = g1'
      g1'
    end

  // fun ref g2(): KoreGraphics2 =>
  //   _graphics2
  fun ref g2(): KoreGraphics2 =>
    try
      _graphics2 as KoreGraphics2
    else
      var g2': KoreGraphics2 ref = KoreGraphics2(this)
      _graphics2 = g2'
      g2'
    end

  // fun ref g4(): KoreGraphics4 =>
  //   _graphics4
  fun ref g4(): KoreGraphics4 =>
    try
      _graphics4 as KoreGraphics4
    else
      var g4': KoreGraphics4 ref = KoreGraphics4(this)
      _graphics4 = g4'
      g4'
    end

  fun width(): I32 =>
    KoreSystemPrimitive.window_width(_window_id)

  fun height(): I32 =>
    KoreSystemPrimitive.window_height(_window_id)
