use "lib:korec"

/* FFI to WC_Kore_Graphics4_PipelineState */
use @Kore_Graphics4_PipelineState_create[
  Pointer[_KoreGraphics4PipelineStateHandle] tag]()
use @Kore_Graphics4_PipelineState_destroy[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_compile[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getConstantLocation[
  Pointer[_KoreGraphics4ConstantLocationHandle] tag](
    self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
    name: Pointer[U8] tag)
use @Kore_Graphics4_PipelineState_getTextureUnit[
  Pointer[_KoreGraphics4TextureUnitHandle] tag](
    self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
    name: Pointer[U8] tag)

/*
use @Kore_Graphics4_PipelineState_getInputLayout[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
*/

// use @Kore_Graphics4_PipelineState_getVertexShader[
//   Pointer[_KoreGraphics4ShaderHandle] tag](
//     self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setVertexShader[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  shader: Pointer[_KoreGraphics4ShaderHandle] tag)
// use @Kore_Graphics4_PipelineState_getFragmentShader[
//   Pointer[_KoreGraphics4ShaderHandle] tag](
//     self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setFragmentShader[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  shader: Pointer[_KoreGraphics4ShaderHandle] tag)
// use @Kore_Graphics4_PipelineState_getGeometryShader[
//   Pointer[_KoreGraphics4ShaderHandle] tag](
//     self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setGeometryShader[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  shader: Pointer[_KoreGraphics4ShaderHandle] tag)
// use @Kore_Graphics4_PipelineState_getTessellationControlShader[
//   Pointer[_KoreGraphics4ShaderHandle] tag](
//     self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setTessellationControlShader[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  shader: Pointer[_KoreGraphics4ShaderHandle] tag)
// use @Kore_Graphics4_PipelineState_getTessellationEvaluationShader[
//   Pointer[_KoreGraphics4ShaderHandle] tag](
//     self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setTessellationEvaluationShader[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  shader: Pointer[_KoreGraphics4ShaderHandle] tag)

use @Kore_Graphics4_PipelineState_getCullMode[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setCullMode[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  mode: I32)
use @Kore_Graphics4_PipelineState_getDepthWrite[Bool](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setDepthWrite[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: Bool)
use @Kore_Graphics4_PipelineState_getDepthMode[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setDepthMode[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  mode: I32)
use @Kore_Graphics4_PipelineState_getStencilMode[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilMode[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  mode: I32)
use @Kore_Graphics4_PipelineState_getStencilBothPass[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilBothPass[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  action: I32)
use @Kore_Graphics4_PipelineState_getStencilDepthFail[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilDepthFail[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  action: I32)
use @Kore_Graphics4_PipelineState_getStencilFail[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilFail[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  action: I32)
use @Kore_Graphics4_PipelineState_getStencilReferenceValue[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilReferenceValue[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: I32)
use @Kore_Graphics4_PipelineState_getStencilReadMask[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilReadMask[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: I32)
use @Kore_Graphics4_PipelineState_getStencilWriteMask[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilWriteMask[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: I32)
use @Kore_Graphics4_PipelineState_getBlendSource[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setBlendSource[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  operation: I32)
use @Kore_Graphics4_PipelineState_getBlendDestination[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setBlendDestination[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  operation: I32)
use @Kore_Graphics4_PipelineState_getAlphaBlendSource[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setAlphaBlendSource[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  operation: I32)
use @Kore_Graphics4_PipelineState_getAlphaBlendDestination[I32](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setAlphaBlendDestination[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  operation: I32)
use @Kore_Graphics4_PipelineState_getColorWriteMaskRed[Bool](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setColorWriteMaskRed[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: Bool)
use @Kore_Graphics4_PipelineState_getColorWriteMaskGreen[Bool](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setColorWriteMaskGreen[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: Bool)
use @Kore_Graphics4_PipelineState_getColorWriteMaskBlue[Bool](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setColorWriteMaskBlue[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: Bool)
use @Kore_Graphics4_PipelineState_getColorWriteMaskAlpha[Bool](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setColorWriteMaskAlpha[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: Bool)
use @Kore_Graphics4_PipelineState_getConservativeRasterization[Bool](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setConservativeRasterization[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  value: Bool)


primitive _KoreGraphics4PipelineStateHandle

class KoreGraphics4PipelineState
  let _handle: Pointer[_KoreGraphics4PipelineStateHandle] tag
  var _vertex_shader: (KoreGraphics4Shader iso | None) = None
  var _fragment_shader: (KoreGraphics4Shader iso | None) = None
  var _geometry_shader: (KoreGraphics4Shader iso | None) = None
  var _tessellation_control_shader: (KoreGraphics4Shader iso | None) = None
  var _tessellation_evaluation_shader: (KoreGraphics4Shader iso | None) = None

  new create() =>
    _handle = @Kore_Graphics4_PipelineState_create()

  fun compile() =>
    @Kore_Graphics4_PipelineState_compile(_handle)

  fun ref get_constant_location(
    name: String val)
    : KoreGraphics4ConstantLocation
  =>
    KoreGraphics4ConstantLocation._from_handle(
      @Kore_Graphics4_PipelineState_getConstantLocation(
        _handle, name.cstring()))

  fun ref get_texture_unit(
    name: String val)
    : KoreGraphics4TextureUnit
  =>
    KoreGraphics4TextureUnit._from_handle(
      @Kore_Graphics4_PipelineState_getTextureUnit(
        _handle, name.cstring()))

  // TODO: KoreGraphics4PipelineState - How to handle input layout assignments?

  // TODO: KoreGraphics4PipelineState - Access to assigned shaders?
  // fun ref get_vertex_shader(): KoreGraphics4Shader ref =>
  // fun ref get_fragment_shader(): KoreGraphics4Shader ref =>
  // fun ref get_geometry_shader(): KoreGraphics4Shader ref =>
  // fun ref get_tessellation_control_shader(): KoreGraphics4Shader ref =>
  // fun ref get_tessellation_evaluation_shader(): KoreGraphics4Shader ref =>

  fun ref set_vertex_shader(shader: KoreGraphics4Shader iso) =>
    @Kore_Graphics4_PipelineState_setVertexShader(
      _handle, shader._get_handle())
    _vertex_shader = consume shader

  fun ref unset_vertex_shader(): (KoreGraphics4Shader iso^ | None) =>
    _vertex_shader = None

  fun ref set_fragment_shader(shader: KoreGraphics4Shader iso) =>
    @Kore_Graphics4_PipelineState_setFragmentShader(
      _handle, shader._get_handle())
    _fragment_shader = consume shader

  fun ref unset_fragment_shader(): (KoreGraphics4Shader iso^ | None) =>
    _fragment_shader = None

  fun ref set_geometry_shader(shader: KoreGraphics4Shader iso) =>
    @Kore_Graphics4_PipelineState_setGeometryShader(
      _handle, shader._get_handle())
    _geometry_shader = consume shader

  fun ref unset_geometry_shader(): (KoreGraphics4Shader iso^ | None) =>
    _geometry_shader = None

  fun ref set_tessellation_control_shader(shader: KoreGraphics4Shader iso) =>
    @Kore_Graphics4_PipelineState_setTessellationControlShader(
      _handle, shader._get_handle())
    _tessellation_control_shader = consume shader

  fun ref unset_tessellation_control_shader()
    : (KoreGraphics4Shader iso^ | None)
  =>
    _tessellation_control_shader = None

  fun ref set_tessellation_evaluation_shader(shader: KoreGraphics4Shader iso) =>
    @Kore_Graphics4_PipelineState_setTessellationEvaluationShader(
      _handle, shader._get_handle())
    _tessellation_evaluation_shader = consume shader

  fun ref unset_tessellation_evaluation_shader()
    : (KoreGraphics4Shader iso^ | None)
  =>
    _tessellation_evaluation_shader = None

  fun _get_handle(): Pointer[_KoreGraphics4PipelineStateHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_PipelineState_destroy(_handle)


// TODO: One, Zero deactivates blending, add convenience funcs