use "lib:korec"
use "regex"

class Image is Canvas
  var _texture: (KoreGraphics4Texture | None) = None
  var _render_target: (KoreGraphics4RenderTarget | None) = None
  var _texture_array: (KoreGraphics4TextureArray | None) = None
  // var _texture_array_textures: (Array[KoreGraphics1Image] | None) = None
  var _texture_array_textures: (Array[KoreGraphics4Texture] | None) = None

  var _format: KoreGraphics1ImageFormat
  var _readable: Bool

  var _graphics1: (KoreGraphics1 | None) = None
  var _graphics2: (KoreGraphics2 | None) = None
  var _graphics4: (KoreGraphics4 | None) = None

  new create(
    width: I32,
    height: I32,
    format: KoreGraphics1ImageFormat = FormatRGBA32)
    // usage: Usage
  =>
    _readable = false
    _format = format
    _texture = KoreGraphics4Texture(width, height, format, _readable)

  new create_3D(
    width: I32,
    height: I32,
    depth: I32,
    format: KoreGraphics1ImageFormat = FormatRGBA32)
    // usage: Usage
  =>
    _readable = false
    _format = format
    _texture =
      KoreGraphics4Texture.create_3D(width, height, depth, format, _readable)

  new create_render_target(
    width: I32,
    height: I32,
    format: KoreGraphics1ImageFormat = FormatRGBA32,
    // TODO: DepthStencilFormat, missing enum in Kore?
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
    _render_target = KoreGraphics4RenderTarget(
      width, height, depth_buffer_bits, antialiasing,
      format, stencil_buffer_bits, context_id)

  new create_array(
    images: Array[Image],
    format: KoreGraphics1ImageFormat = FormatRGBA32)
  =>
    """Textures in array must be readable!"""
    _readable = false
    _format = format

    let count: U32 = images.size()
    var textures: Array[KoreGraphics4Texture]
    textures = textures.create(count)
    for image in images.values() do
      textures.push(image._get_texture())
    end

    _texture_array_textures = textures
    _texture_array = KoreGraphics4TextureArray(_texture_array_textures)

  // TODO: Specialty handling where bytes is (Array[U8] iso | Array[F32] iso)
  new from_bytes(
    bytes: (Array[U8] iso | Array[F32] iso),
    width: I32,
    height: I32,
    format: KoreGraphics1ImageFormat = FormatGrey8)
    // usage: Usage
  =>
    _readable = true
    _format = format
    _texture =
      KoreGraphics4Texture.from_bytes(bytes, width, height, format, _readable)

  new from_bytes_3D(
    bytes: (Array[U8] iso | Array[F32] iso),
    width: I32,
    height: I32,
    depth: I32,
    format: KoreGraphics1ImageFormat = FormatGrey8)
    // usage: Usage
  =>
    _readable = true
    _format = format
    _texture = KoreGraphics4Texture.from_bytes_3D(
      bytes, width, height, depth, format, _readable)

  new from_encoded_bytes(
    bytes: (Array[U8] iso | Array[F32] iso),
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
    _texture = KoreGraphics4Texture.from_encoded_bytes(bytes, format, _readable)

  new from_file(
    file_name: String val,
    readable: Bool)
  =>
    _readable = readable
    _format = FormatRGBA32
    try
      let re = Regex("(?i)\\.hdr$")?
      if re == format then
        _format = FormatRGBA128
      end
    end
    _texture = KoreGraphics4Texture.from_file(file_name, _readable)

  new from_video(video: Video) =>
    _readable = false
    _format = FormatRGBA32
    _texture = video.current_image()

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

  fun non_pow2_supported()
    KoreGraphics4Primitive.non_pow2_textures_supported()

  fun width(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_width()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_width()
      else
        I32(0)
      end
    end

  fun height(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_height()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_height()
      else
        I32(0)
      end
    end

  fun depth(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_depth()
    else
      I32(0)
    end

  fun real_width(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_texture_width()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_texture_width()
      else
        I32(0)
      end
    end

  fun real_height(): I32 =>
    match _texture
    | let t: KoreGraphics4Texture => t.get_texture_height()
    else
      match _render_target
      | let rt: KoreGraphics4RenderTarget => rt.get_texture_height()
      else
        I32(0)
      end
    end

  // fun is_opaque(x: I32, y: I32): Bool => TODO
  // https://github.com/Kode/Kha/blob/master/Backends/Kore/kha/Image.hx#L292
    

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

  fun ref _get_render_target(): KoreGraphics4RenderTarget => _render_target
