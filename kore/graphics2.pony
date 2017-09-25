use "lib:korec"

use "collections"

/* FFI to WC_Kore_Graphics2_Graphics2 */
use @Kore_Graphics2_Graphics2_create[
  Pointer[_KoreGraphics2Handle] tag](
    width: I32,
    height: I32,
    render_targets: Bool)
use @Kore_Graphics2_Graphics2_destroy[None](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_drawTexture[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  texture: Pointer[_KoreGraphics4TextureHandle] tag,
  x: F32,
  y: F32)
use @Kore_Graphics2_Graphics2_drawScaledSubTexture[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  texture: Pointer[_KoreGraphics4TextureHandle] tag,
  sx: F32, sy: F32, sw: F32, sh: F32,
  dx: F32, dy: F32, dw: F32, dh: F32)
use @Kore_Graphics2_Graphics2_drawRenderTarget[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  render_target: Pointer[_KoreGraphics4RenderTargetHandle] tag,
  x: F32,
  y: F32)
use @Kore_Graphics2_Graphics2_drawScaledSubRenderTarget[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  render_target: Pointer[_KoreGraphics4RenderTargetHandle] tag,
  sx: F32, sy: F32, sw: F32, sh: F32,
  dx: F32, dy: F32, dw: F32, dh: F32)
use @Kore_Graphics2_Graphics2_drawRect[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  x: F32,
  y: F32,
  width: F32,
  height: F32,
  strength: F32)
use @Kore_Graphics2_Graphics2_fillRect[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  x: F32,
  y: F32,
  width: F32,
  height: F32)
use @Kore_Graphics2_Graphics2_drawStringTXY[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  text: Pointer[U8] tag,
  x: F32,
  y: F32)
use @Kore_Graphics2_Graphics2_drawStringTLXY[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  text: Pointer[U8] tag,
  length: I32,
  x: F32,
  y: F32)
use @Kore_Graphics2_Graphics2_drawStringTSLXY[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  text: Pointer[U8] tag,
  start: I32,
  length: I32,
  x: F32,
  y: F32)
use @Kore_Graphics2_Graphics2_drawLine[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  x1: F32,
  y1: F32,
  x2: F32,
  y2: F32,
  strength: F32)
use @Kore_Graphics2_Graphics2_fillTriangle[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  x1: F32,
  y1: F32,
  x2: F32,
  y2: F32,
  x3: F32,
  y3: F32)
use @Kore_Graphics2_Graphics2_setPipeline[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  pipeline: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics2_Graphics2_scissor[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  x: I32,
  y: I32,
  width: I32,
  height: I32)
use @Kore_Graphics2_Graphics2_disableScissor[None](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_begin[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  render_targets: Bool,
  width: I32,
  height: I32,
  clear: Bool,
  clear_color: U32)
use @Kore_Graphics2_Graphics2_clear[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  color: U32)
use @Kore_Graphics2_Graphics2_flush[None](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_end[None](
  self: Pointer[_KoreGraphics2Handle] tag)
// TODO: Video type, impl in Kore unfinished?
// use @Kore_Graphics2_Graphics2_drawVideoInternal[None](
//   self: Pointer[_KoreGraphics2Handle] tag,
//   video: Pointer[_KoreVideoHandle] tag,
//   x: F32,
//   y: F32,
//   width: F32,
//   height: F32)
// use @Kore_Graphics2_Graphics2_drawVideo[None](
//   self: Pointer[_KoreGraphics2Handle] tag,
//   video: Pointer[_KoreVideoHandle] tag,
//   x: F32,
//   y: F32,
//   width: F32,
//   height: F32)
use @Kore_Graphics2_Graphics2_getColor[U32](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_setColor[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  color: U32)
use @Kore_Graphics2_Graphics2_getOpacity[F32](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_setOpacity[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  opacity: F32)
use @Kore_Graphics2_Graphics2_getImageScaleQuality[I32](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_setImageScaleQuality[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  value: I32)
use @Kore_Graphics2_Graphics2_getMipmapScaleQuality[I32](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_setMipmapScaleQuality[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  value: I32)
use @Kore_Graphics2_Graphics2_getFont[
  Pointer[_KoreKravurHandle] tag](
    self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_setFont[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  font: Pointer[_KoreKravurHandle] tag)
use @Kore_Graphics2_Graphics2_getFontSize[I32](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_setFontSize[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  value: I32)
use @Kore_Graphics2_Graphics2_getFontColor[U32](
  self: Pointer[_KoreGraphics2Handle] tag)
use @Kore_Graphics2_Graphics2_setFontColor[None](
  self: Pointer[_KoreGraphics2Handle] tag,
  color: U32)
// TODO: Matrix Type
// use @Kore_Graphics2_Graphics2_getTransformation[
//   Pointer[_KoreMat3Handle] tag](
//     self: Pointer[_KoreGraphics2Handle] tag)
// TODO: Matrix Type
// use @Kore_Graphics2_Graphics2_setTransformation[None](
//   self: Pointer[_KoreGraphics2Handle] tag,
//   transformation: Pointer[_KoreMat3Handle] tag)

primitive ImageScaleQualityLow
  fun apply(): I32 => 0
primitive ImageScaleQualityHigh
  fun apply(): I32 => 1

primitive ToKoreGraphics2ImageScaleQuality
  fun from(value: I32): KoreGraphics2ImageScaleQuality =>
    match value
    | 0 => ImageScaleQualityLow
    | 1 => ImageScaleQualityHigh
    else
      ImageScaleQualityLow
    end

type KoreGraphics2ImageScaleQuality is
  ( ImageScaleQualityLow
  | ImageScaleQualityHigh
  )


// TODO: Parameter defaults

primitive _KoreGraphics2Handle

/*

Kha Graphics2 extras
https://github.com/Kode/Kha/blob/master/Sources/kha/graphics2/Graphics.hx

Kha Graphics2 Extensions
https://github.com/Kode/Kha/blob/master/Sources/kha/graphics2/GraphicsExtension.hx

*/
class KoreGraphics2
  let _handle: Pointer[_KoreGraphics2Handle] tag
  let _target: Canvas
  let _render_targets: Bool
  var _render_target: (KoreGraphics4RenderTarget | None) = None
  var _g4: KoreGraphics4
  let _opacities: Array[F32]
  // var _font: (KoreKravur | None) = None
  var _font: (Font ref | None) = None
  var _font_style: String val = "Regular"
  var _font_size: F32 = 14

  new create(target: Canvas) =>
    _target = target
    _g4 = _target.g4()
    _opacities = _opacities.create()
    _opacities.push(1.0)

    match _target
    | let fb: Framebuffer =>
      _render_targets = false
    | let cube_map: CubeMap =>
      _render_target = cube_map._get_render_target()
      _render_targets = true
    | let image: Image =>
      _render_target = image._get_render_target()
      _render_targets = true
    else
      _render_targets = false
    end

    _handle = @Kore_Graphics2_Graphics2_create(
      _target.width(), _target.height(), _render_targets)

  fun draw_image(img: Image, x: F32, y: F32) =>
    match img._get_texture()
    | let texture: KoreGraphics4Texture =>
      @Kore_Graphics2_Graphics2_drawTexture(
        _handle, texture._get_handle(), x, y)
    else
      match img._get_render_target()
      | let rt: KoreGraphics4RenderTarget =>
        @Kore_Graphics2_Graphics2_drawRenderTarget(
        _handle, rt._get_handle(), x, y)
      end
    end

  fun draw_sub_image(
    img: Image,
    x: F32, y: F32,
    sx: F32, sy: F32,
    sw: F32, sh: F32)
  =>
    draw_scaled_sub_image(img, sx, sy, sw, sh, x, y, sw, sh)

  fun draw_scaled_image(
    img: Image,
    dx: F32, dy: F32,
    dw: F32, dh: F32)
  =>
    draw_scaled_sub_image(
      img, 0, 0, F32.from[I32](img.width()), F32.from[I32](img.height()),
      dx, dy, dw, dh)

  fun draw_scaled_sub_image(
    img: Image,
    sx: F32, sy: F32, sw: F32, sh: F32,
    dx: F32, dy: F32, dw: F32, dh: F32)
  =>
    match img._get_texture()
    | let texture: KoreGraphics4Texture =>
      @Kore_Graphics2_Graphics2_drawScaledSubTexture(
        _handle, texture._get_handle(), sx, sy, sw, sh, dx, dy, dw, dh)
    else
      match img._get_render_target()
      | let rt: KoreGraphics4RenderTarget =>
        @Kore_Graphics2_Graphics2_drawScaledSubRenderTarget(
        _handle, rt._get_handle(), sx, sy, sw, sh, dx, dy, dw, dh)
      end
    end

  fun draw_rect(
    x: F32,
    y: F32,
    width: F32,
    height: F32,
    strength: F32 = 1.0)
  =>
    @Kore_Graphics2_Graphics2_drawRect(_handle, x, y, width, height, strength)

  fun fill_rect(
    x: F32,
    y: F32,
    width: F32,
    height: F32)
  =>
    @Kore_Graphics2_Graphics2_fillRect(_handle, x, y, width, height)

  fun draw_line(
    x1: F32,
    y1: F32,
    x2: F32,
    y2: F32,
    strength: F32 = 1.0)
  =>
    @Kore_Graphics2_Graphics2_drawLine(_handle ,x1, y1, x2, y2, strength)

  fun fill_triangle(
    x1: F32,
    y1: F32,
    x2: F32,
    y2: F32,
    x3: F32,
    y3: F32)
  =>
    @Kore_Graphics2_Graphics2_fillTriangle(_handle, x1, y1, x2, y2, x3, y3)

  fun draw_circle(
    cx: F32,
    cy: F32,
    radius: F32,
    strength: F32 = 1.0,
    segments: I32 = 0)
  =>
    let segments': USize =
      if segments <= 0 then
        USize.from[F32]((10 * radius.sqrt()).floor())
      else
        USize.from[I32](segments)
      end

    let theta = (2 * F32.pi()) / F32.from[USize](segments')
    let c = theta.cos()
    let s = theta.sin()
    var x = radius
    var y = F32(0)

    for n in Range(0, segments') do
      let px = x + cx
      let py = y + cy

      let t = x
      x = (c * x) - (s * y)
      y = (c * y) + (s * t)

      draw_line(px, py, (x + cx), (y + cy), strength)
    end

  fun fill_circle(
    cx: F32,
    cy: F32,
    radius: F32,
    segments: I32 = 0)
  =>
    let segments': USize =
      if segments <= 0 then
        USize.from[F32]((10 * radius.sqrt()).floor())
      else
        USize.from[I32](segments)
      end

    let theta = (2 * F32.pi()) / F32.from[USize](segments')
    let c = theta.cos()
    let s = theta.sin()
    var x = radius
    var y = F32(0)

    for n in Range(0, segments') do
      let px = x + cx
      let py = y + cy

      let t = x
      x = (c * x) - (s * y)
      y = (c * y) + (s * t)

      fill_triangle(px, py, (x + cx), (y + cy), cx, cy)
    end

// draw_polygon ++ Requires Vec
// fill_polygon ++ Requires Vec

  fun draw_cubic_bezier(
    x: Array[F32],
    y: Array[F32],
    strength: F32 = 1.0,
    segments: USize = 20)
  =>
    try
      var t: F32 = 0
      var q0 = _calculate_cubic_bezier_point(0, x, y)?
      var q1 = Array[F32]

      for i in Range(1, (segments + 1)) do
        t = F32.from[USize](i) / F32.from[USize](segments)
        q1 = _calculate_cubic_bezier_point(t, x, y)?
        draw_line(q0(0)?, q0(1)?, q1(0)?, q1(1)?, strength)
        q0 = q1
      end
    end

  fun draw_cubic_bezier_path(
    x: Array[F32],
    y: Array[F32],
    strength: F32 = 1.0,
    segments: USize = 20)
  =>
    try
      var i: USize = 0
      var t: F32 = 0
      var q0 = Array[F32]
      var q1 = Array[F32]

      while i < (x.size() - 3) do
        if i == 0 then
          q0 = _calculate_cubic_bezier_point(
            0,
            [x(i)?; x(i + 1)?; x(i + 2)?; x(i + 3)?],
            [y(i)?; y(i + 1)?; y(i + 2)?; y(i + 3)?])?
        end

        for j in Range(1, (segments + 1)) do
          t = F32.from[USize](j) / F32.from[USize](segments)
          q1 = _calculate_cubic_bezier_point(
            t,
            [x(i)?; x(i + 1)?; x(i + 2)?; x(i + 3)?],
            [y(i)?; y(i + 1)?; y(i + 2)?; y(i + 3)?])?
          draw_line(q0(0)?, q0(1)?, q1(0)?, q1(1)?, strength)
          q0 = q1
        end

        i = i + 3
      end
    end


  fun _calculate_cubic_bezier_point(
    t: F32,
    x: Array[F32],
    y: Array[F32])
    : Array[F32] ?
  =>
    let u: F32 = 1 - t
		let tt: F32 = t * t
		let uu: F32 = u * u
		let uuu: F32 = uu * u
		let ttt: F32 = tt * t

		// first term
		var p: Array[F32] = [(uuu * x(0)?); (uuu * y(0)?)]

		// second term
		p(0)? = p(0)? + (3 * uu * t * x(1)?)
		p(1)? = p(1)? + (3 * uu * t * y(1)?)

		// third term
		p(0)? = p(0)? + (3 * u * tt * x(2)?)
		p(1)? = p(1)? + (3 * u * tt * y(2)?)

		// fourth term
		p(0)? = p(0)? + (ttt * x(3)?)
		p(1)? = p(1)? + (ttt * y(3)?)
    p

  fun ref set_pipeline(pipeline: KoreGraphics4PipelineState) =>
    @Kore_Graphics2_Graphics2_setPipeline(
      _handle, pipeline._get_handle())

  fun ref revert_pipeline() =>
    """Revert pipeline back to the builtin."""
    @Kore_Graphics2_Graphics2_setPipeline(
      _handle, Pointer[_KoreGraphics4PipelineStateHandle].create())

  fun scissor(x: I32, y: I32, width: I32, height: I32) =>
    @Kore_Graphics2_Graphics2_scissor(_handle, x, y, width, height)

  fun disable_scissor() =>
    @Kore_Graphics2_Graphics2_disableScissor(_handle)

  fun ref begin_gfx(
    clear': Bool = true,
    clear_color: U32 = Colors.black())
  =>
    _g4.begin_gfx()
    @Kore_Graphics2_Graphics2_begin(
      _handle, _render_targets, -1, -1, clear', clear_color)

  fun clear(
    color: U32 = Colors.black())
  =>
    @Kore_Graphics2_Graphics2_clear(_handle, color)

  fun flush() =>
    @Kore_Graphics2_Graphics2_flush(_handle)

  fun end_gfx() =>
    @Kore_Graphics2_Graphics2_end(_handle)
    _g4.end_gfx()

// draw_video_internal
// draw_video

  fun get_color(): U32 =>
    @Kore_Graphics2_Graphics2_getColor(_handle)

  fun ref set_color(color: U32) =>
    @Kore_Graphics2_Graphics2_setColor(_handle, color)

  fun get_opacity(): F32 =>
    @Kore_Graphics2_Graphics2_getOpacity(_handle)

  fun ref set_opacity(opacity: F32): F32 =>
    @Kore_Graphics2_Graphics2_setOpacity(_handle, opacity)
    try
      _opacities(_opacities.size() - 1)? = opacity
    else
      F32(1.0)
    end

  fun ref push_opacity(opacity: F32) =>
    @Kore_Graphics2_Graphics2_setOpacity(_handle, opacity)
    _opacities.push(opacity)

  fun ref pop_opacity(): F32 =>
    let popped =
      try
        let popped' = _opacities.pop()?
        if _opacities.size() == 0 then
          _opacities.push(1.0)
        end
        popped'
      else
        _opacities.push(1.0)
        F32(1.0)
      end
    let next =
      try
        _opacities(_opacities.size() - 1)?
      else
        F32(1.0)
      end
    @Kore_Graphics2_Graphics2_setOpacity(_handle, next)
    popped

  fun get_image_scale_quality(): KoreGraphics2ImageScaleQuality =>
    ToKoreGraphics2ImageScaleQuality.from(
      @Kore_Graphics2_Graphics2_getImageScaleQuality(_handle))

  fun ref set_image_scale_quality(value: KoreGraphics2ImageScaleQuality) =>
    @Kore_Graphics2_Graphics2_setImageScaleQuality(_handle, value())

  fun get_mipmap_scale_quality(): KoreGraphics2ImageScaleQuality =>
    ToKoreGraphics2ImageScaleQuality.from(
      @Kore_Graphics2_Graphics2_getMipmapScaleQuality(_handle))

  fun ref set_mipmap_scale_quality(value: KoreGraphics2ImageScaleQuality) =>
    @Kore_Graphics2_Graphics2_setMipmapScaleQuality(_handle, value())

  fun ref get_font(): (Font ref | None) =>
    _font

  fun ref set_font(font: Font ref) =>
    _font = font

// TODO: `fontGlyphs` are private in Kore::Graphics2::Graphics2
// get_font_glyphs +
// set_font_glyphs +

  fun get_font_size(): F32 =>
    _font_size

  fun ref set_font_size(size: F32) =>
    _font_size = size

  fun get_font_style(): String val =>
    _font_style

  fun ref set_font_style(style: String val) =>
    _font_style = style

  fun get_font_color(): U32 =>
    @Kore_Graphics2_Graphics2_getFontColor(_handle)

  fun ref set_font_color(color: U32) =>
    @Kore_Graphics2_Graphics2_setFontColor(_handle, color)

  // Be careful to keep reference to the text String.
  fun ref draw_string(text: String val, x: F32, y: F32) =>
    match _font
    | let font: Font ref =>
      // Attempt to get a KoreKravur by applying the assigned style and size
      try
        let kravur: KoreKravur = font(_font_size, _font_style)?
        @Kore_Graphics2_Graphics2_setFont(_handle, kravur._get_handle())
        @Kore_Graphics2_Graphics2_drawStringTXY(_handle, text.cstring(), x, y)
      //else
        // TODO: Log warning when no matching font style and size?
      end
    | None => None
      // TODO: Log warning when attempt to draw_string sans assigned font?
    end

  // Be careful to keep reference to the text String.
  fun ref draw_sub_string(
    text: String val,
    start: I32,
    length: I32,
    x: F32,
    y: F32)
  =>
    match _font
    | let font: Font ref =>
      // Attempt to get a KoreKravur by applying the assigned style and size
      try
        let kravur: KoreKravur = font(_font_size, _font_style)?
        @Kore_Graphics2_Graphics2_setFont(_handle, kravur._get_handle())
        @Kore_Graphics2_Graphics2_drawStringTSLXY(
          _handle, text.cstring(), start, length, x, y)
      //else
        // TODO: Log warning when no matching font style and size?
      end
    | None => None
      // TODO: Log warning when attempt to draw_string sans assigned font?
    end

    // @Kore_Graphics2_Graphics2_drawStringTSLXY(
    //   _handle, text.cstring(), start, length, x, y)

// get_transformation
// set_transformation
// push_transformation +
// pop_transformation +
// translate +
// push_translation +
// rotate +
// push_rotation +

  fun _get_handle(): Pointer[_KoreGraphics2Handle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics2_Graphics2_destroy(_handle)
