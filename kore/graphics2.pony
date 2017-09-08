use "lib:korec"

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
// TODO: Kravur type
// use @Kore_Graphics2_Graphics2_getFont[
//   Pointer[_KoreKravurHandle] tag](
//     self: Pointer[_KoreGraphics2Handle] tag)
// use @Kore_Graphics2_Graphics2_setFont[None](
//   self: Pointer[_KoreGraphics2Handle] tag,
//   font: Pointer[_KoreKravurHandle] tag)
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


// TODO: Parameter defaults

primitive _KoreGraphics2Handle

class KoreGraphics2
  let _handle: Pointer[_KoreGraphics2Handle] tag
  let _target: Canvas
  let _render_targets: Bool
  var _render_target: (KoreGraphics4RenderTarget | None) = None
  var _g4: KoreGraphics4

  new create(target: Canvas) =>
    _target = target
    _g4 = _target.g4()

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

  fun get_color(): U32 =>
    @Kore_Graphics2_Graphics2_getColor(_handle)

  fun set_color(color: U32) =>
    @Kore_Graphics2_Graphics2_setColor(_handle, color)

  fun get_opacity(): F32 =>
    @Kore_Graphics2_Graphics2_getOpacity(_handle)

  fun set_opacity(opacity: F32) =>
    @Kore_Graphics2_Graphics2_setOpacity(_handle, opacity)


/*

draw_image
draw_scaled_sub_image
draw_string
draw_sub_string? (draw_characters in Kha?)
set_pipeline
scissor
disable_scissor
begin // sans g4, what to call?
end  // sans g4, what to call?
draw_video_internal
draw_video
get_font
set_font
get_font_size
set_font_size
get_font_color
set_font_color

get_transformation
set_transformation

// Kha Graphics2 extras
// https://github.com/Kode/Kha/blob/master/Sources/kha/graphics2/Graphics.hx

draw_sub_image
draw_scaled_image
get_font_glyphs
set_font_glyphs
push_transformation
pop_transformation
translate
push_translation
rotate
push_rotation
push_opacity
pop_opacity
get_pipeline? may not be accessible

*/

  fun _get_handle(): Pointer[_KoreGraphics2Handle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics2_Graphics2_destroy(_handle)
