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

  new create(x': T, y': T) =>
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
    let mul = T.from[L](length / current_length)
    x = x * mul
    y = y * mul
    length

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

  new create(x': T, y': T, z': T) =>
    x = x'
    y = y'
    z = z'

  new from_vector2(v: Vector2[T, L], z': T) =>
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
    let mul = T.from[L](length / current_length)
    x = x * mul
    y = y * mul
    z = z * mul
    length

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

  new create(x': T, y': T, z': T, w': T) =>
    x = x'
    y = y'
    z = z'
    w = w'

  new from_vector3(v: Vector3[T, L], w': T) =>
    x = v.x
    y = v.y
    z = v.z
    w = w'

  new from_vector4(v: Vector4[T, L]) =>
    x = v.x
    y = v.y
    z = v.z
    w = v.w

  fun square_length(): L =>
    (L.from[T](x) * L.from[T](x)) +
    (L.from[T](y) * L.from[T](y)) +
    (L.from[T](z) * L.from[T](z)) +
    (L.from[T](w) * L.from[T](w))

  fun get_length(): L =>
    (square_length()).sqrt()

  fun ref set_length(length: L): L =>
    let current_length = get_length()
    let mul = T.from[L](length / current_length)
    x = x * mul
    y = y * mul
    z = z * mul
    w = w * mul
    length

//////

  // add (to this)
  // add_scaled_vector (to this)
  // sub (from this)
  // mult (to this)
  // component_product (new)
  // component_product (to this)
  // negate (this)
  // div ()
  // dot
  // cross
  // distance
  // invert
  // normalize
  // -square_length ? (x * x) + (y * y)
  // is_zero
  // equality
  // not equal