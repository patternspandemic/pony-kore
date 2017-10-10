use "../../kore"
use "logger"

actor Main
  var system: KoreSystem

  let logo_path: String val = "pony-logo.png"
  var logo: (ImageAsset val | None) = None

  let mascot_path: String val = "pony-mascot.png"
  var mascot: (ImageAsset val | None) = None

  let kode_k_path: String val = "kode-k.png"
  var kode_k: (ImageAsset val | None) = None

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
    system.assets.load_image(this, logo_path)
    system.assets.load_image(this, mascot_path)
    system.assets.load_image(this, kode_k_path)
    system.assets.load_font(this, font_path)

  be receive_image(
    path: String val,
    image_asset: ImageAsset val)
  =>
    match path
    | logo_path => logo = image_asset
    | mascot_path => mascot = image_asset
    | kode_k_path => kode_k = image_asset
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
      not (logo is None) and
      not (mascot is None) and
      not (kode_k is None) and
      not (font is None)
    then
      try
        let entry_point =
          object
            var logo': ImageAsset val =
              logo as ImageAsset val
            var mascot': ImageAsset val =
              mascot as ImageAsset val
            var kode_k': ImageAsset val =
              kode_k as ImageAsset val
            var font': FontAsset val =
              font as FontAsset val

            fun ref apply() =>
              Graphics2Example(
                system,
                logo',
                mascot',
                kode_k',
                font')
          end

        system(entry_point)
      end
    end

class Graphics2Example
  let system: KoreSystem
  let logo: Image ref
  let mascot: Image ref
  let kode_k: Image ref
  let font: Font ref

  new create(
    system': KoreSystem,
    logo': ImageAsset,
    mascot': ImageAsset,
    kode_k': ImageAsset,
    font': FontAsset)
  =>
    system = system'
    logo = logo'() // Apply assets to receive them.
    mascot = mascot'()
    kode_k = kode_k'()
    font = font'()

    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g = framebuffer.g2()
    let grey: U32 = 0xff666666
    let center_x: F32 = F32.from[I32](KoreSystemPrimitive.window_width()) * 0.5
    let center_y: F32 = F32.from[I32](KoreSystemPrimitive.window_height()) * 0.5
    let k_width = F32.from[I32](kode_k.width())
    let k_height = F32.from[I32](kode_k.height())
    let mascot_width = F32.from[I32](mascot.width())
    let mascot_height = F32.from[I32](mascot.height())
    let logo_width = F32.from[I32](logo.width())
    let logo_height = F32.from[I32](logo.height())
    var a: F32

    // let wf = F32.from[I32](mascot.width())
    // let hf = F32.from[I32](mascot.height())

    g.set_font(font)
    g.set_font_size(16)
    g.set_font_style("Regular")
    g.set_image_scale_quality(ImageScaleQualityHigh)

    g.begin_gfx(true, grey)


      // Mascot peaking around Pony's logo.
      g.scissor(
        0, 0, 
        I32.from[F32](center_x - 90),
        KoreSystemPrimitive.window_height())
      a = F32.pi() * F32(0.15)
      g.push_rotation(-a, center_x, center_y)
      g.draw_scaled_image(
        mascot,
        (center_x - 50) - (mascot_width * 0.5),
        (center_y - 65) - (mascot_height * 0.5),
        mascot_width,
        mascot_height)
      // draw_image doesn't rotate just yet.
      // g.draw_image(
      //   mascot,
      //   (center_x - 10) - (mascot_width * 0.5),
      //   (center_y - 35) - (mascot_height * 0.5))
      g.pop_transformation()
      g.disable_scissor()

      // Pony logo centered
      g.draw_image(
        logo,
        center_x - (logo_width * 0.5),
        center_y - (logo_height * 0.5))

      // Kode's K hanging off Pony's logo.
      a = F32.pi() * F32(0.08)
      g.push_rotation(a, (center_x + 155), (center_y + 100))
      g.draw_scaled_image(
        kode_k,
        (center_x + 140) - (k_width * 0.5),
        (center_y + 75) - (k_height * 0.5),
        (k_width * 0.6),
        (k_height * 0.6))
      g.pop_transformation()

/*

      g.scissor(0, 0, 640, 240)

      // Centered mascot
      g.draw_image(
        mascot,
        320.0-(wf*0.5),
        240.0-(hf*0.5))

      g.disable_scissor()

      // Scaled mascot
      g.set_color(Colors.red())
      g.push_rotation(-a, 30, 30)
      g.draw_scaled_image(mascot, 10, 10, wf*0.33, hf*0.33)
      g.pop_transformation()

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

      g.push_rotation(a, 70, 140)
      g.set_color(Colors.red())
      g.draw_rect(30, 100, 80, 80, 3.0)
      g.pop_transformation()

      g.push_rotation(a, 70, 250)
      g.set_color(Colors.green())
      g.fill_rect(30, 210, 80, 80)
      g.pop_transformation()

      g.set_color(Colors.black())
      g.push_rotation(-a, 320, 240)
      g.draw_line(50, 240, 590, 240, 6.0)
      // g.set_color(Colors.yellow())
      // g.fill_triangle(50, 243, 50, 237, 590, 243)
      // g.fill_triangle(50, 237, 590, 237, 590, 243)
      // g.set_color(Colors.green())
      // g.draw_rect(50, 237, 540, 6)
      g.pop_transformation()

      g.set_color(Colors.blue())
      g.draw_line(50, 240, 590, 240, 5.0)

      g.set_color(Colors.magenta())
      g.fill_circle(320, 240, 3)

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

      g.draw_sub_string(
        "Pre sub-string. Hello sub-string! Post sub-string.", 16, 17, 170, 50)

      g.push_rotation(-a, 320, 240)
      g.set_color(Colors.pink())
      g.draw_cubic_bezier(
        [50; 320; 320; 590],
        [245; 10; 470; 245],
        12)
      g.pop_transformation()

      g.set_color(Colors.yellow())
      g.draw_cubic_bezier_path(
        [320; 370; 420; 590; 100; 30; 540; 320],
        [50; 100; 470; 345; 200; 400; 240; 50],
        5)

      g.set_color(Colors.blue())
      g.draw_polygon(
        70, 140,
        [
          Vec2(-40, -40)
          Vec2(0, 0)
          Vec2(40, 0)
          Vec2(40, 40)
          Vec2(-40, 0)
        ],
        3.0)

      g.set_color(Colors.black())
      g.fill_polygon(
        70, 250,
        [
          Vec2(-40, -40)
          Vec2(0, 0)
          Vec2(40, 0)
          Vec2(40, 40)
          Vec2(-40, 0)
        ])
*/

      g.set_color(Colors.white())

    g.end_gfx()
