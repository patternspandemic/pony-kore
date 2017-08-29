use "../../kore"

actor Main
  new create(env: Env) =>
    let kore_system = KoreSystem(
      where
        title = "Basic Example",
        width = 640,
        height = 480)

    kore_system({ref() => BasicExample(kore_system)} ref)

class BasicExample
  let clear_color: U32

  new create(system: KoreSystem) =>
    clear_color = Colors.green()
    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g = framebuffer.g4()

    g.begin_gfx()

    g.clear(clear_color)

    g.end_gfx()
