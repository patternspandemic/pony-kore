use "../../kore"
use "logger"

actor Main
  var system: KoreSystem

  new create(env: Env) =>
    system = KoreSystem(
      env,
      Info
    where
      title = "Basic Example",
      width = 640,
      height = 480)

    let entry_point =
      object
        fun ref apply() =>
            BasicExample(system)
      end

    system(entry_point)

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
