use "lib:korec"

use @Kore_Random_init[None]()
use @Kore_Random_initSeed[None](seed: I32)
use @Kore_Random_get[I32]()
use @Kore_Random_getMax[I32](max: I32)
use @Kore_Random_getMinMax[I32](min: I32, max: I32)

// TODO: Probably favor Pony's random package
primitive KoreRandom
  fun init() =>
    @Kore_Random_init()

  fun initSeed(seed: I32) =>
    @Kore_Random_initSeed(seed)

  fun get(): I32 =>
    @Kore_Random_get()

  fun getMax(max: I32): I32 =>
    @Kore_Random_getMax(max)

  fun getMinMax(min: I32, max: I32): I32 =>
    @Kore_Random_getMinMax(min, max)


/* 2 Component Vectors */

type Vec2 is Vector2[F32, F32]
type Vec2d is Vector2[F64, F64]
type Vec2i is Vector2[I32, F32]

class Vector2[
  T: ((I32 val|F32 val|F64 val) & Real[T]),
  L: (Float & FloatingPoint[L])]

  var x: T
  var y: T

  new create(
    x': T = T.from[I8](0),
    y': T = T.from[I8](0))
  =>
    x = x'
    y = y'

  new from_vector2(v: Vector2[T, L]) =>
    x = v.x
    y = v.y

  new from_vector3(v: Vector3[T, L]) =>
    x = v.x
    y = v.y

  fun square_length(): L =>
    (L.from[T](x) * L.from[T](x)) + (L.from[T](y) * L.from[T](y))

  fun get_length(): L =>
    (square_length()).sqrt()

  fun ref set_length(length: L): L =>
    let current_length = get_length()
    let mul' = T.from[L](length / current_length)
    x = x * mul'
    y = y * mul'
    length

  fun normalize(): Vector2[T, L] =>
    Vector2[T, L](x, y).>normalize()

  fun ref normalize_mut() =>
    set_length(L.from[I8](1))

  fun dot(other: Vector2[T, L]): T =>
    (x * other.x) + (y * other.y)

  fun add(other: Vector2[T, L]): Vector2[T, L] =>
    Vector2[T, L](
      x + other.x,
      y + other.y)

  fun ref add_mut(other: Vector2[T, L]) =>
    x = x + other.x
    y = y + other.y

  // add_scaled
  // add_scaled_mut

  fun sub(other: Vector2[T, L]): Vector2[T, L] =>
    Vector2[T, L](
      x - other.x,
      y - other.y)

  fun ref sub_mut(other: Vector2[T, L]) =>
    x = x - other.x
    y = y - other.y

  fun mul(value: T): Vector2[T, L] =>
    Vector2[T, L](
      x * value,
      y * value)

  fun ref mul_mut(value: T) =>
    x = x * value
    y = y * value

  fun div(value: T): Vector2[T, L] =>
    Vector2[T, L](
      x / value,
      y / value)

  fun ref div_mut(value: T) =>
    x = x / value
    y = y / value

  fun component_product(other: Vector2[T, L]): Vector2[T, L] =>
    Vector2[T, L](
      x * other.x,
      y * other.y)

  fun ref component_product_mut(other: Vector2[T, L]) =>
    x = x * other.x
    y = y * other.y

  fun neg(): Vector2[T, L] =>
    Vector2[T, L](
      -x,
      -y)

  fun ref neg_mut() =>
    x = -x
    y = -y

  fun is_zero(): Bool =>
    let zero = T.from[I8](0)
    (x == zero) and
    (y == zero)

  fun distance(other: Vector2[T, L]): L =>
    (this - other).get_length()

  fun eq(other: Vector2[T, L]): Bool =>
    (x == other.x) and
    (y == other.y)

  fun ne(other: Vector2[T, L]): Bool =>
    not eq(other)

/* 3 Component Vectors */

type Vec3 is Vector3[F32, F32]
type Vec3d is Vector3[F64, F64]
type Vec3i is Vector3[I32, F32]

class Vector3[
  T: ((I32 val|F32 val|F64 val) & Real[T]),
  L: (Float & FloatingPoint[L])]

  var x: T
  var y: T
  var z: T

  new create(
    x': T = T.from[I8](0),
    y': T = T.from[I8](0),
    z': T = T.from[I8](0)) =>
    x = x'
    y = y'
    z = z'

  new from_vector2(v: Vector2[T, L], z': T = T.from[I8](0)) =>
    x = v.x
    y = v.y
    z = z'

  new from_vector3(v: Vector3[T, L]) =>
    x = v.x
    y = v.y
    z = v.z

  new from_vector4(v: Vector4[T, L]) =>
    x = v.x
    y = v.y
    z = v.z

  fun square_length(): L =>
    (L.from[T](x) * L.from[T](x)) +
    (L.from[T](y) * L.from[T](y)) +
    (L.from[T](z) * L.from[T](z))

  fun get_length(): L =>
    (square_length()).sqrt()

  fun ref set_length(length: L): L =>
    let current_length = get_length()
    let mul' = T.from[L](length / current_length)
    x = x * mul'
    y = y * mul'
    z = z * mul'
    length

  fun normalize(): Vector3[T, L] =>
    Vector3[T, L](x, y).>normalize()

  fun ref normalize_mut() =>
    set_length(L.from[I8](1))

  fun dot(other: Vector3[T, L]): T =>
    (x * other.x) + (y * other.y) + (z * other.z)

  fun cross(other: Vector3[T, L]): Vector3[T, L] =>
    let x' = (y * other.z) - (z * other.y)
    let y' = (z * other.x) - (x * other.z)
    let z' = (x * other.y) - (y * other.x)
    Vector3[T, L](x', y', z')

  fun mod(other: Vector3[T, L]): Vector3[T, L] =>
    cross(other)

  fun add(other: Vector3[T, L]): Vector3[T, L] =>
    Vector3[T, L](
      x + other.x,
      y + other.y,
      z + other.z)

  fun ref add_mut(other: Vector3[T, L]) =>
    x = x + other.x
    y = y + other.y
    z = z + other.z

  // add_scaled
  // add_scaled_mut

  fun sub(other: Vector3[T, L]): Vector3[T, L] =>
    Vector3[T, L](
      x - other.x,
      y - other.y,
      z - other.z)

  fun ref sub_mut(other: Vector3[T, L]) =>
    x = x - other.x
    y = y - other.y
    z = z - other.z

  fun mul(value: T): Vector3[T, L] =>
    Vector3[T, L](
      x * value,
      y * value,
      z * value)

  fun ref mul_mut(value: T) =>
    x = x * value
    y = y * value
    z = z * value

  fun div(value: T): Vector3[T, L] =>
    Vector3[T, L](
      x / value,
      y / value,
      z / value)

  fun ref div_mut(value: T) =>
    x = x / value
    y = y / value
    z = z / value

  fun component_product(other: Vector3[T, L]): Vector3[T, L] =>
    Vector3[T, L](
      x * other.x,
      y * other.y,
      z * other.z)

  fun ref component_product_mut(other: Vector3[T, L]) =>
    x = x * other.x
    y = y * other.y
    z = z * other.z

  fun neg(): Vector3[T, L] =>
    Vector3[T, L](
      -x,
      -y,
      -z)

  fun ref neg_mut() =>
    x = -x
    y = -y
    z = -z

  fun is_zero(): Bool =>
    let zero = T.from[I8](0)
    (x == zero) and
    (y == zero) and
    (z == zero)

  fun distance(other: Vector3[T, L]): L =>
    (this - other).get_length()

  fun eq(other: Vector3[T, L]): Bool =>
    (x == other.x) and
    (y == other.y) and
    (z == other.z)

  fun ne(other: Vector3[T, L]): Bool =>
    not eq(other)

/* 4 Component Vectors */

type Vec4 is Vector4[F32, F32]
type Vec4d is Vector4[F64, F64]
type Vec4i is Vector4[I32, F32]

class Vector4[
  T: ((I32 val|F32 val|F64 val) & Real[T]),
  L: (Float & FloatingPoint[L])]

  var x: T
  var y: T
  var z: T
  var w: T

  new create(
    x': T = T.from[I8](0),
    y': T = T.from[I8](0),
    z': T = T.from[I8](0),
    w': T = T.from[I8](0)) =>
    x = x'
    y = y'
    z = z'
    w = w'

  new from_vector3(v: Vector3[T, L], w': T = T.from[I8](0)) =>
    x = v.x
    y = v.y
    z = v.z
    w = w'

  new from_vector4(v: Vector4[T, L]) =>
    x = v.x
    y = v.y
    z = v.z
    w = v.w

  fun to_cartesian(): Vector3[T, L] =>
    if (w != T.from[I8](0)) and (w != T.from[I8](1)) then
      let w_inv: L = L.from[I8](1) / L.from[T](w)
      Vector3[T, L](
        x * T.from[L](w_inv),
        y * T.from[L](w_inv),
        z * T.from[L](w_inv))
    else
      Vector3[T, L](x, y, z)
    end

  fun square_length(): L =>
    (L.from[T](x) * L.from[T](x)) +
    (L.from[T](y) * L.from[T](y)) +
    (L.from[T](z) * L.from[T](z)) +
    (L.from[T](w) * L.from[T](w))

  fun get_length(): L =>
    (square_length()).sqrt()

  fun ref set_length(length: L): L =>
    let current_length = get_length()
    let mul' = T.from[L](length / current_length)
    x = x * mul'
    y = y * mul'
    z = z * mul'
    w = w * mul'
    length

  fun normalize(): Vector4[T, L] =>
    Vector4[T, L](x, y).>normalize()

  fun ref normalize_mut() =>
    set_length(L.from[I8](1))

  fun dot(other: Vector4[T, L]): T =>
    (x * other.x) + (y * other.y) + (z * other.z) + (w * other.w)

  fun add(other: Vector4[T, L]): Vector4[T, L] =>
    Vector4[T, L](
      x + other.x,
      y + other.y,
      z + other.z,
      w + other.w)

  fun ref add_mut(other: Vector4[T, L]) =>
    x = x + other.x
    y = y + other.y
    z = z + other.z
    w = w + other.w

  // add_scaled
  // add_scaled_mut

  fun sub(other: Vector4[T, L]): Vector4[T, L] =>
    Vector4[T, L](
      x - other.x,
      y - other.y,
      z - other.z,
      w - other.w)

  fun ref sub_mut(other: Vector4[T, L]) =>
    x = x - other.x
    y = y - other.y
    z = z - other.z
    w = w - other.w

  fun mul(value: T): Vector4[T, L] =>
    Vector4[T, L](
      x * value,
      y * value,
      z * value,
      w * value)

  fun ref mul_mut(value: T) =>
    x = x * value
    y = y * value
    z = z * value
    w = w * value

  fun div(value: T): Vector4[T, L] =>
    Vector4[T, L](
      x / value,
      y / value,
      z / value,
      w / value)

  fun ref div_mut(value: T) =>
    x = x / value
    y = y / value
    z = z / value
    w = w / value

  fun component_product(other: Vector4[T, L]): Vector4[T, L] =>
    Vector4[T, L](
      x * other.x,
      y * other.y,
      z * other.z,
      w * other.w)

  fun ref component_product_mut(other: Vector4[T, L]) =>
    x = x * other.x
    y = y * other.y
    z = z * other.z
    w = w * other.w

  fun neg(): Vector4[T, L] =>
    Vector4[T, L](
      -x,
      -y,
      -z,
      -w)

  fun ref neg_mut() =>
    x = -x
    y = -y
    z = -z
    w = -w

  fun is_zero(): Bool =>
    let zero = T.from[I8](0)
    (x == zero) and
    (y == zero) and
    (z == zero) and
    (w == zero)

  fun distance(other: Vector4[T, L]): L =>
    (this - other).get_length()

  fun eq(other: Vector4[T, L]): Bool =>
    (x == other.x) and
    (y == other.y) and
    (z == other.z) and
    (w == other.w)

  fun ne(other: Vector4[T, L]): Bool =>
    not eq(other)


/* 2x2 Matrix */
type Mat2 is Matrix2[F32]
type DMat2 is Matrix2[F64]

// TODO: Make Matrix2 default refcap val?
class Matrix2[T: (Float & FloatingPoint[T])]
  let width: I32 = 2
  let height: I32 = 2
  // Row 0
  var _e00: T
  var _e10: T
  // Row 1
  var _e01: T
  var _e11: T

  new create(
    e00: T, e10: T,
    e01: T, e11: T)
  =>
    _e00 = e00; _e10 = e10
    _e01 = e01; _e11 = e11

  new from_matrix2(m: Matrix2[T]) =>
    _e00 = m._e00; _e10 = m._e10
    _e01 = m._e01; _e11 = m._e11

  // TODO: Matrix2.from_matrix3

  new empty() =>
    let zero: T = T.from[I8](0)
    _e00 = zero; _e10 = zero
    _e01 = zero; _e11 = zero

  new identity() =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    _e00 = one;  _e10 = zero
    _e01 = zero; _e11 = one

  new scale(x: T, y: T) =>
    let zero: T = T.from[I8](0)
    _e00 = x;    _e10 = zero
    _e01 = zero; _e11 = y

  new rotation(alpha: T) =>
    let ca: T = alpha.cos()
    let sa: T = alpha.sin()
    _e00 = ca; _e10 = -sa
    _e01 = sa; _e11 =  ca

  fun ref set_from(m: Matrix2[T]) =>
    _e00 = m._e00; _e10 = m._e10
    _e01 = m._e01; _e11 = m._e11

  fun add(m: Matrix2[T]): Matrix2[T] =>
    Matrix2[T](
      _e00 + m._e00, _e10 + m._e10,
      _e01 + m._e01, _e11 + m._e11)

  fun sub(m: Matrix2[T]): Matrix2[T] =>
    Matrix2[T](
      _e00 - m._e00, _e10 - m._e10,
      _e01 - m._e01, _e11 - m._e11)

  fun multiply_scalar(value: T): Matrix2[T] =>
    Matrix2[T](
      _e00 * value, _e10 * value,
      _e01 * value, _e11 * value)

  fun multiply_matrix(m: Matrix2[T]): Matrix2[T] =>
    Matrix2[T](
      (_e00 * m._e00) + (_e10 * m._e01), (_e00 * m._e10) + (_e10 * m._e11),
      (_e01 * m._e00) + (_e11 * m._e01), (_e01 * m._e10) + (_e11 * m._e11))

  fun multiply_vector(vector: Vector2[T, T]): Vector2[T, T] =>
    let x: T = (_e00 * vector.x) + (_e10 * vector.y)
    let y: T = (_e01 * vector.x) + (_e11 * vector.y)
    Vector2[T, T](x, y)

  fun transpose(): Matrix2[T] =>
    Matrix2[T](
      _e00, _e01,
      _e10, _e11)

  fun trace(): T =>
    _e00 + _e11

  // TODO: Matrix2.linear_interpolate
  // https://github.com/Kode/Kore/blob/master/Sources/Kore/Math/Matrix.h#L419


/* 3x3 Matrix */
type Mat3 is Matrix3[F32]
type DMat3 is Matrix3[F64]

struct Mat3Elements
  // Row 0
  var e00: F32 = 1.0
  var e10: F32 = 0.0
  var e20: F32 = 0.0
  // Row 1
  var e01: F32 = 0.0
  var e11: F32 = 1.0
  var e21: F32 = 0.0
  // Row 2
  var e02: F32 = 0.0
  var e12: F32 = 0.0
  var e22: F32 = 1.0

  new create(m: Mat3) =>
    e00 = m._e00
    e10 = m._e10
    e20 = m._e20
    e01 = m._e01
    e11 = m._e11
    e21 = m._e21
    e02 = m._e02
    e12 = m._e12
    e22 = m._e22

// TODO: Make Matrix3 default refcap val?
class Matrix3[T: (Float & FloatingPoint[T])]
  let width: I32 = 3
  let height: I32 = 3
  // Row 0
  var _e00: T
  var _e10: T
  var _e20: T
  // Row 1
  var _e01: T
  var _e11: T
  var _e21: T
  // Row 2
  var _e02: T
  var _e12: T
  var _e22: T

  new create(
    e00: T, e10: T, e20: T,
    e01: T, e11: T, e21: T,
    e02: T, e12: T, e22: T)
  =>
    _e00 = e00; _e10 = e10; _e20 = e20
    _e01 = e01; _e11 = e11; _e21 = e21
    _e02 = e02; _e12 = e12; _e22 = e22

  // TODO: Matrix3.from_matrix2

  new from_matrix3(m: Matrix3[T]) =>
    _e00 = m._e00; _e10 = m._e10; _e20 = m._e20
    _e01 = m._e01; _e11 = m._e11; _e21 = m._e21
    _e02 = m._e02; _e12 = m._e12; _e22 = m._e22

  // TODO: Matrix3.from_matrix4

  new empty() =>
    let zero: T = T.from[I8](0)
    _e00 = zero; _e10 = zero; _e20 = zero
    _e01 = zero; _e11 = zero; _e21 = zero
    _e02 = zero; _e12 = zero; _e22 = zero

  new identity() =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    _e00 = one;  _e10 = zero; _e20 = zero
    _e01 = zero; _e11 = one;  _e21 = zero
    _e02 = zero; _e12 = zero; _e22 = one

  new translation(x: T, y: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    _e00 = one;  _e10 = zero; _e20 = x
    _e01 = zero; _e11 = one;  _e21 = y
    _e02 = zero; _e12 = zero; _e22 = one

  new scale(x: T, y: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    _e00 = x;    _e10 = zero; _e20 = zero
    _e01 = zero; _e11 = y;    _e21 = zero
    _e02 = zero; _e12 = zero; _e22 = one

  new rotation(alpha: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    let ca: T = alpha.cos()
    let sa: T = alpha.sin()
    _e00 = ca;   _e10 = -sa;   _e20 = zero
    _e01 = sa;   _e11 =  ca;   _e21 = zero
    _e02 = zero; _e12 =  zero; _e22 = one

  fun ref set_from(m: Matrix3[T]) =>
    _e00 = m._e00; _e10 = m._e10; _e20 = m._e20
    _e01 = m._e01; _e11 = m._e11; _e21 = m._e21
    _e02 = m._e02; _e12 = m._e12; _e22 = m._e22

  fun add(m: Matrix3[T]): Matrix3[T] =>
    Matrix3[T](
      _e00 + m._e00, _e10 + m._e10, _e20 + m._e20,
      _e01 + m._e01, _e11 + m._e11, _e21 + m._e21,
      _e02 + m._e02, _e12 + m._e12, _e22 + m._e22)

  fun sub(m: Matrix3[T]): Matrix3[T] =>
    Matrix3[T](
      _e00 - m._e00, _e10 - m._e10, _e20 - m._e20,
      _e01 - m._e01, _e11 - m._e11, _e21 - m._e21,
      _e02 - m._e02, _e12 - m._e12, _e22 - m._e22)

  fun multiply_scalar(value: T): Matrix3[T] =>
    Matrix3[T](
      _e00 * value, _e10 * value, _e20 * value,
      _e01 * value, _e11 * value, _e21 * value,
      _e02 * value, _e12 * value, _e22 * value)

  fun multiply_matrix(m: Matrix3[T]): Matrix3[T] =>
    Matrix3[T](
      (_e00 * m._e00) + (_e10 * m._e01) + (_e20 * m._e02), (_e00 * m._e10) + (_e10 * m._e11) + (_e20 * m._e12), (_e00 * m._e20) + (_e10 * m._e21) + (_e20 * m._e22),
      (_e01 * m._e00) + (_e11 * m._e01) + (_e21 * m._e02), (_e01 * m._e10) + (_e11 * m._e11) + (_e21 * m._e12), (_e01 * m._e20) + (_e11 * m._e21) + (_e21 * m._e22),
      (_e02 * m._e00) + (_e12 * m._e01) + (_e22 * m._e02), (_e02 * m._e10) + (_e12 * m._e11) + (_e22 * m._e12), (_e02 * m._e20) + (_e12 * m._e21) + (_e22 * m._e22))

  fun multiply_vector(vector: Vector2[T, T]): Vector2[T, T] =>
    let one: T = T.from[I8](1)
    let w: T = (_e02 * vector.x) + (_e12 * vector.y) + (_e22 * one)
    let x: T = ((_e00 * vector.x) + (_e10 * vector.y) + (_e20 * one)) / w
    let y: T = ((_e01 * vector.x) + (_e11 * vector.y) + (_e21 * one)) / w
    Vector2[T, T](x, y)

  fun transpose(): Matrix3[T] =>
    Matrix3[T](
      _e00, _e01, _e02,
      _e10, _e11, _e12,
      _e20, _e21, _e22)

  fun trace(): T =>
      _e00 + _e11 + _e22

  fun cofactor(m0: T, m1: T, m2: T, m3: T): T =>
    (m0 * m3) - (m1 * m2)

  fun determinant(): T =>
    let c00 = cofactor(_e11, _e21, _e12, _e22)
    let c01 = cofactor(_e10, _e20, _e12, _e22)
    let c02 = cofactor(_e10, _e20, _e11, _e21)
    (_e00 * c00) - ((_e01 * c01) + (_e02 * c02))

  fun inverse(): Matrix3[T] ? =>
    let c00 = cofactor(_e11, _e21, _e12, _e22)
    let c01 = cofactor(_e10, _e20, _e12, _e22)
    let c02 = cofactor(_e10, _e20, _e11, _e21)

    let det = (_e00 * c00) - ((_e01 * c01) + (_e02 * c02))
    if det.abs() < T.from[F32](0.000001) then
      // Determinant is too small
      error
    end

    let c10 = cofactor(_e01, _e21, _e02, _e22)
    let c11 = cofactor(_e00, _e20, _e02, _e22)
    let c12 = cofactor(_e00, _e20, _e01, _e21)

    let c20 = cofactor(_e01, _e11, _e02, _e12)
    let c21 = cofactor(_e00, _e10, _e02, _e12)
    let c22 = cofactor(_e00, _e10, _e01, _e11)

    let inv_det = T.from[I8](1) / det
    Matrix3[T](
      c00 * inv_det, -c01 * inv_det,  c02 * inv_det,
    -c10 * inv_det,  c11 * inv_det, -c12 * inv_det,
      c20 * inv_det, -c21 * inv_det,  c22 * inv_det)

  // TODO: Matrix3.linear_interpolate
  // https://github.com/Kode/Kore/blob/master/Sources/Kore/Math/Matrix.h#L419


/* 4x4 Matrix */
type Mat4 is Matrix4[F32]
type DMat4 is Matrix4[F64]

struct Mat4Elements
  // Row 0
  var e00: F32 = 1.0
  var e10: F32 = 0.0
  var e20: F32 = 0.0
  var e30: F32 = 0.0
  // Row 1
  var e01: F32 = 0.0
  var e11: F32 = 1.0
  var e21: F32 = 0.0
  var e31: F32 = 0.0
  // Row 2
  var e02: F32 = 0.0
  var e12: F32 = 0.0
  var e22: F32 = 1.0
  var e32: F32 = 0.0
  // Row 3
  var e03: F32 = 0.0
  var e13: F32 = 0.0
  var e23: F32 = 0.0
  var e33: F32 = 1.0

  new create(m: Mat4) =>
    e00 = m._e00
    e10 = m._e10
    e20 = m._e20
    e30 = m._e30
    e01 = m._e01
    e11 = m._e11
    e21 = m._e21
    e31 = m._e31
    e02 = m._e02
    e12 = m._e12
    e22 = m._e22
    e32 = m._e32
    e03 = m._e03
    e13 = m._e13
    e23 = m._e23
    e33 = m._e33

// TODO: Make Matrix4 default refcap val?
class Matrix4[T: (Float & FloatingPoint[T])]
  let width: I32 = 4
  let height: I32 = 4
  // Row 0
  var _e00: T
  var _e10: T
  var _e20: T
  var _e30: T
  // Row 1
  var _e01: T
  var _e11: T
  var _e21: T
  var _e31: T
  // Row 2
  var _e02: T
  var _e12: T
  var _e22: T
  var _e32: T
  // Row 3
  var _e03: T
  var _e13: T
  var _e23: T
  var _e33: T

  new create(
    e00: T, e10: T, e20: T, e30: T,
    e01: T, e11: T, e21: T, e31: T,
    e02: T, e12: T, e22: T, e32: T,
    e03: T, e13: T, e23: T, e33: T)
  =>
    _e00 = e00; _e10 = e10; _e20 = e20; _e30 = e30
    _e01 = e01; _e11 = e11; _e21 = e21; _e31 = e31
    _e02 = e02; _e12 = e12; _e22 = e22; _e32 = e32
    _e03 = e03; _e13 = e13; _e23 = e23; _e33 = e33

  // TODO: Matrix4.from_matrix3

  new from_matrix4(m: Matrix4[T]) =>
    _e00 = m._e00; _e10 = m._e10; _e20 = m._e20; _e30 = m._e30
    _e01 = m._e01; _e11 = m._e11; _e21 = m._e21; _e31 = m._e31
    _e02 = m._e02; _e12 = m._e12; _e22 = m._e22; _e32 = m._e32
    _e03 = m._e03; _e13 = m._e13; _e23 = m._e23; _e33 = m._e33

  new empty() =>
    let zero: T = T.from[I8](0)
    _e00 = zero; _e10 = zero; _e20 = zero; _e30 = zero
    _e01 = zero; _e11 = zero; _e21 = zero; _e31 = zero
    _e02 = zero; _e12 = zero; _e22 = zero; _e32 = zero
    _e03 = zero; _e13 = zero; _e23 = zero; _e33 = zero

  new identity() =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    _e00 = one;  _e10 = zero; _e20 = zero; _e30 = zero
    _e01 = zero; _e11 = one;  _e21 = zero; _e31 = zero
    _e02 = zero; _e12 = zero; _e22 = one;  _e32 = zero
    _e03 = zero; _e13 = zero; _e23 = zero; _e33 = one

  new translation(x: T, y: T, z: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    _e00 = one;  _e10 = zero; _e20 = zero; _e30 = x
    _e01 = zero; _e11 = one;  _e21 = zero; _e31 = y
    _e02 = zero; _e12 = zero; _e22 = one;  _e32 = z
    _e03 = zero; _e13 = zero; _e23 = zero; _e33 = one

  new scale(x: T, y: T, z: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    _e00 = x;    _e10 = zero; _e20 = zero; _e30 = zero
    _e01 = zero; _e11 = y;    _e21 = zero; _e31 = zero
    _e02 = zero; _e12 = zero; _e22 = z;    _e32 = zero
    _e03 = zero; _e13 = zero; _e23 = zero; _e33 = one

  new rotation_x(alpha: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    let ca: T = alpha.cos()
    let sa: T = alpha.sin()
    _e00 = one;  _e10 = zero; _e20 = zero; _e30 = zero
    _e01 = zero; _e11 = ca;   _e21 = -sa;  _e31 = zero
    _e02 = zero; _e12 = sa;   _e22 =  ca;  _e32 = zero
    _e03 = zero; _e13 = zero; _e23 = zero; _e33 = one

  new rotation_y(alpha: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    let ca: T = alpha.cos()
    let sa: T = alpha.sin()
    _e00 = ca;   _e10 = zero; _e20 = sa;   _e30 = zero
    _e01 = zero; _e11 = one;  _e21 = zero; _e31 = zero
    _e02 = -sa;  _e12 = zero; _e22 = ca;   _e32 = zero
    _e03 = zero; _e13 = zero; _e23 = zero; _e33 = one

  new rotation_z(alpha: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    let ca: T = alpha.cos()
    let sa: T = alpha.sin()
    _e00 = ca;   _e10 = -sa;  _e20 = zero; _e30 = zero
    _e01 = sa;   _e11 =  ca;  _e21 = zero; _e31 = zero
    _e02 = zero; _e12 = zero; _e22 = one;  _e32 = zero
    _e03 = zero; _e13 = zero; _e23 = zero; _e33 = one

  new rotation(yaw: T, pitch: T, roll: T) =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    let sy: T = yaw.sin()
    let cy: T = yaw.cos()
    let sx: T = pitch.sin()
    let cx: T = pitch.cos()
    let sz: T = roll.sin()
    let cz: T = roll.cos()
    _e00 = (cx * cy); _e10 = ((cx * sy * sz) - (sx * cz)); _e20 = ((cx * sy * cz) + (sx * sz)); _e30 = zero
    _e01 = (sx * cy); _e11 = ((sx * sy * sz) + (cx * cz)); _e21 = ((sx * sy * cz) - (cx * sz)); _e31 = zero
    _e02 = -sy;       _e12 = (cy * sz);                    _e22 = (cy * cz);                    _e32 = zero
    _e03 = zero;      _e13 = zero;                         _e23 = zero;                         _e33 = one

  new orthogonal_projection(
    left: T,
    right: T,
    bottom: T,
    top: T,
    z_near: T,
    z_far: T)
  =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    let two: T = T.from[I8](2)
    let tx: T = -(right + left) / (right - left)
    let ty: T = -(top + bottom) / (top - bottom)
    let tz: T = -(z_far + z_near) / (z_far - z_near)
    _e00 = two / (right - left); _e10 = zero;                 _e20 = zero;                    _e30 = tx
    _e01 = zero;                 _e11 = two / (top - bottom); _e21 = zero;                    _e31 = ty
    _e02 = zero;                 _e12 = zero;                 _e22 = -two / (z_far - z_near); _e32 = tz
    _e03 = zero;                 _e13 = zero;                 _e23 = zero;                    _e33 = one

  // TODO: Matrix4.perspective_projection2
  // new perspective_projection2(left, right, top, bottom, near, far)
  // https://github.com/Kode/Kore/blob/master/Sources/Kore/Math/Matrix.h#L88

  new perspective_projection(
    fov_y: T,
    aspect: T,
    z_near: T,
    z_far: T)
  =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    let two: T = T.from[I8](2)
    let uh: T = one / (fov_y / two).tan()
    let uw: T = uh / aspect
    _e00 = uw;   _e10 = zero; _e20 = zero;                                _e30 = zero
    _e01 = zero; _e11 = uh;   _e21 = zero;                                _e31 = zero
    _e02 = zero; _e12 = zero; _e22 = (z_far + z_near) / (z_near - z_far); _e32 = (two * z_far * z_near) / (z_near - z_far)
    _e03 = zero; _e13 = zero; _e23 = -one;                                _e33 = zero

  new look_at(
    eye: Vector3[T, T],
    at: Vector3[T, T],
    up: Vector3[T, T])
  =>
    let zero: T = T.from[I8](0)
    let one: T = T.from[I8](1)
    var z_axis = at - eye
    z_axis.normalize_mut()
    var x_axis = z_axis.cross(up)
    x_axis.normalize_mut()
    var y_axis = x_axis.cross(z_axis)
    _e00 =  x_axis.x; _e10 =  x_axis.y; _e20 =  x_axis.z; _e30 = -x_axis.dot(eye)
    _e01 =  y_axis.x; _e11 =  y_axis.y; _e21 =  y_axis.z; _e31 = -y_axis.dot(eye)
    _e02 = -z_axis.x; _e12 = -z_axis.y; _e22 = -z_axis.z; _e32 =  z_axis.dot(eye)
    _e03 =  zero;     _e13 =  zero;     _e23 =  zero;     _e33 = one

  // TODO: Matrix4.look_along
  // https://github.com/Kode/Kore/blob/master/Sources/Kore/Math/Matrix.h#L139

  fun ref set_from(m: Matrix4[T]) =>
    _e00 = m._e00; _e10 = m._e10; _e20 = m._e20; _e30 = m._e30
    _e01 = m._e01; _e11 = m._e11; _e21 = m._e21; _e31 = m._e31
    _e02 = m._e02; _e12 = m._e12; _e22 = m._e22; _e32 = m._e32
    _e03 = m._e03; _e13 = m._e13; _e23 = m._e23; _e33 = m._e33

  fun add(m: Matrix4[T]): Matrix4[T] =>
    Matrix4[T](
      _e00 + m._e00, _e10 + m._e10, _e20 + m._e20, _e30 + m._e30,
      _e01 + m._e01, _e11 + m._e11, _e21 + m._e21, _e31 + m._e31,
      _e02 + m._e02, _e12 + m._e12, _e22 + m._e22, _e32 + m._e32,
      _e03 + m._e03, _e13 + m._e13, _e23 + m._e23, _e33 + m._e33)

  fun sub(m: Matrix4[T]): Matrix4[T] =>
    Matrix4[T](
      _e00 - m._e00, _e10 - m._e10, _e20 - m._e20, _e30 - m._e30,
      _e01 - m._e01, _e11 - m._e11, _e21 - m._e21, _e31 - m._e31,
      _e02 - m._e02, _e12 - m._e12, _e22 - m._e22, _e32 - m._e32,
      _e03 - m._e03, _e13 - m._e13, _e23 - m._e23, _e33 - m._e33)

  fun multiply_scalar(value: T): Matrix4[T] =>
    Matrix4[T](
      _e00 * value, _e10 * value, _e20 * value, _e30 * value,
      _e01 * value, _e11 * value, _e21 * value, _e31 * value,
      _e02 * value, _e12 * value, _e22 * value, _e32 * value,
      _e03 * value, _e13 * value, _e23 * value, _e33 * value)

  fun multiply_matrix(m: Matrix4[T]): Matrix4[T] =>
    Matrix4[T](
      (_e00 * m._e00) + (_e10 * m._e01) + (_e20 * m._e02) + (_e30 * m._e03), (_e00 * m._e10) + (_e10 * m._e11) + (_e20 * m._e12) + (_e30 * m._e13), (_e00 * m._e20) + (_e10 * m._e21) + (_e20 * m._e22) + (_e30 * m._e23), (_e00 * m._e30) + (_e10 * m._e31) + (_e20 * m._e32) + (_e30 * m._e33),
			(_e01 * m._e00) + (_e11 * m._e01) + (_e21 * m._e02) + (_e31 * m._e03), (_e01 * m._e10) + (_e11 * m._e11) + (_e21 * m._e12) + (_e31 * m._e13), (_e01 * m._e20) + (_e11 * m._e21) + (_e21 * m._e22) + (_e31 * m._e23), (_e01 * m._e30) + (_e11 * m._e31) + (_e21 * m._e32) + (_e31 * m._e33),
			(_e02 * m._e00) + (_e12 * m._e01) + (_e22 * m._e02) + (_e32 * m._e03), (_e02 * m._e10) + (_e12 * m._e11) + (_e22 * m._e12) + (_e32 * m._e13), (_e02 * m._e20) + (_e12 * m._e21) + (_e22 * m._e22) + (_e32 * m._e23), (_e02 * m._e30) + (_e12 * m._e31) + (_e22 * m._e32) + (_e32 * m._e33),
      (_e03 * m._e00) + (_e13 * m._e01) + (_e23 * m._e02) + (_e33 * m._e03), (_e03 * m._e10) + (_e13 * m._e11) + (_e23 * m._e12) + (_e33 * m._e13), (_e03 * m._e20) + (_e13 * m._e21) + (_e23 * m._e22) + (_e33 * m._e23), (_e03 * m._e30) + (_e13 * m._e31) + (_e23 * m._e32) + (_e33 * m._e33))

  fun multiply_vector(vector: Vector4[T, T]): Vector4[T, T] =>
    var product = Vector4[T, T]
    product.x = (_e00 * vector.x) + (_e10 * vector.y) + (_e20 * vector.z) + (_e30 * vector.w)
    product.y = (_e01 * vector.x) + (_e11 * vector.y) + (_e21 * vector.z) + (_e31 * vector.w)
    product.z = (_e02 * vector.x) + (_e12 * vector.y) + (_e22 * vector.z) + (_e32 * vector.w)
    product.w = (_e03 * vector.x) + (_e13 * vector.y) + (_e23 * vector.z) + (_e33 * vector.w)
    product

  fun transpose(): Matrix4[T] =>
    Matrix4[T](
      _e00, _e01, _e02, _e03,
      _e10, _e11, _e12, _e13,
      _e20, _e21, _e22, _e23,
      _e30, _e31, _e32, _e33)

  fun transpose_3x3(): Matrix4[T] =>
    Matrix4[T](
      _e00, _e01, _e02, _e30,
      _e10, _e11, _e12, _e31,
      _e20, _e21, _e22, _e32,
      _e03, _e13, _e23, _e33)

  fun trace(): T =>
    _e00 + _e11 + _e22 + _e33

  fun cofactor(
    m0: T, m1: T, m2: T,
    m3: T, m4: T, m5: T,
    m6: T, m7: T, m8: T)
    : T
  =>
    (m0 * ( (m4 * m8) - (m5 * m7) )) - ((m1 * ( (m3 * m8) - (m5 * m6) )) + (m2 * ( (m3 * m7) - (m4 * m6) )))

  fun determinant(): T =>
    let c00 = cofactor(_e11, _e21, _e31, _e12, _e22, _e32, _e13, _e23, _e33)
    let c01 = cofactor(_e10, _e20, _e30, _e12, _e22, _e32, _e13, _e23, _e33)
    let c02 = cofactor(_e10, _e20, _e30, _e11, _e21, _e31, _e13, _e23, _e33)
    let c03 = cofactor(_e10, _e20, _e30, _e11, _e21, _e31, _e12, _e22, _e32)
    ((_e00 * c00) - (_e01 * c01)) + ((_e02 * c02) - (_e03 * c03))

  fun inverse(): Matrix4[T] ? =>
    let c00 = cofactor(_e11, _e21, _e31, _e12, _e22, _e32, _e13, _e23, _e33)
    let c01 = cofactor(_e10, _e20, _e30, _e12, _e22, _e32, _e13, _e23, _e33)
    let c02 = cofactor(_e10, _e20, _e30, _e11, _e21, _e31, _e13, _e23, _e33)
    let c03 = cofactor(_e10, _e20, _e30, _e11, _e21, _e31, _e12, _e22, _e32)

    let det = ((_e00 * c00) - (_e01 * c01)) + ((_e02 * c02) - (_e03 * c03))
    if det.abs() < T.from[F32](0.000001) then
      // Determinant is too small
      error
    end

    let c10 = cofactor(_e01, _e21, _e31, _e02, _e22, _e32, _e03, _e23, _e33)
    let c11 = cofactor(_e00, _e20, _e30, _e02, _e22, _e32, _e03, _e23, _e33)
    let c12 = cofactor(_e00, _e20, _e30, _e01, _e21, _e31, _e03, _e23, _e33)
    let c13 = cofactor(_e00, _e20, _e30, _e01, _e21, _e31, _e02, _e22, _e32)

    let c20 = cofactor(_e01, _e11, _e31, _e02, _e12, _e32, _e03, _e13, _e33)
    let c21 = cofactor(_e00, _e10, _e30, _e02, _e12, _e32, _e03, _e13, _e33)
    let c22 = cofactor(_e00, _e10, _e30, _e01, _e11, _e31, _e03, _e13, _e33)
    let c23 = cofactor(_e00, _e10, _e30, _e01, _e11, _e31, _e02, _e12, _e32)

    let c30 = cofactor(_e01, _e11, _e21, _e02, _e12, _e22, _e03, _e13, _e23)
    let c31 = cofactor(_e00, _e10, _e20, _e02, _e12, _e22, _e03, _e13, _e23)
    let c32 = cofactor(_e00, _e10, _e20, _e01, _e11, _e21, _e03, _e13, _e23)
    let c33 = cofactor(_e00, _e10, _e20, _e01, _e11, _e21, _e02, _e12, _e22)

    let inv_det = T.from[I8](1) / det
      Matrix4[T](
        c00 * inv_det, -c01 * inv_det,  c02 * inv_det, -c03 * inv_det,
       -c10 * inv_det,  c11 * inv_det, -c12 * inv_det,  c13 * inv_det,
        c20 * inv_det, -c21 * inv_det,  c22 * inv_det, -c23 * inv_det,
       -c30 * inv_det,  c31 * inv_det, -c32 * inv_det,  c33 * inv_det)

  // TODO: Matrix4.linear_interpolate
  // https://github.com/Kode/Kore/blob/master/Sources/Kore/Math/Matrix.h#L419


/* Quaternion */
// TODO: KoreQuaternion
// https://github.com/Kode/Kore/blob/master/Sources/Kore/Math/Quaternion.h
// https://github.com/Kode/Kha/blob/master/Sources/kha/math/Quaternion.hx