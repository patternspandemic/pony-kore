use "lib:korec"

use @Kore_System_setName[None](name: Pointer[U8] tag)
use @Kore_System_setup[None]()
use @Kore_System_initWindow[I32](options: WKoreWindowOptions)
use @Kore_System_setCallback[None](callback: KoreCallback)
use @Kore_System_start[None]()

type KoreCallback is @{()}

primitive KoreSystem
  fun set_name(name: String val) =>
    @Kore_System_setName(name.cstring())

  fun setup() =>
    @Kore_System_setup()

  fun init_window(options: WKoreWindowOptions): I32 =>
    @Kore_System_initWindow(options)

  fun set_callback(callback: KoreCallback) =>
    @Kore_System_setCallback(callback)

  fun start() =>
    @Kore_System_start()
