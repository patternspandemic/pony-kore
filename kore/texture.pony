use "lib:korec"

/* FFI to WC_Kore_Graphics4_TextureUnit */
use @Kore_Graphics4_TextureUnit_create[
  Pointer[_KoreGraphics4TextureUnitHandle] tag]()
use @Kore_Graphics4_TextureUnit_destroy[None](
  self: Pointer[_KoreGraphics4TextureUnitHandle] tag)

/* FFI to WC_Kore_Graphics4_Texture */
// create
use @Kore_Graphics4_Texture_createWHFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    width: I32, height: I32, format: I32, readable: Bool)
// create3D
use @Kore_Graphics4_Texture_createWHDFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    width: I32, height: I32, depth: I32, format: I32, readable: Bool)
// from file?
use @Kore_Graphics4_Texture_createFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    filename: Pointer[U8] tag, readable: Bool)
// from encoded bytes
use @Kore_Graphics4_Texture_createDSFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    data: Pointer[U8] tag, size: I32, format: Pointer[U8] tag, readable: Bool)
// from bytes
use @Kore_Graphics4_Texture_createDWHFR[
  Pointer[_KoreGraphics4TextureHandle] tag](
    data: Pointer[U8] tag, width: I32, height: I32, format: I32, readable: Bool)
// from bytes 3D
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
use @Kore_Graphics4_Texture_getFormat[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getReadable[Bool](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getCompression[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getData[Pointer[U8]](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getHdrData[Pointer[F32]](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getDataSize[I32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_Texture_getInternalFormat[U32](
  self: Pointer[_KoreGraphics4TextureHandle] tag)

/* FFI to WC_Kore_Graphics4_TextureArray */
use @Kore_Graphics4_TextureArray_create[
  Pointer[_KoreGraphics4TextureArrayHandle] tag]()
use @Kore_Graphics4_TextureArray_destroy[None](
  self: Pointer[_KoreGraphics4TextureArrayHandle] tag)


primitive _KoreGraphics4TextureUnitHandle

class KoreGraphics4TextureUnit
  let _handle: Pointer[_KoreGraphics4TextureUnitHandle] tag

  /*
  // Use KoreGraphics4PipelineState.get_texture_unit instead
  new create() =>
    _handle = @Kore_Graphics4_TextureUnit_create()
  */

  new _from_handle(handle: Pointer[_KoreGraphics4TextureUnitHandle] tag) =>
    _handle = handle

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
  let _data: (Array[U8] iso | Array[F32] iso | None) = None

  /*
  new create(
    width: I32,
    height: I32,
    format: KoreGraphics1ImageFormat,
    readable: Bool)
  =>
    _handle = @Kore_Graphics4_Texture_createWHFR(
      width, height, format(), readable)
  */

  /*
  new create_3D(
    width: I32,
    height: I32,
    depth: I32,
    format: KoreGraphics1ImageFormat,
    readable: Bool)
  =>
    _handle = @Kore_Graphics4_Texture_createWHFR(
      width, height, depth, format(), readable)
  */

  new from_file(file_name: String val, readable: Bool) =>
    _handle = @Kore_Graphics4_Texture_createFR(
      file_name.cstring(), readable)

  /*
  new from_encoded_bytes(
    data: (Array[U8] iso | Array[F32] iso),
    format: String val,
    readable: Bool)
  =>
    _data = consume data
    _handle = @Kore_Graphics4_Texture_createDSFR(
      _data.cpointer(), _data.size(), format.cstring(), readable)
  */

  /*
  new from_bytes(
    data: (Array[U8] iso | Array[F32] iso),
    width: I32,
    height: I32,
    format: KoreGraphics1ImageFormat,
    readable: Bool)
  =>
    _data = consume data
    _handle = @Kore_Graphics4_Texture_createDWHFR(
      _data.cpointer(), width, height, format(), readable)
  */

  /*
  new from_bytes_3D(
    data: (Array[U8] iso | Array[F32] iso),
    width: I32,
    height: I32,
    depth: I32,
    format: KoreGraphics1ImageFormat,
    readable: Bool)
  =>
    _data = consume data
    _handle = @Kore_Graphics4_Texture_createDWHDFR(
      _data.cpointer(), width, height, depth, format(), readable)
  */

  // TODO: Kore_Graphics4_Texture_lock and Kore_Graphics4_Texture_unlock
  // Perhaps abstract behind an iterator, i.e. accept a lambda that
  // will operate over the data, and perform unlock/lock internally.
  // fun ref _lock() =>
  // fun _unlock() =>

  fun ref clear(
    x: I32,
    y: I32,
    z: I32,
    width: I32,
    height: I32,
    depth: I32,
    color: U32)
  =>
    @Kore_Graphics4_Texture_clear(_handle, x, y, z, width, height, depth, color)

  fun ref generate_mipmaps(levels: I32) =>
    @Kore_Graphics4_Texture_generateMipmaps(_handle, levels)

  fun ref set_mipmap(mipmap: KoreGraphics4Texture, level: I32) =>
    @Kore_Graphics4_Texture_setMipmap(_handle, mipmap._get_handle(), level)

  fun stride(): I32 =>
    @Kore_Graphics4_Texture_stride(_handle)

  // TODO: Return a Color here?
  fun at(x: I32, y: I32): I32 =>
    @Kore_Graphics4_Texture_at(_handle, x, y)

  fun get_texture_width(): I32 =>
    @Kore_Graphics4_Texture_getTexWidth(_handle)

  fun get_texture_height(): I32 =>
    @Kore_Graphics4_Texture_getTexHeight(_handle)

  fun get_texture_depth(): I32 =>
    @Kore_Graphics4_Texture_getTexDepth(_handle)

  fun get_width(): I32 =>
    @Kore_Graphics4_Texture_getWidth(_handle)

  fun get_height(): I32 =>
    @Kore_Graphics4_Texture_getHeight(_handle)

  fun get_depth(): I32 =>
    @Kore_Graphics4_Texture_getDepth(_handle)

  fun get_format(): I32 =>
    @Kore_Graphics4_Texture_getFormat(_handle)

  fun get_readable(): Bool =>
    @Kore_Graphics4_Texture_getReadable(_handle)

  fun get_compression(): I32 =>
    @Kore_Graphics4_Texture_getCompression(_handle)

  fun get_data(): Pointer[U8] =>
    @Kore_Graphics4_Texture_getData(_handle)

  fun get_HDR_data(): Pointer[F32] =>
    @Kore_Graphics4_Texture_getHdrData(_handle)

  fun get_data_size(): I32 =>
    @Kore_Graphics4_Texture_getDataSize(_handle)

  fun get_internal_format(): U32 =>
    @Kore_Graphics4_Texture_getInternalFormat(_handle)

  fun _get_handle(): Pointer[_KoreGraphics4TextureHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_Texture_destroy(_handle)
