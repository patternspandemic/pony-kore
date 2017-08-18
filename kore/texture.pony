use "lib:korec"

/* FFI to WC_Kore_Graphics4_TextureUnit */
use @Kore_Graphics4_TextureUnit_create[
  Pointer[_KoreGraphics4TextureUnitHandle] tag]()
use @Kore_Graphics4_TextureUnit_destroy[None](
  self: Pointer[_KoreGraphics4TextureUnitHandle] tag)

/* FFI to WC_Kore_Graphics4_Texture */
use @Kore_Graphics4_Texture_createWHFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    width: I32, height: I32, format: I32, readable: Bool)
use @Kore_Graphics4_Texture_createWHDFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    width: I32, height: I32, depth: I32, format: I32, readable: Bool)
use @Kore_Graphics4_Texture_createFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    filename: Pointer[U8] tag, readable: Bool)
use @Kore_Graphics4_Texture_createDSFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    data: Pointer[U8] tag, size: I32, format: Pointer[U8] tag, readable: Bool)
use @Kore_Graphics4_Texture_createDWHFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    data: Pointer[U8] tag, width: I32, height: I32, format: I32, readable: Bool)
use @Kore_Graphics4_Texture_createDWHDFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    data: Pointer[U8] tag, width: I32, height: I32,
    depth: I32, format: I32, readable: Bool)
use @Kore_Graphics4_Texture_destroy[None](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_lock[Pointer[U8]](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_unlock[None](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_clear[None](
  self: Pointer[_KoreGraphics4TextureHandle] tag,
  x: I32, y: I32, z: I32, width: I32, height: I32, depth: I32, color: U32)
// KORE_IOS || KORE_MACOS
// use @Kore_Graphics4_Texture_upload[None](
//   self: Pointer[_KoreGraphics4TextureHandle] tag,
//   data: Pointer[U8], stride: I32)
use @Kore_Graphics4_Texture_generateMipmaps[None](
  self: Pointer[_KoreGraphics4TextureHandle] tag,
  levels: I32)
use @Kore_Graphics4_Texture_setMipmap[None](
  self: Pointer[_KoreGraphics4TextureHandle] tag,
  mipmap: Pointer[_KoreGraphics4TextureHandle] tag,
  level: I32)
use @Kore_Graphics4_Texture_stride[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_at[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag,
  x: I32, y: I32)
use @Kore_Graphics4_Texture_getTexWidth[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getTexHeight[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getTexDepth[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getWidth[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getHeight[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getDepth[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_format[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_readable[Bool](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_compression[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_data[Pointer[U8]](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_hdrData[Pointer[F32]](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_dataSize[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_internalFormat[U32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)

/* FFI to WC_Kore_Graphics4_TextureArray */
use @Kore_Graphics4_TextureArray_create[
  Pointer[_KoreGraphics4TextureArrayHandle] tag]()
use @Kore_Graphics4_TextureArray_destroy[None](
  self: Pointer[_KoreGraphics4TextureArrayHandle] tag)


primitive _KoreGraphics4TextureUnitHandle

class KoreGraphics4TextureUnit
  let _handle: Pointer[_KoreGraphics4TextureUnitHandle] tag

  new create() =>
    _handle = @Kore_Graphics4_TextureUnit_create()

  fun _get_handle(): Pointer[_KoreGraphics4TextureUnitHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_TextureUnit_destroy(_handle)

primitive _KoreGraphics4TextureArrayHandle

class KoreGraphics4TextureArray
  let _handle: Pointer[_KoreGraphics4TextureArrayHandle] tag

  new create() =>
    _handle = @Kore_Graphics4_TextureArray_create()

  fun _get_handle(): Pointer[_KoreGraphics4TextureArrayHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_TextureArray_destroy(_handle)

primitive _KoreGraphics4TextureHandle

class KoreGraphics4Texture
  let _handle: Pointer[_KoreGraphics4TextureHandle] tag

  // new create() =>
  //   _handle = @Kore_Graphics4_Texture_xxxx()

  fun _get_handle(): Pointer[_KoreGraphics4TextureHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_Texture_destroy(_handle)
