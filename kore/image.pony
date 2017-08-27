use "lib:korec"

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
    // TODO: Improve this with case insensitive regexp
    if format.contains("hdr") or format.contains("HDR") then
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
    // TODO: Improve this with case insensitive regexp, and ends with
    if format.contains(".hdr") then
      _format = FormatRGBA128
    else
      _format = FormatRGBA32
    end
    _texture = KoreGraphics4Texture.from_file(file_name, _readable)

  new from_video(video: Video) =>
    _readable = false
    _format = FormatRGBA32
    _texture = video.current_image()



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

/* --- */

// Canvas interface
fun width(): I32
fun height(): I32
fun ref g1(): KoreGraphics1
fun ref g2(): KoreGraphics2
fun ref g4(): KoreGraphics4
