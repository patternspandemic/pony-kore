use "../../kore"

actor Main
  new create(env: Env) =>
    let kore_system = KoreSystem(
      where
        title = "Basic Example",
        width = 640,
        height = 480)

    kore_system({(system: KoreSystem) => BasicExample(system)} val)

class BasicExample
  let clear_color: U32

  new create(system: KoreSystem) =>
    clear_color = 0xffff0000
    system.notify_on_render(this~render())

  fun render() =>
    // FIXME: Context handling
    // KoreGraphics4.begin_gfx()
    KoreGraphics4.clear(KoreGraphics4.clear_color_flag(), clear_color)
    // KoreGraphics4.end_gfx()
    // KoreGraphics4.swap_buffers()
