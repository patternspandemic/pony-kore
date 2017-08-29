primitive Colors
  fun black(): U32 => 0xff000000
  fun white(): U32 => 0xffffffff
  fun red(): U32 => 0xffff0000
  fun blue(): U32 => 0xff0000ff
  fun green(): U32 => 0xff00ff00
  fun magenta(): U32 => 0xffff00ff
  fun yellow(): U32 => 0xffffff00
  fun cyan(): U32 => 0xff00ffff
  fun purple(): U32 => 0xff800080
  fun pink(): U32 => 0xffffc0cb
  fun orange(): U32 => 0xffffa500
  fun transparent(): U32 => 0x00000000

// https://github.com/Kode/Kha/blob/master/Sources/kha/Color.hx
class Color
  var _bytes: U32
  let _inv_max_channel_value: F32 = F32(1) / F32(255)

  new create(color: U32) =>
    """Create a Color object from a packed 32 bit ARGB value."""
    _bytes = color

  new from_bytes(r: I32, g: I32, b: I32, a: I32 = 255) =>
    """Create a Color object from components in the range 0 - 255."""
    _bytes = U32.from[I32]((a << 24) or (r << 16) or (g << 8) or b)

  new from_floats(r: F32, g: F32, b: F32, a: F32 = 1) =>
    """Create a Color object from components in the range 0 - 1."""
    _bytes = U32.from[I32](
      (I32.from[F32](a * 255) << 24) or
      (I32.from[F32](r * 255) << 16) or
      (I32.from[F32](g * 255) << 8) or
      (I32.from[F32](b * 255)))

// TODO: Color.from_string
/*
  new from_string(value: String) ? =>
    """Create a Color object from #AARRGGBB string."""
    accept value size to be 7(#RRGGBB) or 9(#AARRGGBB), error otherwise
    build string "0x" + value.substring(1)
    parse it as an I32
    if orig length was 7, add 0xFF000000, full alpha
    assign to _bytes
*/

  fun apply(): U32 =>
    _bytes

// TODO: Color getters/setters for components, as bytes and floats
/*
  fun get_a(): F32
  fun set_a(value: F32): F32 // return new value
  fun get_ab(): I32
  fun set_ab(value: I32): I32 // return new value

  fun get_r(): F32
  fun set_r(value: F32): F32 // return new value
  fun get_rb(): I32
  fun set_rb(value: I32): I32 // return new value

  fun get_g(): F32
  fun set_g(value: F32): F32 // return new value
  fun get_gb(): I32
  fun set_gb(value: I32): I32 // return new value

  fun get_b(): F32
  fun set_b(value: F32): F32 // return new value
  fun get_bb(): I32
  fun set_bb(value: I32): I32 // return new value
*/
