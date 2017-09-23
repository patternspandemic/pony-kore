use "lib:korec"

use "files"
use "collections"

class Font
  let _path: String val
  let _variants: Map[String val, KoreKravur]
  // let _default_style: String val
  // let _default_size: F32
  // let _default_styled_size: String val

  new create(
    path: String val,
    variants: Map[String val, String val] val)
  =>
    _path = path
    _variants = _variants.create()

    let face = Path.split(_path)._2
    // _default_size = 9999

    for (style, v) in variants.pairs() do
      let style_sizes: Array[String val] ref = v.split_by(",")
      for size in style_sizes.values() do
        let parsed_size: F32 = size.f32()
        if parsed_size > 0 then
          let variant_key: String val = style + ":" + size
          let kravur_file: String val =
            face + "-" + style + "-" // + size + ".kravur" <-- added by Kore
          let variant_path = Path.join(_path, kravur_file)
          let kravur = KoreKravur(variant_path, KravurFontStyle, parsed_size)
          _variants(variant_key) = kravur

          // TODO: Better option for Font defaults?
          // if parsed_size < smallest_size then
          //   _default_size = parsed_size
          //   _default_style = style
          // end
        end
      end
    end

    // _default_styled_size = _default_style + ":" + _default_size

  fun ref apply(size: F32 = 14, style: String val = "Regular"): KoreKravur ? =>
    let styled_size: String val = style + ":" + size.string()
    _variants(styled_size)?
