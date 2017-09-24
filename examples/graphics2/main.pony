use "../../kore"
use "logger"

actor Main
  var system: KoreSystem

  let mascot_path: String val = "pony-mascot.png"
  var mascot: (ImageAsset val | None) = None

  let font_path: String val = "Fonts/Hack"
  var font: (FontAsset val | None) = None

  new create(env: Env) =>
    system = KoreSystem(
      env,
      Info
    where
      title = "Graphics2 Example",
      width = 640,
      height = 480)

    // Request assets
    system.assets.load_image(this, mascot_path)
    system.assets.load_font(this, font_path)

  be receive_image(
    path: String val,
    image_asset: ImageAsset val)
  =>
    match path
    | mascot_path => mascot = image_asset
    end
    try_proceed()

  be receive_font(
    path: String val,
    font_asset: FontAsset val)
  =>
    match path
    | font_path => font = font_asset
    end
    try_proceed()

  fun ref try_proceed() =>
    if
      not (mascot is None) and
      not (font is None)
    then
      try
        let entry_point =
          object
            var mascot': ImageAsset val =
              mascot as ImageAsset val
            var font': FontAsset val =
              font as FontAsset val

            fun ref apply() =>
              Graphics2Example(
                system,
                mascot',
                font')
          end

        system(entry_point)
      end
    end

class Graphics2Example
  let system: KoreSystem
  let mascot: Image ref
  let font: Font ref

  new create(
    system': KoreSystem,
    mascot': ImageAsset,
    font': FontAsset)
  =>
    system = system'
    mascot = mascot'() // Apply assets to receive them.
    font = font'()

    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g = framebuffer.g2()
    let grey: U32 = 0xff666666
    let wf = F32.from[I32](mascot.width())
    let hf = F32.from[I32](mascot.height())

    g.set_font(font)
    g.set_font_size(16)
    g.set_font_style("Regular")

    g.begin_gfx(true, grey)

      g.scissor(0, 0, 640, 240)

      // Centered mascot
      g.draw_image(
        mascot,
        320.0-(wf*0.5),
        240.0-(hf*0.5))

      g.disable_scissor()

      // Scaled mascot
      g.set_color(Colors.red())
      g.draw_scaled_image(mascot, 10, 10, wf*0.33, hf*0.33)

      // Mascot head
      g.set_color(Colors.orange())
      g.draw_sub_image(mascot, 500, 340, 0, 0, 140, 140)

      // Mascot head as tail
      g.set_color(Colors.yellow())
      g.push_opacity(0.8)
      g.draw_scaled_sub_image(
        mascot,
        0, 0, 200, 160,
        552, 78, -200, 160)

      g.pop_opacity()

      g.set_color(Colors.red())
      g.draw_rect(30, 100, 80, 80, 3.0)

      g.set_color(Colors.green())
      g.fill_rect(30, 210, 80, 80)

      g.set_color(Colors.black())
      g.draw_line(50, 245, 590, 245, 5.0)

      g.set_color(Colors.blue())
      g.fill_triangle(300, 250, 320, 260, 340, 250)

      g.set_color(Colors.cyan())
      g.draw_circle(420, 330, 40, 8)

      g.set_color(Colors.magenta())
      g.fill_circle(420, 330, 25)

      g.draw_string("Hello from Pony-Kore!", 50, 300)
      g.set_font_style("Bold")
      g.set_font_color(Colors.red())
      g.draw_string("Some BOLD text.", 50, 330)
      g.set_font_style("Italic")
      g.set_font_color(Colors.green())
      g.draw_string("And some with a slant to it!", 50, 360)
      g.set_font_style("BoldItalic")
      g.set_font_color(Colors.blue())
      g.draw_string("Here we go full out text.", 50, 390)
      g.set_font_color(Colors.black())
      g.set_font_style("Bananas")
      g.draw_string("This text shouldn't print.", 50, 420)
      g.set_font_size(32)
      g.set_font_style("Bold")
      g.draw_string("Pony and Kore are awesome stuff :)", 50, 420)

      g.set_color(Colors.white())

    g.end_gfx()
