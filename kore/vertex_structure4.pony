use "lib:korec"

/* FFI to WC_Kore_Graphics4_VertexElement */
// use @Kore_Graphics4_VertexElement_create[
//   Pointer[_KoreGraphics4VertexElementHandle] tag]()
use @Kore_Graphics4_VertexElement_createND[
  Pointer[_KoreGraphics4VertexElementHandle] tag](
    name: Pointer[U8] tag, data: I32)
// Forget about Fixed-function vertex attributes
// use @Kore_Graphics4_VertexElement_createAD[
//   Pointer[_KoreGraphics4VertexElementHandle] tag](
//     attribute: I32, data: I32)
use @Kore_Graphics4_VertexElement_destroy[None](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_getName[Pointer[U8]](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_setName[None](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag,
  name: Pointer[U8] tag)
// Forget about Fixed-function vertex attributes
// use @Kore_Graphics4_VertexElement_getAttribute[I32](
//   self: Pointer[_KoreGraphics4VertexElementHandle] tag)
// use @Kore_Graphics4_VertexElement_setAttribute[None](
//   self: Pointer[_KoreGraphics4VertexElementHandle] tag,
//   attribute: I32)
use @Kore_Graphics4_VertexElement_getData[I32](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_setData[None](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag,
  data: I32)

/* FFI to WC_Kore_Graphics4_VertexStructure */
use @Kore_Graphics4_VertexStructure_create[
  Pointer[_KoreGraphics4VertexStructureHandle] tag]()
use @Kore_Graphics4_VertexStructure_destroy[None](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_addND[None](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag,
  name: Pointer[U8] tag, data: I32)
// Forget about Fixed-function vertex attributes
// use @Kore_Graphics4_VertexStructure_addAD[None](
//   self: Pointer[_KoreGraphics4VertexStructureHandle] tag,
//   attribute: I32, data: I32)
// TODO: Check return typing
use @Kore_Graphics4_VertexStructure_getElements[
  Pointer[Pointer[_KoreGraphics4VertexElementHandle] tag]](
    self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_getSize[I32](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_getInstanced[Bool](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_setInstanced[None](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag,
  value: Bool)
 // Static member
use @Kore_Graphics4_VertexStructure_maxElementsCount[I32]()


primitive VertexDataNoVertexData
  fun apply(): I32 => 0
primitive VertexDataFloat1VertexData
  fun apply(): I32 => 1
primitive VertexDataFloat2VertexData
  fun apply(): I32 => 2
primitive VertexDataFloat3VertexData
  fun apply(): I32 => 3
primitive VertexDataFloat4VertexData
  fun apply(): I32 => 4
primitive VertexDataFloat4x4VertexData
  fun apply(): I32 => 5
primitive VertexDataColorVertexData
  fun apply(): I32 => 6

primitive ToKoreGraphics4VertexData
  fun from(value: I32): KoreGraphics4VertexData =>
    match value
    | 0 => VertexDataNoVertexData
    | 1 => VertexDataFloat1VertexData
    | 2 => VertexDataFloat2VertexData
    | 3 => VertexDataFloat3VertexData
    | 4 => VertexDataFloat4VertexData
    | 5 => VertexDataFloat4x4VertexData
    | 6 => VertexDataColorVertexData
    else
      VertexDataNoVertexData
    end

type KoreGraphics4VertexData is
  ( VertexDataNoVertexData
  | VertexDataFloat1VertexData
  | VertexDataFloat2VertexData
  | VertexDataFloat3VertexData
  | VertexDataFloat4VertexData
  | VertexDataFloat4x4VertexData
  | VertexDataColorVertexData
  )

primitive VertexAttributeNoVertexAttribute
  fun apply(): I32 => 0
primitive VertexAttributeVertexCoord
  fun apply(): I32 => 1
primitive VertexAttributeVertexNormal
  fun apply(): I32 => 2
primitive VertexAttributeVertexColor0
  fun apply(): I32 => 3
primitive VertexAttributeVertexColor1
  fun apply(): I32 => 4
primitive VertexAttributeVertexTexCoord0
  fun apply(): I32 => 5
primitive VertexAttributeVertexTexCoord1
  fun apply(): I32 => 6
primitive VertexAttributeVertexTexCoord2
  fun apply(): I32 => 7
primitive VertexAttributeVertexTexCoord3
  fun apply(): I32 => 8
primitive VertexAttributeVertexTexCoord4
  fun apply(): I32 => 9
primitive VertexAttributeVertexTexCoord5
  fun apply(): I32 => 10
primitive VertexAttributeVertexTexCoord6
  fun apply(): I32 => 11
primitive VertexAttributeVertexTexCoord7
  fun apply(): I32 => 12

primitive ToKoreGraphics4VertexAttribute
  fun from(value: I32): KoreGraphics4VertexAttribute =>
    match value
    | 0 => VertexAttributeNoVertexAttribute
    | 1 => VertexAttributeVertexCoord
    | 2 => VertexAttributeVertexNormal
    | 3 => VertexAttributeVertexColor0
    | 4 => VertexAttributeVertexColor1
    | 5 => VertexAttributeVertexTexCoord0
    | 6 => VertexAttributeVertexTexCoord1
    | 7 => VertexAttributeVertexTexCoord2
    | 8 => VertexAttributeVertexTexCoord3
    | 9 => VertexAttributeVertexTexCoord4
    | 10 => VertexAttributeVertexTexCoord5
    | 11 => VertexAttributeVertexTexCoord6
    | 12 => VertexAttributeVertexTexCoord7
    else
      VertexAttributeNoVertexAttribute
    end

type KoreGraphics4VertexAttribute is
  ( VertexAttributeNoVertexAttribute
  | VertexAttributeVertexCoord
  | VertexAttributeVertexNormal
  | VertexAttributeVertexColor0
  | VertexAttributeVertexColor1
  | VertexAttributeVertexTexCoord0
  | VertexAttributeVertexTexCoord1
  | VertexAttributeVertexTexCoord2
  | VertexAttributeVertexTexCoord3
  | VertexAttributeVertexTexCoord4
  | VertexAttributeVertexTexCoord5
  | VertexAttributeVertexTexCoord6
  | VertexAttributeVertexTexCoord7
  )

primitive _KoreGraphics4VertexElementHandle

class KoreGraphics4VertexElement
  let _handle: Pointer[_KoreGraphics4VertexElementHandle] tag

  new create(name: String val, data: KoreGraphics4VertexData) =>
    _handle =
      @Kore_Graphics4_VertexElement_createND(name.cstring(), data())

  fun get_name(): String val =>
    recover val String.from_cstring(
      @Kore_Graphics4_VertexElement_getName(_handle))
    end

  fun ref set_name(name: String val) =>
    @Kore_Graphics4_VertexElement_setName(
      _handle,
      name.cstring())

  /* Forget about Fixed-function vertex attributes
  fun get_attribute(): KoreGraphics4VertexAttribute =>
    ToKoreGraphics4VertexAttribute.from(
      @Kore_Graphics4_VertexElement_getAttribute(_handle))

  fun ref set_attribute(attribute: KoreGraphics4VertexAttribute) =>
    @Kore_Graphics4_VertexElement_setAttribute(
      _handle,
      attribute())
  */

  fun get_data(): KoreGraphics4VertexData =>
    ToKoreGraphics4VertexData.from(
      @Kore_Graphics4_VertexElement_getData(_handle))

  fun ref set_data(data: KoreGraphics4VertexData) =>
    @Kore_Graphics4_VertexElement_setData(_handle, data())

  fun _get_handle(): Pointer[_KoreGraphics4VertexElementHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_VertexElement_destroy(_handle)

primitive _KoreGraphics4VertexStructureHandle

class trn KoreGraphics4VertexStructure
  let _handle: Pointer[_KoreGraphics4VertexStructureHandle] tag
  let _element_names: Array[String val]

  new trn create() =>
    _handle = @Kore_Graphics4_VertexStructure_create()
    _element_names = _element_names.create()

  fun ref add(name: String val, data: KoreGraphics4VertexData) =>
    _element_names.push(name)
    @Kore_Graphics4_VertexStructure_addND(
      _handle,
      name.cstring(),
      data())

  /* Forget about Fixed-function vertex attributes
  fun add_by_attribute(
    attribute: KoreGraphics4VertexAttribute,
    data: KoreGraphics4VertexData)
  =>
    @Kore_Graphics4_VertexStructure_addAD(
      _handle,
      attribute(),
      data())
  */

  // TODO: KoreGraphics4VertexStructure elements handling
  //
  //   Probably should provide indexed get_element & set_element
  //   accessors as an interface to elements. Return & take 
  //   KoreGraphics4VertexElement types, constructed specially such that they
  //   are not finalised when gc'd, because the C side VertexStructure actually
  //   holds ownership of the elements.
  //
  //   It may be the case that elements need not even be exposed. Need to look
  //   at the use cases for manipulating elements after adding.

  fun get_size(): I32 =>
    @Kore_Graphics4_VertexStructure_getSize(_handle)

  // TODO: KoreGraphics4VertexStructure.set_instanced?
  fun get_instanced(): Bool =>
    @Kore_Graphics4_VertexStructure_getInstanced(_handle)

  fun ref set_instanced(value: Bool) =>
    @Kore_Graphics4_VertexStructure_setInstanced(
      _handle, value)

  fun get_max_elements_count(): I32 =>
    // Call to a static member, doesn't require handle.
    @Kore_Graphics4_VertexStructure_maxElementsCount()

  fun _get_handle(): Pointer[_KoreGraphics4VertexStructureHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_VertexStructure_destroy(_handle)
