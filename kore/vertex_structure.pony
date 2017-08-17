use "lib:korec"

/* FFI to WC_Kore_Graphics4_VertexElement */
// use @Kore_Graphics4_VertexElement_create[
//   Pointer[_KoreGraphics4VertexElementHandle] tag]()
use @Kore_Graphics4_VertexElement_createND[
  Pointer[_KoreGraphics4VertexElementHandle] tag](
    name: Pointer[U8] tag, data: I32)
// use @Kore_Graphics4_VertexElement_createAD[
//   Pointer[_KoreGraphics4VertexElementHandle] tag](
//     attribute: I32, data: I32)
use @Kore_Graphics4_VertexElement_destroy[None](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_getName[Pointer[U8]](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_getAttribute[I32](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_getData[I32](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)

/* FFI to WC_Kore_Graphics4_VertexStructure */
use @Kore_Graphics4_VertexStructure_create[
  Pointer[_KoreGraphics4VertexStructureHandle] tag]()
use @Kore_Graphics4_VertexStructure_destroy[None](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_addND[None](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag,
  name: Pointer[U8] tag, data: I32)
use @Kore_Graphics4_VertexStructure_addAD[None](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag,
  attribute: I32, data: I32)
// TODO: Check return typing
use @Kore_Graphics4_VertexStructure_getElements[
  Pointer[Pointer[_KoreGraphics4VertexElementHandle] tag]](
    self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_getSize[I32](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_getInstanced[Bool](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
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
  let _vertex_element_handle: Pointer[_KoreGraphics4VertexElementHandle] tag

  new create(name: String val, data: KoreGraphics4VertexData) =>
    _vertex_element_handle =
      @Kore_Graphics4_VertexElement_createND(name.cstring(), data())

  fun get_name(): String val =>
    recover val String.from_cstring(
      @Kore_Graphics4_VertexElement_getName(_vertex_element_handle))
    end

  fun get_attribute(): KoreGraphics4VertexAttribute =>
    ToKoreGraphics4VertexAttribute.from(
      @Kore_Graphics4_VertexElement_getAttribute(_vertex_element_handle))

  fun get_data(): KoreGraphics4VertexData =>
    ToKoreGraphics4VertexData.from(
      @Kore_Graphics4_VertexElement_getData(_vertex_element_handle))

  fun _final() =>
    @Kore_Graphics4_VertexElement_destroy(_vertex_element_handle)

primitive _KoreGraphics4VertexStructureHandle

class KoreGraphics4VertexStructure
  let _vertex_structure_handle: Pointer[_KoreGraphics4VertexStructureHandle] tag

  new create() =>
    _vertex_structure_handle = @Kore_Graphics4_VertexStructure_create()

  fun add(name: String val, data: KoreGraphics4VertexData) =>
    @Kore_Graphics4_VertexStructure_addND(
      _vertex_structure_handle,
      name.cstring(),
      data())

  fun add_by_attribute(
    attribute: KoreGraphics4VertexAttribute,
    data: KoreGraphics4VertexData)
  =>
    @Kore_Graphics4_VertexStructure_addAD(
      _vertex_structure_handle,
      attribute(),
      data())

  // TODO
  // fun get_elements(): Array[KoreGraphics4VertexElement] =>
  //   // Not sure how to do this. Perhaps create a from_cpointer
  //   // constructor on KoreGraphics4VertexElement that also sets
  //   // that element NOT to be destroyed when that array is gc'd
  //   // May not even need elemets access, what's use case?

  fun get_size(): I32 =>
    @Kore_Graphics4_VertexStructure_getSize(_vertex_structure_handle)

  // TODO: KoreGraphics4VertexStructure.set_instanced?
  fun get_instanced(): Bool =>
    @Kore_Graphics4_VertexStructure_getInstanced(_vertex_structure_handle)

  fun get_max_elements_count(): I32 =>
    // Call to a static member, doesn't require handle.
    @Kore_Graphics4_VertexStructure_maxElementsCount()

  fun _final() =>
    @Kore_Graphics4_VertexStructure_destroy(_vertex_structure_handle)
