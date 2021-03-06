use "lib:korec"

use @Kore_Graphics1_Color_create[Pointer[_KoreGraphics1ColorHandle] tag](
  color: U32)
use @Kore_Graphics1_Color_destroy[None](
  self: Pointer[_KoreGraphics1ColorHandle] tag)


primitive ImageCompressionNone
  fun apply(): I32 => 0
primitive ImageCompressionDXT5
  fun apply(): I32 => 1
primitive ImageCompressionASTC
  fun apply(): I32 => 2
primitive ImageCompressionPVRTC
  fun apply(): I32 => 3

primitive ToKoreGraphics1ImageCompression
  fun from(value: I32): KoreGraphics1ImageCompression =>
    match value
    | 0 => ImageCompressionNone
    | 1 => ImageCompressionDXT5
    | 2 => ImageCompressionASTC
    | 3 => ImageCompressionPVRTC
    else
      ImageCompressionNone
    end

type KoreGraphics1ImageCompression is
  ( ImageCompressionNone
  | ImageCompressionDXT5
  | ImageCompressionASTC
  | ImageCompressionPVRTC
  )

primitive FormatRGBA32
  fun apply(): I32 => 0
primitive FormatGrey8
  fun apply(): I32 => 1
primitive FormatRGB24
  fun apply(): I32 => 2
primitive FormatRGBA128
  fun apply(): I32 => 3
primitive FormatRGBA64
  fun apply(): I32 => 4
primitive FormatA32
  fun apply(): I32 => 5
primitive FormatBGRA32
  fun apply(): I32 => 6
primitive FormatA16
  fun apply(): I32 => 7

primitive ToKoreGraphics1ImageFormat
  fun from(value: I32): KoreGraphics1ImageFormat =>
    match value
    | 0 => FormatRGBA32
    | 1 => FormatGrey8
    | 2 => FormatRGB24
    | 3 => FormatRGBA128
    | 4 => FormatRGBA64
    | 5 => FormatA32
    | 6 => FormatBGRA32
    | 7 => FormatA16
    else
      FormatGrey8
    end

type KoreGraphics1ImageFormat is
  ( FormatRGBA32
  | FormatGrey8
  | FormatRGB24
  | FormatRGBA128
  | FormatRGBA64
  | FormatA32
  | FormatBGRA32
  | FormatA16
  )

primitive _KoreGraphics1ColorHandle

// TODO: Replace with a Color class/setup more like in Kha
// No need to use Kore's color object's up front, U32 (uint)
// is used for all public functions/methods.
class val KoreGraphics1Color
  let _handle: Pointer[_KoreGraphics1ColorHandle] tag

  new create(color: U32) =>
    _handle = @Kore_Graphics1_Color_create(color)

  fun _get_handle(): Pointer[_KoreGraphics1ColorHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics1_Color_destroy(_handle)

primitive _KoreGraphics1ImageHandle


// TODO: KoreGraphics1Image class
class KoreGraphics1Image


// TODO: KoreGrahics1 class
class KoreGraphics1
  var _target: (Canvas | None)
  // var _render_target: (KoreGraphics4RenderTarget | None) = None

  new create(target: (Canvas | None) = None) =>
    _target = target
    /*
    match _target
    | None => None
    // TODO: Requires implementation of CubeMap, Image
    // | let cube_map: CubeMap => _render_target = cube_map._get_render_target()
    | let image: Image => _render_target = image._get_render_target()
    end
    */