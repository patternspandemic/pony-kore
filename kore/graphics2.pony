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
  pipeline: Pointer[_KoreGraphics4PipelineState] tag)
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
  var _target: (Canvas | None)
  var _render_target: (KoreGraphics4RenderTarget | None) = None
  var _g4: (KoreGraphics4 | None) = None

  new create(target: (Canvas | None) = None) =>
    _target = target
    let width': I32
    let height': I32
    let target_is_rt': Bool = false

    match _target
    | let fb: Framebuffer =>
      target_is_rt' = false
      width' = KoreSystemPrimitive.window_width()
      height' = KoreSystemPrimitive.window_height()
      _g4 = fb.g4()
    | let cube_map: CubeMap =>
      _render_target = cube_map._get_render_target()
      target_is_rt' = true
      width' = cube_map.width()
      height' = cube_map.height()
      _g4 = cube_map.g4()
    | let image: Image =>
      _render_target = image._get_render_target()
      target_is_rt' = true
      width' = image.width()
      height' = image.height()
      _g4 = image.g4()
    else
      width' = KoreSystemPrimitive.window_width()
      height' = KoreSystemPrimitive.window_height()
    end

    _handle = @Kore_Graphics2_Graphics2_create(width', height', target_is_rt')



/*

draw_image
draw_scaled_sub_image
draw_rect
fill_rect
draw_string
draw_sub_string? (draw_characters in Kha?)
draw_line
fill_triangle
set_pipeline
scissor
disable_scissor
begin // Add 2 versions, one that includes g4.begin, the other not
clear
flush
end  // Add 2 versions, one that includes g4.end, the other not
draw_video_internal
draw_video
get_color
set_color
get_opacity
set_opacity
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
