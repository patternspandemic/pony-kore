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
    clear_color = 0xffff0000
    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g4 = framebuffer.g4()
    g4.clear(clear_color)
