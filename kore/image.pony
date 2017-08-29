use "lib:korec"
use "regex"

class Image is Canvas
  var _texture: (KoreGraphics4Texture | None) = None
  var _render_target: (KoreGraphics4RenderTarget | None) = None
  var _texture_array: (KoreGraphics4TextureArray | None) = None
  var _texture_array_textures: (Array[KoreGraphics4Texture] | None) = None

  var _format: KoreGraphics1ImageFormat
  var _readable: Bool

  var _graphics1: (KoreGraphics1 | None) = None
  var _graphics2: (KoreGraphics2 | None) = None
  var _graphics4: (KoreGraphics4 | None) = None

  new create(
    width': I32,
    height': I32,
    format: KoreGraphics1ImageFormat = FormatRGBA32)
    // usage: Usage
  =>
    _readable = false
    _format = format
    _texture = KoreGraphics4Texture(width', height', format, _readable)

  new create_3D(
    width': I32,
    height': I32,
    depth': I32,
    format: KoreGraphics1ImageFormat = FormatRGBA32)
    // usage: Usage
  =>
    _readable = false
    _format = format
    _texture =
      KoreGraphics4Texture.create_3D(width', height', depth', format, _readable)

  new create_render_target(
    width': I32,
    height': I32,
    format: KoreGraphics1ImageFormat = FormatRGBA32,
    // DepthStencilFormat missing enum in Kore, made one as in Kha
    depth_stencil: KoreGraphics4DepthStencilFormat =
      DepthStencilFormatNoDepthAndStencil,
    // antialiasing_samples: I32 = 1,
    antialiasing: Bool = false,
    context_id: I32 = 0)
  =>
    _readable = false
    _format = format
    let depth_buffer_bits = _get_depth_buffer_bits(depth_stencil)
    let stencil_buffer_bits = _get_stencil_buffer_bits(depth_stencil)
    let rt_format: KoreGraphics4RenderTargetFormat =
      _get_render_target_format(_format)
    _render_target = KoreGraphics4RenderTarget(
      width', height', depth_buffer_bits, antialiasing,
      rt_format, stencil_buffer_bits, context_id)

  new create_array(
    images: Array[Image],
    format: KoreGraphics1ImageFormat = FormatRGBA32)
  =>
    """Textures in array must be readable!"""
    _readable = false
    _format = format

    let count: USize = images.size()
    var textures: Array[KoreGraphics4Texture]
    textures = textures.create(count)
    for image in images.values() do
      match image._get_texture()
      | None => None
      | let t: KoreGraphics4Texture => textures.push(t)
      end
    end

    _texture_array_textures = textures
    _texture_array = KoreGraphics4TextureArray(textures)

  new from_bytes(
    bytes: Array[U8] iso,
    width': I32,
    height': I32,
    format: KoreGraphics1ImageFormat = FormatGrey8)
    // usage: Usage
  =>
    _readable = true
    _format = format
    _texture =
      KoreGraphics4Texture.from_bytes(consume bytes, width', height', format, _readable)

  new from_floats(
    bytes: Array[F32] iso,
    width': I32,
    height': I32,
    format: KoreGraphics1ImageFormat = FormatGrey8)
    // usage: Usage
  =>
    _readable = true
    _format = format
    _texture =
      KoreGraphics4Texture.from_floats(consume bytes, width', height', format, _readable)

  new from_bytes_3D(
    bytes: Array[U8] iso,
    width': I32,
    height': I32,
    depth': I32,
    format: KoreGraphics1ImageFormat = FormatGrey8)
    // usage: Usage
  =>
    _readable = true
    _format = format
    _texture = KoreGraphics4Texture.from_bytes_3D(
      consume bytes, width', height', depth', format, _readable)

  new from_floats_3D(
    bytes: Array[F32] iso,
    width': I32,
    height': I32,
    depth': I32,
    format: KoreGraphics1ImageFormat = FormatGrey8)
    // usage: Usage
  =>
    _readable = true
    _format = format
    _texture = KoreGraphics4Texture.from_floats_3D(
      consume bytes, width', height', depth', format, _readable)

  new from_encoded_bytes(
    bytes: Array[U8] iso,
    format: String val,
    // done_callback, // Don't need, loading is sync in Kore
    // error_callback, // Don't need, loading is sync in Kore
    readable: Bool = false)
  =>
    _readable = readable
    if (format == "HDR") or (format == "hdr") then
      _format = FormatRGBA128
    else
      _format = FormatRGBA32
    end
    _texture = KoreGraphics4Texture.from_encoded_bytes(
      consume bytes, format, _readable)

  new from_encoded_floats(
    bytes: Array[F32] iso,
    format: String val,
    // done_callback, // Don't need, loading is sync in Kore
    // error_callback, // Don't need, loading is sync in Kore
    readable: Bool = false)
  =>
    _readable = readable
    if (format == "HDR") or (format == "hdr") then
      _format = FormatRGBA128
    else
      _format = FormatRGBA32
    end
    _texture = KoreGraphics4Texture.from_encoded_floats(
      consume bytes, format, _readable)

  new from_file(
    file_name: String val,
    readable: Bool)
  =>
    _readable = readable
    _format = FormatRGBA32
    try
      let re = Regex("(?i)\\.hdr$")?
      if re == file_name then
        _format = FormatRGBA128
      end
    end
    _texture = KoreGraphics4Texture.from_file(file_name, _readable)

// TODO: Image.from_video
/*
  new from_video(video: Video) =>
    _readable = false
    _format = FormatRGBA32
    _texture = video.current_image()
*/

  fun ref g1(): KoreGraphics1 =>
    try
      _graphics1 as KoreGraphics1
    else
      var g1': KoreGraphics1 ref = KoreGraphics1(this)
      _graphics1 = g1'
      g1'
    end

  fun ref g2(): KoreGraphics2 =>
    try
      _graphics2 as KoreGraphics2
    else
      var g2': KoreGraphics2 ref = KoreGraphics2(this)
      _graphics2 = g2'
      g2'
    end
  
  fun ref g4(): KoreGraphics4 =>
    try
      _graphics4 as KoreGraphics4
    else
      var g4': KoreGraphics4 ref = KoreGraphics4(this)
      _graphics4 = g4'
      g4'
    end

  fun max_size(): I32 => I32(4096)

  fun non_pow2_supported() =>
    KoreGraphics4Primitive.non_pow2_textures_supported()

  fun ref width(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_width()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_width()
      else
        I32(0)
      end
    end

  fun ref height(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_height()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_height()
      else
        I32(0)
      end
    end

  fun ref depth(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_depth()
    else
      I32(0)
    end

  fun ref real_width(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_texture_width()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_texture_width()
      else
        I32(0)
      end
    end

  fun ref real_height(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_texture_height()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_texture_height()
      else
        I32(0)
      end
    end

  fun ref is_opaque(x: I32, y: I32): Bool =>
    match _texture
    | None => false  // What Kha does, error instead?
    | let t: KoreGraphics4Texture =>
      let color: U32 = U32.from[I32](t.at(x, y))
      let alpha: U32 = (color and 0xff000000) >> 24
      (alpha and 0xff) != 0
    end

  fun ref at(x: I32, y: I32): Color =>
    match _texture
    | None => Color(Colors.black()) // What Kha does, error instead?
    | let t: KoreGraphics4Texture =>
      let color_value: U32 = U32.from[I32](t.at(x, y))
      Color(color_value)
    end

  fun ref unload() =>
    _texture = None
    _render_target = None
    _texture_array = None
    _texture_array_textures = None

  // TODO: Image lock/unlock, for _texture only.
  // https://github.com/Kode/Kha/blob/master/Backends/Kore/kha/Image.hx#L317
  // See what you did with Vertex/IndexBuffer lock/unlock

  // TODO: Image get_pixels, for _render_target only.
  // https://github.com/Kode/Kha/blob/master/Backends/Kore/kha/Image.hx#L369

  fun ref generate_mipmaps(levels: I32) =>
    match _texture
    | None => None
    | let t: KoreGraphics4Texture => t.generate_mipmaps(levels)
    end

  fun ref set_mipmaps(mipmaps: Array[Image]) =>
    match _texture
    | None => None
    | let t: KoreGraphics4Texture =>
      for (level, image) in mipmaps.pairs() do
        match image._get_texture()
        | None => None
        | let mipmap_texture: KoreGraphics4Texture =>
          t.set_mipmap(mipmap_texture, I32.from[USize](level + 1))
        end
      end
    end

  fun ref set_depth_stencil_from(image: Image) =>
    match _render_target
    | None => None
    | let rt: KoreGraphics4RenderTarget =>
      match image._get_render_target()
      | None => None
      | let image_rt: KoreGraphics4RenderTarget =>
        rt.set_depth_stencil_from(image_rt)
      end
    end

  fun ref clear(
    x: I32, y: I32, z: I32,
    width': I32, height': I32, depth': I32,
    color: Color)
  =>
    match _texture
    | None => None
    | let t: KoreGraphics4Texture =>
      t.clear(x, y, z, width', height', depth', color())
    end

  fun is_render_target(): Bool =>
    not (_render_target is None)

  fun _get_depth_buffer_bits(
    depth_stencil: KoreGraphics4DepthStencilFormat)
    : I32
  =>
    match depth_stencil
    | DepthStencilFormatNoDepthAndStencil => -1
    | DepthStencilFormatDepthOnly => 24
    | DepthStencilFormatDepthAutoStencilAuto => 24
    | DepthStencilFormatDepth24Stencil8 => 24
    | DepthStencilFormatDepth32Stencil8 => 32
    | DepthStencilFormatDepth16 => 16
    end

  fun _get_stencil_buffer_bits(
    depth_stencil: KoreGraphics4DepthStencilFormat)
    : I32
  =>
    match depth_stencil
    | DepthStencilFormatNoDepthAndStencil => -1
    | DepthStencilFormatDepthOnly => -1
    | DepthStencilFormatDepthAutoStencilAuto => 8
    | DepthStencilFormatDepth24Stencil8 => 8
    | DepthStencilFormatDepth32Stencil8 => 8
    | DepthStencilFormatDepth16 => 0
    end

  // TODO: Image._get_render_target_format is likely incomplete/wrong.
  // There's not a Kha -> Kore correspondance between Image format enums
  fun _get_render_target_format(
    format: KoreGraphics1ImageFormat)
    : KoreGraphics4RenderTargetFormat
  =>
    match format
    | FormatRGBA32 => RenderTargetFormatTarget32Bit
    | FormatRGBA64 => RenderTargetFormatTarget64BitFloat
    | FormatA32 => RenderTargetFormatTarget32BitRedFloat
    | FormatRGBA128 => RenderTargetFormatTarget128BitFloat
    // DEPTH16 ? => RenderTargetFormatTarget16BitDepth
    | FormatGrey8 => RenderTargetFormatTarget8BitRed // L8
    | FormatA16 => RenderTargetFormatTarget16BitRedFloat
    else
      RenderTargetFormatTarget32Bit // FormatRGB24, FormatBGRA32
    end

  fun ref _get_texture(): (KoreGraphics4Texture | None) =>
    _texture

  fun ref _get_render_target(): (KoreGraphics4RenderTarget | None) =>
    _render_target

  fun ref _get_texture_array(): (KoreGraphics4TextureArray | None) =>
    _texture_array
