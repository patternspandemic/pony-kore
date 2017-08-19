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

/*
use @Kore_Graphics4_PipelineState_getCullMode[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setCullMode[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getDepthWrite[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setDepthWrite[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getDepthMode[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setDepthMode[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getStencilMode[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilMode[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getStencilBothPass[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilBothPass[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getStencilDepthFail[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilDepthFail[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getStencilFail[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilFail[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getStencilReferenceValue[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilReferenceValue[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getStencilReadMask[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilReadMask[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getStencilWriteMask[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setStencilWriteMask[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getBlendSource[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setBlendSource[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getBlendDestination[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setBlendDestination[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getAlphaBlendSource[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setAlphaBlendSource[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getAlphaBlendDestination[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setAlphaBlendDestination[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getColorWriteMaskRed[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setColorWriteMaskRed[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getColorWriteMaskGreen[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setColorWriteMaskGreen[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getColorWriteMaskBlue[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setColorWriteMaskBlue[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getColorWriteMaskAlpha[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setColorWriteMaskAlpha[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_getConservativeRasterization[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_PipelineState_setConservativeRasterization[](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag)
*/

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