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
