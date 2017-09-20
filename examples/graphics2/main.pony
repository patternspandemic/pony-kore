use "../../kore"
use "logger"

actor Main
  var system: KoreSystem

  let mascot_path: String val = "pony-mascot.png"
  var mascot: (ImageAsset val | None) = None

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

  be receive_image(
    path: String val,
    image_asset: ImageAsset val)
  =>
    match path
    | mascot_path => mascot = image_asset
    end
    try_proceed()

  fun ref try_proceed() =>
    if
      not (mascot is None)
    then
      try
        let entry_point =
          object
            var mascot': ImageAsset val =
              mascot as ImageAsset val

            fun ref apply() =>
              Graphics2Example(
                system,
                mascot')
          end

        system(entry_point)
      end
    end

class Graphics2Example
  let system: KoreSystem
  let mascot: Image ref

  new create(
    system': KoreSystem,
    mascot': ImageAsset)
  =>
    system = system'
    mascot = mascot'() // Apply asset to receive it.

    system.notify_on_render(this~render())

  fun ref render(framebuffer: Framebuffer) =>
    let g = framebuffer.g2()
    let grey: U32 = 0xff666666
    let wf = F32.from[I32](mascot.width())
    let hf = F32.from[I32](mascot.height())

    g.begin_gfx(true, grey)

      // Centered mascot
      g.draw_image(
        mascot,
        320.0-(wf*0.5),
        240.0-(hf*0.5))

      // Scaled mascot
      g.draw_scaled_image(mascot, 10, 10, wf*0.33, hf*0.33)

      // Mascot head
      g.draw_sub_image(mascot, 500, 340, 0, 0, 140, 140)

      // Mascot head as tail
      g.draw_scaled_sub_image(
        mascot,
        0, 0, 200, 160,
        552, 78, -200, 160)

    g.end_gfx()
