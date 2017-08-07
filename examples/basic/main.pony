use "../../kore"

actor Main
  new create(env: Env) =>
    let name: String = "KoreC"
    let title: String = "Test of libkorec"
    var options: KoreWindowOptions = KoreWindowOptions(title)
    options.width = 640
    options.height = 480

    KoreRandom.init()
    KoreSystem.set_name(name)
    KoreSystem.setup()
    KoreSystem.init_window(options)

    let cb: @{()} =
      @{() =>
        KoreGraphics4.begin_gfx()
        KoreGraphics4.clear(KoreGraphics4.clear_color_flag(), 0xffff0000)
        KoreGraphics4.end_gfx()
        KoreGraphics4.swap_buffers()
      }
    KoreSystem.set_callback(cb)

    KoreSystem.start()
