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
use @Kore_Graphics4_PipelineState_setInputLayoutAt[None](
  self: Pointer[_KoreGraphics4PipelineStateHandle] tag,
  index: I32,
  vertex_structure: Pointer[_KoreGraphics4VertexStructureHandle] tag)
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
  var input_layout: Array[KoreGraphics4VertexStructure val]

  new create() =>
    _handle = @Kore_Graphics4_PipelineState_create()
    input_layout = input_layout.create(16)

  fun _assign_input_layout() =>
    // Assign input_layout to C-side object's member.
    let input_layout_slot_count: USize = 16
    for (i, vertex_structure) in input_layout.pairs() do
      if i < input_layout_slot_count then
        @Kore_Graphics4_PipelineState_setInputLayoutAt(
          _handle,
          I32.from[USize](i),
          vertex_structure._get_handle())
      end
    end
    // Null out remaining slots in the layout.
    var size = input_layout.size()
    var space: USize = 16 //input_layout.space()
    while size < space do
      @Kore_Graphics4_PipelineState_setInputLayoutAt(
        _handle,
        I32.from[USize](size),
        Pointer[_KoreGraphics4VertexStructureHandle].create())
      size = size + 1
    end

  fun compile() =>
    _assign_input_layout() // Assign input_layout to C-side
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

  fun get_cull_mode(): KoreGraphics4CullMode =>
    ToKoreGraphics4CullMode.from(
      @Kore_Graphics4_PipelineState_getCullMode(_handle))

  fun ref set_cull_mode(mode: KoreGraphics4CullMode) =>
    @Kore_Graphics4_PipelineState_setCullMode(_handle, mode())

  fun get_depth_write(): Bool =>
    @Kore_Graphics4_PipelineState_getDepthWrite(_handle)

  fun ref set_depth_write(value: Bool) =>
    @Kore_Graphics4_PipelineState_setDepthWrite(_handle, value)

  fun get_depth_mode(): KoreGraphics4ZCompareMode =>
    ToKoreGraphics4ZCompareMode.from(
      @Kore_Graphics4_PipelineState_getDepthMode(_handle))

  fun set_depth_mode(mode: KoreGraphics4ZCompareMode) =>
    @Kore_Graphics4_PipelineState_setDepthMode(_handle, mode())

  fun get_stencil_mode(): KoreGraphics4ZCompareMode =>
    ToKoreGraphics4ZCompareMode.from(
      @Kore_Graphics4_PipelineState_getStencilMode(_handle))

  fun ref set_stencil_mode(mode: KoreGraphics4ZCompareMode) =>
    @Kore_Graphics4_PipelineState_setStencilMode(_handle, mode())

  fun get_stencil_both_pass(): KoreGraphics4StencilAction =>
    ToKoreGraphics4StencilAction.from(
      @Kore_Graphics4_PipelineState_getStencilBothPass(_handle))

  fun ref set_stencil_both_pass(action: KoreGraphics4StencilAction) =>
    @Kore_Graphics4_PipelineState_setStencilBothPass(_handle, action())

  fun get_stencil_depth_fail(): KoreGraphics4StencilAction =>
    ToKoreGraphics4StencilAction.from(
      @Kore_Graphics4_PipelineState_getStencilDepthFail(_handle))

  fun ref set_stencil_depth_fail(action: KoreGraphics4StencilAction) =>
    @Kore_Graphics4_PipelineState_setStencilDepthFail(_handle, action())

  fun get_stencil_fail(): KoreGraphics4StencilAction =>
    ToKoreGraphics4StencilAction.from(
      @Kore_Graphics4_PipelineState_getStencilFail(_handle))

  fun ref set_stencil_fail(action: KoreGraphics4StencilAction) =>
    @Kore_Graphics4_PipelineState_setStencilFail(_handle, action())

  fun get_stencil_reference_value(): I32 =>
    @Kore_Graphics4_PipelineState_getStencilReferenceValue(_handle)

  fun ref set_stencil_reference_value(value: I32) =>
    @Kore_Graphics4_PipelineState_setStencilReferenceValue(_handle, value)

  fun get_stencil_read_mask(): I32 =>
    @Kore_Graphics4_PipelineState_getStencilReadMask(_handle)

  fun ref set_stencil_read_mask(value: I32) =>
    @Kore_Graphics4_PipelineState_setStencilReadMask(_handle, value)

  fun get_stencil_write_mask(): I32 =>
    @Kore_Graphics4_PipelineState_getStencilWriteMask(_handle)

  fun ref set_stencil_write_mask(value: I32) =>
    @Kore_Graphics4_PipelineState_setStencilWriteMask(_handle, value)

  fun get_blend_source(): KoreGraphics4BlendingOperation =>
    ToKoreGraphics4BlendingOperation.from(
      @Kore_Graphics4_PipelineState_getBlendSource(_handle))

  // TODO: One, Zero deactivates blending, default or add convenience funcs?
  fun ref set_blend_source(operation: KoreGraphics4BlendingOperation) =>
    @Kore_Graphics4_PipelineState_setBlendSource(_handle, operation())

  fun get_blend_destination(): KoreGraphics4BlendingOperation =>
    ToKoreGraphics4BlendingOperation.from(
      @Kore_Graphics4_PipelineState_getBlendDestination(_handle))

  // TODO: One, Zero deactivates blending, add default or convenience funcs?
  fun ref set_blend_destination(operation: KoreGraphics4BlendingOperation) =>
    @Kore_Graphics4_PipelineState_setBlendDestination(_handle, operation())

  fun get_alpha_blend_source(): KoreGraphics4BlendingOperation =>
    ToKoreGraphics4BlendingOperation.from(
      @Kore_Graphics4_PipelineState_getAlphaBlendSource(_handle))

  // TODO: One, Zero deactivates blending, add default or convenience funcs?
  fun ref set_alpha_blend_source(operation: KoreGraphics4BlendingOperation) =>
    @Kore_Graphics4_PipelineState_setAlphaBlendSource(_handle, operation())

  fun get_alpha_blend_destination(): KoreGraphics4BlendingOperation =>
    ToKoreGraphics4BlendingOperation.from(
      @Kore_Graphics4_PipelineState_getAlphaBlendDestination(_handle))

  // TODO: One, Zero deactivates blending, add default or convenience funcs?
  fun ref set_alpha_blend_destination(operation: KoreGraphics4BlendingOperation)
  =>
    @Kore_Graphics4_PipelineState_setAlphaBlendDestination(_handle, operation())

  fun get_color_write_mask_red(): Bool =>
    @Kore_Graphics4_PipelineState_getColorWriteMaskRed(_handle)

  fun set_color_write_mask_red(value: Bool) =>
    @Kore_Graphics4_PipelineState_setColorWriteMaskRed(_handle, value)

  fun get_color_write_mask_green(): Bool =>
    @Kore_Graphics4_PipelineState_getColorWriteMaskGreen(_handle)

  fun set_color_write_mask_green(value: Bool) =>
    @Kore_Graphics4_PipelineState_setColorWriteMaskGreen(_handle, value)

  fun get_color_write_mask_blue(): Bool =>
    @Kore_Graphics4_PipelineState_getColorWriteMaskBlue(_handle)

  fun set_color_write_mask_blue(value: Bool) =>
    @Kore_Graphics4_PipelineState_setColorWriteMaskBlue(_handle, value)

  fun get_color_write_mask_alpha(): Bool =>
    @Kore_Graphics4_PipelineState_getColorWriteMaskAlpha(_handle)

  fun set_color_write_mask_alpha(value: Bool) =>
    @Kore_Graphics4_PipelineState_setColorWriteMaskAlpha(_handle, value)

  fun get_conservative_rasterization(): Bool =>
    @Kore_Graphics4_PipelineState_getConservativeRasterization(_handle)

  fun set_conservative_rasterization(value: Bool) =>
    @Kore_Graphics4_PipelineState_setConservativeRasterization(_handle, value)

  fun _get_handle(): Pointer[_KoreGraphics4PipelineStateHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_PipelineState_destroy(_handle)
