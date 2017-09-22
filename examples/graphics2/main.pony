use "../../kore"
use "logger"

actor Main
  var system: KoreSystem

  let mascot_path: String val = "pony-mascot.png"
  var mascot: (ImageAsset val | None) = None

  let font_path: String val = "HackRegular.ttf"
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
  let font: KoreKravur ref

  new create(
    system': KoreSystem,
    mascot': ImageAsset,
    font': FontAsset)
  =>
    system = system'
    mascot = mascot'() // Apply assets to receive them.
    font = font'(KravurFontStyle(), 16.0)

    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g = framebuffer.g2()
    let grey: U32 = 0xff666666
    let wf = F32.from[I32](mascot.width())
    let hf = F32.from[I32](mascot.height())

    g.set_font(font)
    // g.set_font_size(16)
    g.set_font_color(Colors.purple())

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

      g.draw_string("Hard Kore Pony", 50, 400)

      g.set_color(Colors.white())

    g.end_gfx()
