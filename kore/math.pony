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




type Vec3 is Vector3[F32]
type Vec4 is Vector4[F32]

type Vec2d is Vector2[F64]
type Vec3d is Vector3[F64]
type Vec4d is Vector4[F64]

type Vec2i is Vector2[I32]
type Vec3i is Vector3[I32]
type Vec4i is Vector4[I32]

type Vec2 is Vector2
class Vector2
  var x: F32
  var y: F32

  new create(x': F32, y': F32) =>
    x = x'
    y = y'

  // new from_vector2 - 1, w
  new from_vector2(v: Vector2) =>
    x = v.x
    y = v.y
  // new from_vector2 + 1, omit last
  
  // fun to_cartesian

  fun get_length(): F32 =>
    ((x * x) + (y * y)).sqrt()

  fun ref set_length(length: F32): F32 =>
    let current_length = get_length()
    if current_length == 0 then return F32(0) end
    let mul = length / current_length
    x = x * mul
    y = y * mul
    length

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
  // square_length ? (x * x) + (y * y)
  // is_zero
  // equality
  // not equal