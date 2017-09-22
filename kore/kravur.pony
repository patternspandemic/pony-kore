use "lib:korec"

/* FFI to WC_Kore_Kravur */
use @Kore_Kravur_destroy[None](
  self: Pointer[_KoreKravurHandle] tag)
use @Kore_Kravur_getTexture[Pointer[_KoreGraphics4TextureHandle] tag](
  self: Pointer[_KoreKravurHandle] tag)
use @Kore_Kravur_getBakedQuad[None](
  self: Pointer[_KoreKravurHandle] tag,
  char_index: I32,
  xpos: F32,
  ypos: F32,
  aligned_quad_out: KravurAlignedQuad)
// Kore_Kravur_getSize calls Kore::Kravur::getHeight, so
// as not to be confused with the getHeight accessor.
use @Kore_Kravur_getSize[F32](
  self: Pointer[_KoreKravurHandle] tag)
use @Kore_Kravur_charsWidth[F32](
  self: Pointer[_KoreKravurHandle] tag,
  chars: Pointer[U8] tag,
  offset: I32,
  length: I32)
use @Kore_Kravur_stringWidth[F32](
  self: Pointer[_KoreKravurHandle] tag,
  string: Pointer[U8] tag,
  length: I32)
use @Kore_Kravur_getBaselinePosition[F32](
  self: Pointer[_KoreKravurHandle] tag)
use @Kore_Kravur_getWidth[I32](
  self: Pointer[_KoreKravurHandle] tag)
use @Kore_Kravur_getHeight[I32](
  self: Pointer[_KoreKravurHandle] tag)
use @Kore_Kravur_load[Pointer[_KoreKravurHandle] tag](
  name: Pointer[U8] tag,
  style: KravurFontStyle,
  size: F32)


struct KravurFontStyle
  var bold: Bool = false
  var italic: Bool = false
  var underlined: Bool = false

  new create(
    bold': Bool = false,
    italic': Bool = false,
    underlined': Bool = false)
  =>
    bold = bold'
    italic = italic'
    underlined = underlined'

struct KravurBakedChar
  // coordinates of bbox in bitmap
  var x0: I32 = -1
  var y0: I32 = 0
  var x1: I32 = 0
  var y1: I32 = 0
  var xoff: F32 = 0.0
  var yoff: F32 = 0.0
  var xadvance: F32 = 0.0

struct KravurAlignedQuad
  // top-left
  var x0: F32 = -1.0
  var y0: F32 = 0.0
  var s0: F32 = 0.0
  var t0: F32 = 0.0
  // bottom-right
  var x1: F32 = 0.0
  var y1: F32 = 0.0
  var s1: F32 = 0.0
  var t1: F32 = 0.0
  var xadvance: F32 = 0.0

primitive _KoreKravurHandle

class KoreKravur
  let _handle: Pointer[_KoreKravurHandle] tag
  let _name: String val
  let _style: KravurFontStyle
  let _texture: KoreGraphics4Texture // (KoreGraphics4Texture | None) = None

  new create(name: String val, style: KravurFontStyle, size: F32) =>
    _name = name
    _style = style
    _handle = @Kore_Kravur_load(_name.cstring(), _style, size)
    _texture = KoreGraphics4Texture._from_handle(
        @Kore_Kravur_getTexture(_handle))

  fun ref get_texture(): (KoreGraphics4Texture | None) =>
    _texture

  fun get_baked_quad(
    char_index: I32,
    xpos: F32,
    ypos: F32)
    : KravurAlignedQuad
  =>
    let aligned_quad = KravurAlignedQuad
    @Kore_Kravur_getBakedQuad(_handle, char_index, xpos, ypos, aligned_quad)
    aligned_quad

  fun get_size(): F32 =>
    @Kore_Kravur_getSize(_handle)

  fun chars_width(
    chars: String val,
    offset: I32,
    length: I32)
    : F32
  =>
    // TODO: May need to store `chars` String!
    @Kore_Kravur_charsWidth(_handle, chars.cstring(), offset, length)

  fun string_width(
    string: String val,
    length: I32)
    : F32
  =>
    // TODO: May need to store `string` String!
    @Kore_Kravur_stringWidth(_handle, string.cstring(), length)

  fun get_baseline_position(): F32 =>
    @Kore_Kravur_getBaselinePosition(_handle)

  fun get_width(): I32 =>
    @Kore_Kravur_getWidth(_handle)

  fun get_height(): I32 =>
    @Kore_Kravur_getHeight(_handle)

  fun _get_handle(): Pointer[_KoreKravurHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Kravur_destroy(_handle)
