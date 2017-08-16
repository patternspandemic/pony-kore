use "lib:korec"

// FFI to WC_Kore_Graphics4_VertexElement
use @Kore_Graphics4_VertexElement_create[
  Pointer[_KoreGraphics4VertexElementHandle] tag]()
use @Kore_Graphics4_VertexElement_createND[
  Pointer[_KoreGraphics4VertexElementHandle] tag](
    name: Pointer[U8] tag, data: I32)
use @Kore_Graphics4_VertexElement_createAD[
  Pointer[_KoreGraphics4VertexElementHandle] tag](
    attribute: I32, data: I32)
use @Kore_Graphics4_VertexElement_destroy[None](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_getName[Pointer[U8]](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_getAttribute[I32](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)
use @Kore_Graphics4_VertexElement_getData[I32](
  self: Pointer[_KoreGraphics4VertexElementHandle] tag)

// FFI to WC_Kore_Graphics4_VertexStructure
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
  Pointer[Pointer[_KoreGraphics4VertexElementHandle] tag](
    self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_getSize[I32](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_getInstanced[Bool](
  self: Pointer[_KoreGraphics4VertexStructureHandle] tag)
use @Kore_Graphics4_VertexStructure_maxElementsCount[I32]() // Static member


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

  new create() =>
    _vertex_element_handle = @Kore_Graphics4_VertexElement_create()

  // TODO

  fun _final() =>
    @Kore_Graphics4_VertexElement_destroy(_vertex_element_handle)

primitive _KoreGraphics4VertexStructureHandle

class KoreGraphics4VertexStructure
  let _vertex_structure_handle: Pointer[_KoreGraphics4VertexStructureHandle] tag

  new create() =>
    _vertex_structure_handle = @Kore_Graphics4_VertexStructure_create()

  // TODO

  fun _final() =>
    @Kore_Graphics4_VertexStructure_destroy(_vertex_structure_handle)
