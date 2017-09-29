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

  fun add(other: Vector2[T, L]): Vector2[T, L] =>
    Vector2[T, L](
      x + other.x,
      y + other.y)

  fun ref add_mut(other: Vector2[T, L]) =>
    x = x + other.x
    y = y + other.y

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

  fun add(other: Vector3[T, L]): Vector3[T, L] =>
    Vector3[T, L](
      x + other.x,
      y + other.y,
      z + other.z)

  fun ref add_mut(other: Vector3[T, L]) =>
    x = x + other.x
    y = y + other.y
    z = z + other.z

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

//////

  // -add (to this)
  // add_scaled_vector (to this)
  // -sub (from this)
  // -mult (to this)
  // -component_product (new)
  // -component_product (to this)
  // -negate (this)
  // -div ()
  // dot -- and case method for */mul
  // cross -- and % infix
  // -distance
  // -invert
  // -normalize
  // -square_length ? (x * x) + (y * y)
  // -is_zero
  // equality
  // not equal