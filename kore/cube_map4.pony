use "lib:korec"

class CubeMap is Canvas
  var _texture: (KoreGraphics4Texture | None) = None
  var _render_target: (KoreGraphics4RenderTarget | None) = None

  var _format: KoreGraphics1ImageFormat
  var _readable: Bool

  var _graphics1: (KoreGraphics1 | None) = None
  var _graphics2: (KoreGraphics2 | None) = None
  var _graphics4: (KoreGraphics4 | None) = None

  /*

  TODO: Non render target constructors for CubeMap. Kha's Kore backend is missing any other that createRenderTarget.

  */

  new create_render_target(
    size: I32,
    format: KoreGraphics1ImageFormat = FormatRGBA32,
    // DepthStencilFormat missing enum in Kore, made one as in Kha
    depth_stencil: KoreGraphics4DepthStencilFormat =
      DepthStencilFormatNoDepthAndStencil,
    context_id: I32 = 0)
  =>
    _readable = false
    _format = format
    let depth_buffer_bits =
      _DepthStencilFormatHelper.get_depth_buffer_bits(depth_stencil)
    let stencil_buffer_bits =
      _DepthStencilFormatHelper.get_stencil_buffer_bits(depth_stencil)
    let rt_format: KoreGraphics4RenderTargetFormat =
      _ImageFormatToRenderTargetFormatHelper.get_render_target_format(_format)
    _render_target = KoreGraphics4RenderTarget.cube_map(
        size, depth_buffer_bits, false, rt_format,
        stencil_buffer_bits, context_id)

  fun ref unload() =>
    _texture = None
    _render_target = None

  /*
  lock and unlock are no-ops for render targets, see:
  https://github.com/Kode/Kha/blob/master/Backends/Kore/kha/graphics4/CubeMap.hx#L90
  */

  fun ref width(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_width()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_width()
      else
        I32(0)
      end
    end

  fun ref height(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_height()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_height()
      else
        I32(0)
      end
    end

  fun ref g1(): KoreGraphics1 =>
    try
      _graphics1 as KoreGraphics1
    else
      var g1': KoreGraphics1 ref = KoreGraphics1(this)
      _graphics1 = g1'
      g1'
    end

  fun ref g2(): KoreGraphics2 =>
    try
      _graphics2 as KoreGraphics2
    else
      var g2': KoreGraphics2 ref = KoreGraphics2(this)
      _graphics2 = g2'
      g2'
    end

  fun ref g4(): KoreGraphics4 =>
    try
      _graphics4 as KoreGraphics4
    else
      var g4': KoreGraphics4 ref = KoreGraphics4(this)
      _graphics4 = g4'
      g4'
    end

  fun is_texture(): Bool =>
    not (_texture is None)

  fun is_render_target(): Bool =>
    not (_render_target is None)

  fun ref _get_texture(): (KoreGraphics4Texture | None) =>
    _texture

  fun ref _get_render_target(): (KoreGraphics4RenderTarget | None) =>
    _render_target
