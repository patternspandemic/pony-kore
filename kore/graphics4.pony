use "lib:korec"

/* FFI to WC_Kore_Graphics4_VertexBuffer */
use @Kore_Graphics4_VertexBuffer_create[
  Pointer[_KoreGraphics4VertexBufferHandle] tag](
    count: I32,
    structure: Pointer[_KoreGraphics4VertexStructureHandle] tag,
    instance_data_step_rate: I32)
use @Kore_Graphics4_VertexBuffer_destroy[None](
  self: Pointer[_KoreGraphics4VertexBufferHandle] tag)
use @Kore_Graphics4_VertexBuffer_lock[
  Pointer[F32]](
    self: Pointer[_KoreGraphics4VertexBufferHandle] tag)
use @Kore_Graphics4_VertexBuffer_lockSC[
  Pointer[F32]](
    self: Pointer[_KoreGraphics4VertexBufferHandle] tag,
    start: I32,
    count: I32)
use @Kore_Graphics4_VertexBuffer_unlock[None](
  self: Pointer[_KoreGraphics4VertexBufferHandle] tag)
use @Kore_Graphics4_VertexBuffer_count[I32](
  self: Pointer[_KoreGraphics4VertexBufferHandle] tag)
use @Kore_Graphics4_VertexBuffer_stride[I32](
  self: Pointer[_KoreGraphics4VertexBufferHandle] tag)

/* FFI to WC_Kore_Graphics4_IndexBuffer */
use @Kore_Graphics4_IndexBuffer_create[
  Pointer[_KoreGraphics4IndexBufferHandle] tag](
    count: I32)
use @Kore_Graphics4_IndexBuffer_destroy[None](
  self: Pointer[_KoreGraphics4IndexBufferHandle] tag)
use @Kore_Graphics4_IndexBuffer_lock[
  Pointer[I32]](
    self: Pointer[_KoreGraphics4IndexBufferHandle] tag)
use @Kore_Graphics4_IndexBuffer_unlock[None](
  self: Pointer[_KoreGraphics4IndexBufferHandle] tag)
use @Kore_Graphics4_IndexBuffer_count[I32](
  self: Pointer[_KoreGraphics4IndexBufferHandle] tag)

/* FFI to WC_Kore_Graphics4_RenderTarget */
use @Kore_Graphics4_RenderTarget_createWHDAFSC[
  Pointer[_KoreGraphics4RenderTargetHandle] tag](
    width: I32,
    height: I32,
    depth_buffer_bits: I32,
    antialiasing: Bool,
    format: I32,
    stencil_buffer_bits: I32,
    context_id: I32)
use @Kore_Graphics4_RenderTarget_createCDAFSC[
  Pointer[_KoreGraphics4RenderTargetHandle] tag](
    cube_map_size: I32,
    depth_buffer_bits: I32,
    antialiasing: Bool,
    format: I32,
    stencil_buffer_bits: I32,
    context_id: I32)
use @Kore_Graphics4_RenderTarget_destroy[None](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_RenderTarget_useColorAsTexture[None](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag,
  unit: Pointer[_KoreGraphics4TextureUnitHandle] tag)
use @Kore_Graphics4_RenderTarget_useDepthAsTexture[None](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag,
  unit: Pointer[_KoreGraphics4TextureUnitHandle] tag)
use @Kore_Graphics4_RenderTarget_setDepthStencilFrom[None](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag,
  source: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_RenderTarget_getPixels[None](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag,
  data: Pointer[U8] tag) // Note out param useage
use @Kore_Graphics4_RenderTarget_getWidth[I32](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_RenderTarget_getHeight[I32](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_RenderTarget_getTexWidth[I32](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_RenderTarget_getTexHeight[I32](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_RenderTarget_getContextId[I32](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_RenderTarget_getIsCubeMap[Bool](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_RenderTarget_getIsDepthAttachment[Bool](
  self: Pointer[_KoreGraphics4RenderTargetHandle] tag)

/* FFI to Kore Graphics4 */
use @Kore_Graphics4_setBool[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  value: Bool)
use @Kore_Graphics4_setInt[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  value: I32)
use @Kore_Graphics4_setFloat[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  value: F32)
use @Kore_Graphics4_setFloat2[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  value1: F32,
  value2: F32)
// use @Kore_Graphics4_setFloat2Vec[None](
//   location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
//   value: Pointer[_KoreVec2Handle] tag)
use @Kore_Graphics4_setFloat3[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  value1: F32,
  value2: F32,
  value3: F32)
// use @Kore_Graphics4_setFloat3Vec[None](
//   location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
//   value: Pointer[_KoreVec3Handle] tag)
use @Kore_Graphics4_setFloat4[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  value1: F32,
  value2: F32,
  value3: F32,
  value4: F32)
// use @Kore_Graphics4_setFloat4Vec[None](
//   location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
//   value: Pointer[_KoreVec4Handle] tag)
use @Kore_Graphics4_setFloats[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  floats: Pointer[F32] tag,
  count: I32)
use @Kore_Graphics4_setMatrix3FromElements[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  elements: Mat3Elements)
use @Kore_Graphics4_setMatrix4FromElements[None](
  location: Pointer[_KoreGraphics4ConstantLocationHandle] tag,
  elements: Mat4Elements)
use @Kore_Graphics4_setVertexBuffer[None](
  vertex_buffer: Pointer[_KoreGraphics4VertexBufferHandle] tag)
// TODO: Verify vertex_buffers type
use @Kore_Graphics4_setVertexBuffers[None](
  vertex_buffers: Pointer[Pointer[_KoreGraphics4VertexBufferHandle] tag] tag,
  count: I32)
use @Kore_Graphics4_setIndexBuffer[None](
  index_buffer: Pointer[_KoreGraphics4IndexBufferHandle] tag)
use @Kore_Graphics4_setTexture[None](
  unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  texture: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_setTextureArray[None](
  unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  texture_array: Pointer[_KoreGraphics4TextureArrayHandle] tag)
use @Kore_Graphics4_setImageTexture[None](
  unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  texture: Pointer[_KoreGraphics4TextureHandle] tag)
use @Kore_Graphics4_setPipeline[None](
  pipeline: Pointer[_KoreGraphics4PipelineStateHandle] tag)
use @Kore_Graphics4_drawIndexedVertices[None]()
use @Kore_Graphics4_drawIndexedVerticesSC[None](
  start: I32,
  count: I32)
use @Kore_Graphics4_drawIndexedVerticesInstancedI[None](
  instance_count: I32)
use @Kore_Graphics4_drawIndexedVerticesInstancedISC[None](
  instance_count: I32,
  start: I32,
  count: I32)
use @Kore_Graphics4_changeResolution[None](
  width: I32,
  height: I32)
use @Kore_Graphics4_hasWindow[Bool]()
use @Kore_Graphics4_setWindow[None](
  value: Bool)
use @Kore_Graphics4_antialiasingSamples[I32]()
use @Kore_Graphics4_setAntialiasingSamples[None](
  samples: I32)
use @Kore_Graphics4_renderTargetsInvertedY[Bool]()
// TODO: Verify targets type
use @Kore_Graphics4_setRenderTargets[None](
  targets: Pointer[Pointer[_KoreGraphics4RenderTargetHandle] tag] tag,
  count: I32)
use @Kore_Graphics4_setRenderTarget[None](
  target: Pointer[_KoreGraphics4RenderTargetHandle] tag)
use @Kore_Graphics4_setRenderTargetFace[None](
  texture: Pointer[_KoreGraphics4RenderTargetHandle] tag,
  face: I32)
use @Kore_Graphics4_restoreRenderTarget[None]()
use @Kore_Graphics4_setup[None]()
use @Kore_Graphics4_swapBuffers[Bool](
  window_id: I32)
use @Kore_Graphics4_begin[None](
  window_id: I32)
use @Kore_Graphics4_end[None](
  window_id: I32)
use @Kore_Graphics4_makeCurrent[None](
  window_id: I32)
use @Kore_Graphics4_clearCurrent[None]()
use @Kore_Graphics4_viewport[None](
  x: I32,
  y: I32,
  width: I32,
  height: I32)
use @Kore_Graphics4_scissor[None](
  x: I32,
  y: I32,
  width: I32,
  height: I32)
use @Kore_Graphics4_disableScissor[None]()
use @Kore_Graphics4_setTextureAddressing[None](
  texture_unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  dir: I32,
  addressing: I32)
use @Kore_Graphics4_setTextureMagnificationFilter[None](
  texture_unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  filter: I32)
use @Kore_Graphics4_setTextureMinificationFilter[None](
  texture_unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  filter: I32)
use @Kore_Graphics4_setTextureMipmapFilter[None](
  texture_unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  filter: I32)
use @Kore_Graphics4_setTexture3DAddressing[None](
  texture_unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  dir: I32,
  addressing: I32)
use @Kore_Graphics4_setTexture3DMagnificationFilter[None](
  texture_unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  filter: I32)
use @Kore_Graphics4_setTexture3DMinificationFilter[None](
  texture_unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  filter: I32)
use @Kore_Graphics4_setTexture3DMipmapFilter[None](
  texture_unit: Pointer[_KoreGraphics4TextureUnitHandle] tag,
  filter: I32)
use @Kore_Graphics4_setTextureOperation[None](
  operation: I32,
  arg1: I32,
  arg2: I32)
use @Kore_Graphics4_vsynced[Bool]()
use @Kore_Graphics4_refreshRate[U32]()
use @Kore_Graphics4_nonPow2TexturesSupported[Bool]()
// NOTE: Kore_Graphics4_initOcclusionQuery out param
use @Kore_Graphics4_initOcclusionQuery[Bool](
  occlusion_query: Pointer[U32] tag)
use @Kore_Graphics4_deleteOcclusionQuery[None](
  occlusion_query: U32)
use @Kore_Graphics4_renderOcclusionQuery[None](
  occlusion_query: U32,
  triangles: I32)
use @Kore_Graphics4_isQueryResultsAvailable[Bool](
  occlusion_query: U32)
// NOTE: Kore_Graphics4_getQueryResults out param
use @Kore_Graphics4_getQueryResults[None](
  occlusion_query: U32,
  pixel_count: Pointer[U32] tag)
use @Kore_Graphics4_clear[None](
  flags: U32,
  color: U32,
  depth: F32,
  stencil: I32)
use @Kore_Graphics4_init[None](
  window_id: I32,
  depth_buffer_bits: I32,
  stencil_buffer_bits: I32,
  vsync: Bool)
use @Kore_Graphics4_destroy[None](
  window_id: I32)
use @Kore_Graphics4_getFullscreen[Bool]()
use @Kore_Graphics4_flush[None]()


primitive TextureAddressingRepeat
  fun apply(): I32 => 0
primitive TextureAddressingMirror
  fun apply(): I32 => 1
primitive TextureAddressingClamp
  fun apply(): I32 => 2
primitive TextureAddressingBorder
  fun apply(): I32 => 3

primitive ToKoreGraphics4TextureAddressing
  fun from(value: I32): KoreGraphics4TextureAddressing =>
    match value
    | 0 => TextureAddressingRepeat
    | 1 => TextureAddressingMirror
    | 2 => TextureAddressingClamp
    | 3 => TextureAddressingBorder
    else
      TextureAddressingRepeat
    end

type KoreGraphics4TextureAddressing is
  ( TextureAddressingRepeat
  | TextureAddressingMirror
  | TextureAddressingClamp
  | TextureAddressingBorder
  )

primitive TextureFilterPointFilter
  fun apply(): I32 => 0
primitive TextureFilterLinearFilter
  fun apply(): I32 => 1
primitive TextureFilterAnisotropicFilter
  fun apply(): I32 => 2

primitive ToKoreGraphics4TextureFilter
  fun from(value: I32): KoreGraphics4TextureFilter =>
    match value
    | 0 => TextureFilterPointFilter
    | 1 => TextureFilterLinearFilter
    | 2 => TextureFilterAnisotropicFilter
    else
      TextureFilterPointFilter
    end

type KoreGraphics4TextureFilter is
  ( TextureFilterPointFilter
  | TextureFilterLinearFilter
  | TextureFilterAnisotropicFilter
  )

primitive MipMapFilterNoMipFilter
  fun apply(): I32 => 0
primitive MipMapFilterPointMipFilter
  fun apply(): I32 => 1
primitive MipMapFilterLinearMipFilter
  fun apply(): I32 => 2

primitive ToKoreGraphics4MipMapFilter
  fun from(value: I32): KoreGraphics4MipMapFilter =>
    match value
    | 0 => MipMapFilterNoMipFilter
    | 1 => MipMapFilterPointMipFilter
    | 2 => MipMapFilterLinearMipFilter
    else
      MipMapFilterNoMipFilter
    end

type KoreGraphics4MipMapFilter is
  ( MipMapFilterNoMipFilter
  | MipMapFilterPointMipFilter
  | MipMapFilterLinearMipFilter
  )

primitive RenderStateBlendingState
  fun apply(): I32 => 0
primitive RenderStateDepthTest
  fun apply(): I32 => 1
primitive RenderStateDepthTestCompare
  fun apply(): I32 => 2
primitive RenderStateDepthWrite
  fun apply(): I32 => 3
primitive RenderStateNormalize
  fun apply(): I32 => 4
primitive RenderStateBackfaceCulling
  fun apply(): I32 => 5
primitive RenderStateScissorTestState
  fun apply(): I32 => 6
primitive RenderStateAlphaTestState
  fun apply(): I32 => 7
primitive RenderStateAlphaReferenceState
  fun apply(): I32 => 8
primitive RenderStateConservativeRasterization
  fun apply(): I32 => 9

primitive ToKoreGraphics4RenderState
  fun from(value: I32): KoreGraphics4RenderState =>
    match value
    | 0 => RenderStateBlendingState
    | 1 => RenderStateDepthTest
    | 2 => RenderStateDepthTestCompare
    | 3 => RenderStateDepthWrite
    | 4 => RenderStateNormalize
    | 5 => RenderStateBackfaceCulling
    | 6 => RenderStateScissorTestState
    | 7 => RenderStateAlphaTestState
    | 8 => RenderStateAlphaReferenceState
    | 9 => RenderStateConservativeRasterization
    else
      RenderStateBlendingState
    end

type KoreGraphics4RenderState is
  ( RenderStateBlendingState
  | RenderStateDepthTest
  | RenderStateDepthTestCompare
  | RenderStateDepthWrite
  | RenderStateNormalize
  | RenderStateBackfaceCulling
  | RenderStateScissorTestState
  | RenderStateAlphaTestState
  | RenderStateAlphaReferenceState
  | RenderStateConservativeRasterization
  )

primitive BlendingOperationBlendOne
  fun apply(): I32 => 0
primitive BlendingOperationBlendZero
  fun apply(): I32 => 1
primitive BlendingOperationSourceAlpha
  fun apply(): I32 => 2
primitive BlendingOperationDestinationAlpha
  fun apply(): I32 => 3
primitive BlendingOperationInverseSourceAlpha
  fun apply(): I32 => 4
primitive BlendingOperationInverseDestinationAlpha
  fun apply(): I32 => 5
primitive BlendingOperationSourceColor
  fun apply(): I32 => 6
primitive BlendingOperationDestinationColor
  fun apply(): I32 => 7
primitive BlendingOperationInverseSourceColor
  fun apply(): I32 => 8
primitive BlendingOperationInverseDestinationColor
  fun apply(): I32 => 9

primitive ToKoreGraphics4BlendingOperation
  fun from(value: I32): KoreGraphics4BlendingOperation =>
    match value
    | 0 => BlendingOperationBlendOne
    | 1 => BlendingOperationBlendZero
    | 2 => BlendingOperationSourceAlpha
    | 3 => BlendingOperationDestinationAlpha
    | 4 => BlendingOperationInverseSourceAlpha
    | 5 => BlendingOperationInverseDestinationAlpha
    | 6 => BlendingOperationSourceColor
    | 7 => BlendingOperationDestinationColor
    | 8 => BlendingOperationInverseSourceColor
    | 9 => BlendingOperationInverseDestinationColor
    else
      BlendingOperationBlendOne
    end

type KoreGraphics4BlendingOperation is
  ( BlendingOperationBlendOne
  | BlendingOperationBlendZero
  | BlendingOperationSourceAlpha
  | BlendingOperationDestinationAlpha
  | BlendingOperationInverseSourceAlpha
  | BlendingOperationInverseDestinationAlpha
  | BlendingOperationSourceColor
  | BlendingOperationDestinationColor
  | BlendingOperationInverseSourceColor
  | BlendingOperationInverseDestinationColor
  )

primitive ZCompareModeZCompareAlways
  fun apply(): I32 => 0
primitive ZCompareModeZCompareNever
  fun apply(): I32 => 1
primitive ZCompareModeZCompareEqual
  fun apply(): I32 => 2
primitive ZCompareModeZCompareNotEqual
  fun apply(): I32 => 3
primitive ZCompareModeZCompareLess
  fun apply(): I32 => 4
primitive ZCompareModeZCompareLessEqual
  fun apply(): I32 => 5
primitive ZCompareModeZCompareGreater
  fun apply(): I32 => 6
primitive ZCompareModeZCompareGreaterEqual
  fun apply(): I32 => 7

primitive ToKoreGraphics4ZCompareMode
  fun from(value: I32): KoreGraphics4ZCompareMode =>
    match value
    | 0 => ZCompareModeZCompareAlways
    | 1 => ZCompareModeZCompareNever
    | 2 => ZCompareModeZCompareEqual
    | 3 => ZCompareModeZCompareNotEqual
    | 4 => ZCompareModeZCompareLess
    | 5 => ZCompareModeZCompareLessEqual
    | 6 => ZCompareModeZCompareGreater
    | 7 => ZCompareModeZCompareGreaterEqual
    else
      ZCompareModeZCompareAlways
    end

type KoreGraphics4ZCompareMode is
  ( ZCompareModeZCompareAlways
  | ZCompareModeZCompareNever
  | ZCompareModeZCompareEqual
  | ZCompareModeZCompareNotEqual
  | ZCompareModeZCompareLess
  | ZCompareModeZCompareLessEqual
  | ZCompareModeZCompareGreater
  | ZCompareModeZCompareGreaterEqual
  )

primitive CullModeClockwise
  fun apply(): I32 => 0
primitive CullModeCounterClockwise
  fun apply(): I32 => 1
primitive CullModeNoCulling
  fun apply(): I32 => 2

primitive ToKoreGraphics4CullMode
  fun from(value: I32): KoreGraphics4CullMode =>
    match value
    | 0 => CullModeClockwise
    | 1 => CullModeCounterClockwise
    | 2 => CullModeNoCulling
    else
      CullModeClockwise
    end

type KoreGraphics4CullMode is
  ( CullModeClockwise
  | CullModeCounterClockwise
  | CullModeNoCulling
  )

primitive TexDirU
  fun apply(): I32 => 0
primitive TexDirV
  fun apply(): I32 => 1
primitive TexDirW
  fun apply(): I32 => 2

primitive ToKoreGraphics4TexDir
  fun from(value: I32): KoreGraphics4TexDir =>
    match value
    | 0 => TexDirU
    | 1 => TexDirV
    | 2 => TexDirW
    else
      TexDirU
    end

type KoreGraphics4TexDir is
  ( TexDirU
  | TexDirV
  | TexDirW
  )

primitive FogTypeLinearFog
  fun apply(): I32 => 0

primitive ToKoreGraphics4FogType
  fun from(value: I32): KoreGraphics4FogType =>
    match value
    | 0 => FogTypeLinearFog
    else
      FogTypeLinearFog
    end

type KoreGraphics4FogType is
  ( FogTypeLinearFog
  )

primitive RenderTargetFormatTarget32Bit
  fun apply():I32 => 0
primitive RenderTargetFormatTarget64BitFloat
  fun apply():I32 => 1
primitive RenderTargetFormatTarget32BitRedFloat
  fun apply():I32 => 2
primitive RenderTargetFormatTarget128BitFloat
  fun apply():I32 => 3
primitive RenderTargetFormatTarget16BitDepth
  fun apply():I32 => 4
primitive RenderTargetFormatTarget8BitRed
  fun apply():I32 => 5
primitive RenderTargetFormatTarget16BitRedFloat
  fun apply():I32 => 6

primitive ToKoreGraphics4RenderTargetFormat
  fun from(value: I32): KoreGraphics4RenderTargetFormat =>
    match value
    | 0 => RenderTargetFormatTarget32Bit
    | 1 => RenderTargetFormatTarget64BitFloat
    | 2 => RenderTargetFormatTarget32BitRedFloat
    | 3 => RenderTargetFormatTarget128BitFloat
    | 4 => RenderTargetFormatTarget16BitDepth
    | 5 => RenderTargetFormatTarget8BitRed
    | 6 => RenderTargetFormatTarget16BitRedFloat
    else
      RenderTargetFormatTarget32Bit
    end

type KoreGraphics4RenderTargetFormat is
  ( RenderTargetFormatTarget32Bit
  | RenderTargetFormatTarget64BitFloat
  | RenderTargetFormatTarget32BitRedFloat
  | RenderTargetFormatTarget128BitFloat
  | RenderTargetFormatTarget16BitDepth
  | RenderTargetFormatTarget8BitRed
  | RenderTargetFormatTarget16BitRedFloat
  )

// TODO: Image._get_render_target_format is likely incomplete/wrong.
// There's not a Kha -> Kore correspondance between Image format enums
primitive _ImageFormatToRenderTargetFormatHelper
  fun get_render_target_format(
    format: KoreGraphics1ImageFormat)
    : KoreGraphics4RenderTargetFormat
  =>
    match format
    | FormatRGBA32 => RenderTargetFormatTarget32Bit
    | FormatRGBA64 => RenderTargetFormatTarget64BitFloat
    | FormatA32 => RenderTargetFormatTarget32BitRedFloat
    | FormatRGBA128 => RenderTargetFormatTarget128BitFloat
    // DEPTH16 ? => RenderTargetFormatTarget16BitDepth
    | FormatGrey8 => RenderTargetFormatTarget8BitRed // L8
    | FormatA16 => RenderTargetFormatTarget16BitRedFloat
    else
      RenderTargetFormatTarget32Bit // FormatRGB24, FormatBGRA32
    end

primitive DepthStencilFormatNoDepthAndStencil
  fun apply(): I32 => 0
primitive DepthStencilFormatDepthOnly
  fun apply(): I32 => 1
primitive DepthStencilFormatDepthAutoStencilAuto
  fun apply(): I32 => 2
// Below is platform specific, use with care!
primitive DepthStencilFormatDepth24Stencil8
  fun apply(): I32 => 3
primitive DepthStencilFormatDepth32Stencil8
  fun apply(): I32 => 4
primitive DepthStencilFormatDepth16
  fun apply(): I32 => 5

primitive ToKoreGraphics4DepthStencilFormat
  fun from(value: I32): KoreGraphics4DepthStencilFormat =>
    match value
    | 0 => DepthStencilFormatNoDepthAndStencil
    | 1 => DepthStencilFormatDepthOnly
    | 2 => DepthStencilFormatDepthAutoStencilAuto
    | 3 => DepthStencilFormatDepth24Stencil8
    | 4 => DepthStencilFormatDepth32Stencil8
    | 5 => DepthStencilFormatDepth16
    else
      DepthStencilFormatNoDepthAndStencil
    end

type KoreGraphics4DepthStencilFormat is
  ( DepthStencilFormatNoDepthAndStencil
  | DepthStencilFormatDepthOnly
  | DepthStencilFormatDepthAutoStencilAuto
  // Below is platform specific, use with care!
  | DepthStencilFormatDepth24Stencil8
  | DepthStencilFormatDepth32Stencil8
  | DepthStencilFormatDepth16
  )

primitive _DepthStencilFormatHelper
  fun get_depth_buffer_bits(
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

  fun get_stencil_buffer_bits(
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

primitive StencilActionKeep
  fun apply(): I32 => 0
primitive StencilActionZero
  fun apply(): I32 => 1
primitive StencilActionReplace
  fun apply(): I32 => 2
primitive StencilActionIncrement
  fun apply(): I32 => 3
primitive StencilActionIncrementWrap
  fun apply(): I32 => 4
primitive StencilActionDecrement
  fun apply(): I32 => 5
primitive StencilActionDecrementWrap
  fun apply(): I32 => 6
primitive StencilActionInvert
  fun apply(): I32 => 7

primitive ToKoreGraphics4StencilAction
  fun from(value: I32): KoreGraphics4StencilAction =>
    match value
    | 0 => StencilActionKeep
    | 1 => StencilActionZero
    | 2 => StencilActionReplace
    | 3 => StencilActionIncrement
    | 4 => StencilActionIncrementWrap
    | 5 => StencilActionDecrement
    | 6 => StencilActionDecrementWrap
    | 7 => StencilActionInvert
    else
      StencilActionKeep
    end

type KoreGraphics4StencilAction is
  ( StencilActionKeep
  | StencilActionZero
  | StencilActionReplace
  | StencilActionIncrement
  | StencilActionIncrementWrap
  | StencilActionDecrement
  | StencilActionDecrementWrap
  | StencilActionInvert
  )

primitive TextureOperationModulateOperation
  fun apply(): I32 => 0
primitive TextureOperationSelectFirstOperation
  fun apply(): I32 => 1
primitive TextureOperationSelectSecondOperation
  fun apply(): I32 => 2

primitive ToKoreGraphics4TextureOperation
  fun from(value: I32): KoreGraphics4TextureOperation =>
    match value
    | 0 => TextureOperationModulateOperation
    | 1 => TextureOperationSelectFirstOperation
    | 2 => TextureOperationSelectSecondOperation
    else
      TextureOperationModulateOperation
    end

type KoreGraphics4TextureOperation is
  ( TextureOperationModulateOperation
  | TextureOperationSelectFirstOperation
  | TextureOperationSelectSecondOperation
  )

primitive TextureArgumentCurrentColorArgument
  fun apply(): I32 => 0
primitive TextureArgumentTextureColorArgument
  fun apply(): I32 => 1

primitive ToKoreGraphics4TextureArgument
  fun from(value: I32): KoreGraphics4TextureArgument =>
    match value
    | 0 => TextureArgumentCurrentColorArgument
    | 1 => TextureArgumentTextureColorArgument
    else
      TextureArgumentCurrentColorArgument
    end

type KoreGraphics4TextureArgument is
  ( TextureArgumentCurrentColorArgument
  | TextureArgumentTextureColorArgument
  )


primitive _KoreGraphics4VertexBufferHandle

trait VertexBufferData
  fun count(): USize val
  fun step(): USize val
  fun size(): USize val
  fun apply(i: USize val): F32 ?
  fun ref update(i: USize val, value: F32): F32^ ?
  fun dispose()

class KoreGraphics4VertexBuffer
  let _handle: Pointer[_KoreGraphics4VertexBufferHandle] tag
  let _count: I32 // vertex count
  let _step: I32 // structure length
  let _size: I32 // data size
  let _data: Array[F32]

  new create(
    count': I32,
    structure: KoreGraphics4VertexStructure val,
    instance_data_step_rate: I32 = 0)
  =>
    _handle =
      @Kore_Graphics4_VertexBuffer_create(
        count', structure._get_handle(), instance_data_step_rate)
    _count = @Kore_Graphics4_VertexBuffer_count(_handle)
    _step = @Kore_Graphics4_VertexBuffer_stride(_handle) / 4
    _size = _count * _step
    let data_pointer: Pointer[F32] =
      @Kore_Graphics4_VertexBuffer_lock(_handle)
    _data = Array[F32].from_cpointer(data_pointer, USize.from[I32](_size))

  fun ref lock(): VertexBufferData =>
    let this_vbuffer = this
    object is VertexBufferData
      fun count(): USize val => USize.from[I32](_count)
      fun step(): USize val => USize.from[I32](_step)
      fun size(): USize val => USize.from[I32](_size)
      fun apply(i: USize val): F32 ? =>
        _data(i) ?
      fun ref update(i: USize val, value: F32): F32^ ? =>
        _data(i) ? = value
      fun dispose() =>
        this_vbuffer.unlock()
    end

  // TODO: KoreGraphics4VertexBuffer.lock_by_start_count()
  // Probably keep a separate _ranged_data array to expose in the
  // same manner as lock(). Will need to make sure start and count
  // fit the underlying data, and will not be out of bounds.

  // Must be box for dispose callback from object literal to work.
  fun unlock() =>
    @Kore_Graphics4_VertexBuffer_unlock(_handle)

  fun count() =>
    @Kore_Graphics4_VertexBuffer_count(_handle)

  fun stride() =>
    @Kore_Graphics4_VertexBuffer_stride(_handle)

  fun _get_handle(): Pointer[_KoreGraphics4VertexBufferHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_VertexBuffer_destroy(_handle)

primitive _KoreGraphics4IndexBufferHandle

trait IndexBufferData
  fun count(): USize val
  fun size(): USize val
  fun apply(i: USize val): I32 ?
  fun ref update(i: USize val, value: I32): I32^ ?
  fun dispose()

class KoreGraphics4IndexBuffer
  let _handle: Pointer[_KoreGraphics4IndexBufferHandle] tag
  let _count: I32 // index count
  let _size: I32 // data size, same as count
  let _data: Array[I32]

  new create(count': I32) =>
    _handle = @Kore_Graphics4_IndexBuffer_create(count')
    _count = @Kore_Graphics4_IndexBuffer_count(_handle)
    _size = _count
    let data_pointer: Pointer[I32] =
      @Kore_Graphics4_IndexBuffer_lock(_handle)
    _data = Array[I32].from_cpointer(data_pointer, USize.from[I32](_size))

  fun ref lock(): IndexBufferData =>
    let this_ibuffer = this
    object is IndexBufferData
      fun count(): USize val => USize.from[I32](_count)
      fun size(): USize val => USize.from[I32](_size)
      fun apply(i: USize val): I32 ? =>
        _data(i) ?
      fun ref update(i: USize val, value: I32): I32^ ? =>
        _data(i) ? = value
      fun dispose() =>
        this_ibuffer.unlock()
    end

  fun unlock() =>
    @Kore_Graphics4_IndexBuffer_unlock(_handle)

  fun count() =>
    @Kore_Graphics4_IndexBuffer_count(_handle)

  fun _get_handle(): Pointer[_KoreGraphics4IndexBufferHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_IndexBuffer_destroy(_handle)

primitive _KoreGraphics4RenderTargetHandle

class KoreGraphics4RenderTarget
  let _handle: Pointer[_KoreGraphics4RenderTargetHandle] tag

  new create(
    width: I32,
    height: I32,
    depth_buffer_bits: I32,
    antialiasing: Bool = false,
    format: KoreGraphics4RenderTargetFormat = RenderTargetFormatTarget32Bit,
    stencil_buffer_bits: I32 = -1,
    context_id: I32 = 0)
  =>
    _handle = @Kore_Graphics4_RenderTarget_createWHDAFSC(
      width, height, depth_buffer_bits, antialiasing,
      format(), stencil_buffer_bits, context_id)

  new cube_map(
    cube_map_size: I32,
    depth_buffer_bits: I32,
    antialiasing: Bool = false,
    format: KoreGraphics4RenderTargetFormat = RenderTargetFormatTarget32Bit,
    stencil_buffer_bits: I32 = -1,
    context_id: I32 = 0)
  =>
    _handle = @Kore_Graphics4_RenderTarget_createCDAFSC(
      cube_map_size, depth_buffer_bits, antialiasing,
      format(), stencil_buffer_bits, context_id)

  fun ref use_color_as_texture(texture_unit: KoreGraphics4TextureUnit) =>
    @Kore_Graphics4_RenderTarget_useColorAsTexture(
      _handle, texture_unit._get_handle())

  fun ref use_depth_as_texture(texture_unit: KoreGraphics4TextureUnit) =>
    @Kore_Graphics4_RenderTarget_useDepthAsTexture(
      _handle, texture_unit._get_handle())

  fun ref set_depth_stencil_from(source: KoreGraphics4RenderTarget) =>
    @Kore_Graphics4_RenderTarget_setDepthStencilFrom(
      _handle, source._get_handle())

  fun get_pixels(): Array[U8] iso^ =>
    let size: USize = USize.from[I32](
      get_texture_width() * get_texture_height())
    let data: Array[U8] iso = recover data.init(0, size) end
    @Kore_Graphics4_RenderTarget_getPixels(_handle, data.cpointer())
    consume data

  fun get_width(): I32 =>
    @Kore_Graphics4_RenderTarget_getWidth(_handle)

  fun get_height(): I32 =>
    @Kore_Graphics4_RenderTarget_getHeight(_handle)

  fun get_texture_width(): I32 =>
    @Kore_Graphics4_RenderTarget_getTexWidth(_handle)

  fun get_texture_height(): I32 =>
    @Kore_Graphics4_RenderTarget_getTexHeight(_handle)

  fun get_context_id(): I32 =>
    @Kore_Graphics4_RenderTarget_getContextId(_handle)

  fun get_is_cube_map(): Bool =>
    @Kore_Graphics4_RenderTarget_getIsCubeMap(_handle)

  fun get_is_depth_attachment(): Bool =>
    @Kore_Graphics4_RenderTarget_getIsDepthAttachment(_handle)

  fun _get_handle(): Pointer[_KoreGraphics4RenderTargetHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_RenderTarget_destroy(_handle)

primitive KoreGraphics4Primitive
  fun set_bool(
    location: KoreGraphics4ConstantLocation,
    value: Bool)
  =>
    @Kore_Graphics4_setBool(location._get_handle(), value)

  fun set_int(
    location: KoreGraphics4ConstantLocation,
    value: I32)
  =>
    @Kore_Graphics4_setInt(location._get_handle(), value)

  fun set_float(
    location: KoreGraphics4ConstantLocation,
    value: F32)
  =>
    @Kore_Graphics4_setFloat(location._get_handle(), value)

  fun set_float2(
    location: KoreGraphics4ConstantLocation,
    value1: F32,
    value2: F32)
  =>
    @Kore_Graphics4_setFloat2(location._get_handle(), value1, value2)

  fun set_float2_vec(
    location: KoreGraphics4ConstantLocation,
    value: Vec2)
  =>
    // @Kore_Graphics4_setFloat2Vec(location._get_handle(), value._get_handle())
    set_float2(location, value.x, value.y)

  fun set_float3(
    location: KoreGraphics4ConstantLocation,
    value1: F32,
    value2: F32,
    value3: F32)
  =>
    @Kore_Graphics4_setFloat3(location._get_handle(), value1, value2, value3)

  fun set_float3_vec(
    location: KoreGraphics4ConstantLocation,
    value: Vec3)
  =>
    // @Kore_Graphics4_setFloat3Vec(location._get_handle(), value._get_handle())
    set_float3(location, value.x, value.y, value.z)

  fun set_float4(
    location: KoreGraphics4ConstantLocation,
    value1: F32,
    value2: F32,
    value3: F32,
    value4: F32)
  =>
    @Kore_Graphics4_setFloat4(
      location._get_handle(), value1, value2, value3, value4)

  fun set_float4_vec(
    location: KoreGraphics4ConstantLocation,
    value: Vec4)
  =>
    // @Kore_Graphics4_setFloat4Vec(location._get_handle(), value._get_handle())
    set_float4(location, value.x, value.y, value.z, value.w)

  // Be careful to keep references to the array of floats.
  fun set_floats(
    location: KoreGraphics4ConstantLocation,
    floats: Array[F32])
  =>
    @Kore_Graphics4_setFloats(
      location._get_handle(), floats.cpointer(), I32.from[USize](floats.size()))

  fun set_matrix3(
    location: KoreGraphics4ConstantLocation,
    value: Mat3)
  =>
    let mat_elements = Mat3Elements(value.elements())
    @Kore_Graphics4_setMatrix3FromElements(location._get_handle(), mat_elements)

  fun set_matrix4(
    location: KoreGraphics4ConstantLocation,
    value: Mat4)
  =>
    let mat_elements = Mat4Elements(value.elements())
    @Kore_Graphics4_setMatrix4FromElements(location._get_handle(), mat_elements)

  fun set_vertex_buffer(
    vertex_buffer: KoreGraphics4VertexBuffer) //box
  =>
    @Kore_Graphics4_setVertexBuffer(vertex_buffer._get_handle())

  // Be careful to keep references to the array of buffers.
  fun set_vertex_buffers(
    vertex_buffers: Array[KoreGraphics4VertexBuffer]) // box
  =>
    let count: I32 = I32.from[USize](vertex_buffers.size())
    var vertex_buffers': Array[Pointer[_KoreGraphics4VertexBufferHandle] tag]
    vertex_buffers' = vertex_buffers'.create(USize.from[I32](count))
    for vb in vertex_buffers.values() do
      vertex_buffers'.push(vb._get_handle())
    end
    @Kore_Graphics4_setVertexBuffers(vertex_buffers'.cpointer(), count)

  fun set_index_buffer(
    index_buffer: KoreGraphics4IndexBuffer) //box
  =>
    @Kore_Graphics4_setIndexBuffer(index_buffer._get_handle())

  fun set_texture(
    unit: KoreGraphics4TextureUnit,
    texture: KoreGraphics4Texture)
  =>
    @Kore_Graphics4_setTexture(
      unit._get_handle(), texture._get_handle())

  fun set_texture_array(
    unit: KoreGraphics4TextureUnit,
    texture_array: KoreGraphics4TextureArray)
  =>
    @Kore_Graphics4_setTextureArray(
      unit._get_handle(), texture_array._get_handle())

  fun set_image_texture(
    unit: KoreGraphics4TextureUnit,
    texture: KoreGraphics4Texture)
  =>
    @Kore_Graphics4_setImageTexture(
      unit._get_handle(), texture._get_handle())

  fun set_pipeline(
    pipeline: KoreGraphics4PipelineState) //box
  =>
    @Kore_Graphics4_setPipeline(pipeline._get_handle())

  fun draw_indexed_vertices() =>
    @Kore_Graphics4_drawIndexedVertices()

  fun draw_indexed_vertices_by_start_count(
    start: I32,
    count: I32)
  =>
    @Kore_Graphics4_drawIndexedVerticesSC(start, count)

  fun draw_indexed_vertices_instanced(
    instance_count: I32)
  =>
    @Kore_Graphics4_drawIndexedVerticesInstancedI(instance_count)

  fun draw_indexed_vertices_instanced_by_start_count(
    instance_count: I32,
    start: I32,
    count: I32)
  =>
    @Kore_Graphics4_drawIndexedVerticesInstancedISC(
      instance_count, start, count)

  fun change_resolution(
    width: I32,
    height: I32)
  =>
    @Kore_Graphics4_changeResolution(width, height)

  fun has_window(): Bool =>
    @Kore_Graphics4_hasWindow()

  fun set_window(value: Bool) =>
    @Kore_Graphics4_setWindow(value)

  fun antialiasing_samples(): I32 =>
    @Kore_Graphics4_antialiasingSamples()

  fun set_antialiasing_samples(samples: I32) =>
    @Kore_Graphics4_setAntialiasingSamples(samples)

  fun render_targets_inverted_y(): Bool =>
    @Kore_Graphics4_renderTargetsInvertedY()

  // Be careful to keep references to the array of targets.
  fun set_render_targets(
    targets: Array[KoreGraphics4RenderTarget])
  =>
    let count: I32 = I32.from[USize](targets.size())
    var targets': Array[Pointer[_KoreGraphics4RenderTargetHandle] tag]
    targets' = targets'.create(USize.from[I32](count))
    for rt in targets.values() do
      targets'.push(rt._get_handle())
    end
    @Kore_Graphics4_setRenderTargets(targets'.cpointer(), count)

  fun set_render_target(
    target: KoreGraphics4RenderTarget)
  =>
    @Kore_Graphics4_setRenderTarget(target._get_handle())

  fun set_render_target_face(
    texture: KoreGraphics4RenderTarget,
    face: I32 = 0)
  =>
    @Kore_Graphics4_setRenderTargetFace(texture._get_handle(), face)

  fun restore_render_target() =>
    @Kore_Graphics4_restoreRenderTarget()

  fun setup() =>
    @Kore_Graphics4_setup()

  fun swap_buffers(window_id: I32 = 0): Bool =>
    @Kore_Graphics4_swapBuffers(window_id)

  fun begin_gfx(window_id: I32 = 0) =>
    @Kore_Graphics4_begin(window_id)

  fun end_gfx(window_id: I32 = 0) =>
    @Kore_Graphics4_end(window_id)

  fun make_current(window_id: I32) =>
    @Kore_Graphics4_makeCurrent(window_id)

  fun clear_current() =>
    @Kore_Graphics4_clearCurrent()

  fun viewport(
    x: I32,
    y: I32,
    width: I32,
    height: I32)
  =>
    @Kore_Graphics4_viewport(x, y, width, height)

  fun scissor(
    x: I32,
    y: I32,
    width: I32,
    height: I32)
  =>
    @Kore_Graphics4_scissor(x, y, width, height)

  fun disable_scissor() =>
    @Kore_Graphics4_disableScissor()

  fun set_texture_addressing(
    texture_unit: KoreGraphics4TextureUnit,
    dir: KoreGraphics4TexDir,
    addressing: KoreGraphics4TextureAddressing)
  =>
    @Kore_Graphics4_setTextureAddressing(
      texture_unit._get_handle(), dir(), addressing())

  fun set_texture_magnification_filter(
    texture_unit: KoreGraphics4TextureUnit,
    filter: KoreGraphics4TextureFilter)
  =>
    @Kore_Graphics4_setTextureMagnificationFilter(
      texture_unit._get_handle(), filter())

  fun set_texture_minification_filter(
    texture_unit: KoreGraphics4TextureUnit,
    filter: KoreGraphics4TextureFilter)
  =>
    @Kore_Graphics4_setTextureMinificationFilter(
      texture_unit._get_handle(), filter())

  fun set_texture_mipmap_filter(
    texture_unit: KoreGraphics4TextureUnit,
    filter: KoreGraphics4MipMapFilter)
  =>
    @Kore_Graphics4_setTextureMipmapFilter(
      texture_unit._get_handle(), filter())

  fun set_texture_3D_addressing(
    texture_unit: KoreGraphics4TextureUnit,
    dir: KoreGraphics4TexDir,
    addressing: KoreGraphics4TextureAddressing)
  =>
    @Kore_Graphics4_setTexture3DAddressing(
      texture_unit._get_handle(), dir(), addressing())

  fun set_texture_3D_magnification_filter(
    texture_unit: KoreGraphics4TextureUnit,
    filter: KoreGraphics4TextureFilter)
  =>
    @Kore_Graphics4_setTexture3DMagnificationFilter(
      texture_unit._get_handle(), filter())

  fun set_texture_3D_minification_filter(
    texture_unit: KoreGraphics4TextureUnit,
    filter: KoreGraphics4TextureFilter)
  =>
    @Kore_Graphics4_setTexture3DMinificationFilter(
      texture_unit._get_handle(), filter())

  fun set_texture_3D_mipmap_filter(
    texture_unit: KoreGraphics4TextureUnit,
    filter: KoreGraphics4MipMapFilter)
  =>
    @Kore_Graphics4_setTexture3DMipmapFilter(
      texture_unit._get_handle(), filter())

  fun set_texture_operation(
    operation: KoreGraphics4TextureOperation,
    arg1: KoreGraphics4TextureArgument,
    arg2: KoreGraphics4TextureArgument)
  =>
    @Kore_Graphics4_setTextureOperation(
      operation(), arg1(), arg2())

  fun vsynced(): Bool =>
    @Kore_Graphics4_vsynced()

  fun refresh_rate(): U32 =>
    @Kore_Graphics4_refreshRate()

  fun non_pow2_textures_supported(): Bool =>
    @Kore_Graphics4_nonPow2TexturesSupported()

  // TODO: Verify correct handling of out param
  // NOTE: Not convinced original alias is updated
  fun init_occlusion_query(
    occlusion_query: U32)
    : Bool
  =>
    var occlusion_query': U32 = occlusion_query
    @Kore_Graphics4_initOcclusionQuery(
      addressof occlusion_query')

  fun delete_occlusion_query(
    occlusion_query: U32)
  =>
    @Kore_Graphics4_deleteOcclusionQuery(occlusion_query)

  fun render_occlusion_query(
    occlusion_query: U32,
    triangles: I32)
  =>
    @Kore_Graphics4_renderOcclusionQuery(
      occlusion_query, triangles)

  fun is_query_results_available(
    occlusion_query: U32)
    : Bool
  =>
    @Kore_Graphics4_isQueryResultsAvailable(occlusion_query)

  // TODO: Verify correct handling of out param
  // NOTE: Not convinced original alias is updated
  fun get_query_results(
    occlusion_query: U32,
    pixel_count: U32)
  =>
    var pixel_count': U32 = pixel_count
    @Kore_Graphics4_getQueryResults(
      occlusion_query, addressof pixel_count')

  fun clear_color_flag(): U32 => 1
  fun clear_depth_flag(): U32 => 2
  fun clear_stencil_flag(): U32 => 4

  fun clear(
    flags: U32,
    color: U32 = 0,
    depth: F32 = 1.0,
    stencil: I32 = 0)
  =>
    @Kore_Graphics4_clear(flags, color, depth, stencil)

  fun init(
    window_id: I32,
    depth_buffer_bits: I32,
    stencil_buffer_bits: I32,
    vsync: Bool = true)
  =>
    @Kore_Graphics4_init(
      window_id, depth_buffer_bits, stencil_buffer_bits, vsync)

  fun destroy(window_id: I32) =>
    @Kore_Graphics4_destroy(window_id)

  fun get_fullscreen(): Bool =>
    @Kore_Graphics4_getFullscreen()

  fun flush() =>
    @Kore_Graphics4_flush()


// see: https://github.com/Kode/Kha/blob/master/Backends/Kore/kha/kore/graphics4/Graphics.hx
class KoreGraphics4
  var _target: (Canvas | None)
  var _render_target: (KoreGraphics4RenderTarget | None) = None

  new create(target: (Canvas | None) = None) =>
    _target = target
    match _target
    | let cube_map: CubeMap => _render_target = cube_map._get_render_target()
    | let image: Image => _render_target = image._get_render_target()
    end

  fun vsynced(): Bool =>
    KoreGraphics4Primitive.vsynced()

  fun refresh_rate(): U32 =>
    KoreGraphics4Primitive.refresh_rate()

  fun clear(
    color: (U32 | None) = None,
    depth: (F32 | None) = None,
    stencil: (I32 | None) = None)
  =>
    var flags: U32 = 0
    var color': U32 = 0
    var depth': F32 = 1.0
    var stencil': I32 = 0

    try
      color' = color as U32
      flags = flags or KoreGraphics4Primitive.clear_color_flag()
    end
    try
      depth' = depth as F32
      flags = flags or KoreGraphics4Primitive.clear_depth_flag()
    end
    try
      stencil' = stencil as I32
      flags = flags or KoreGraphics4Primitive.clear_stencil_flag()
    end
    KoreGraphics4Primitive.clear(flags, color', depth', stencil')

  fun viewport(x: I32, y: I32, width: I32, height: I32) =>
    KoreGraphics4Primitive.viewport(x, y, width, height)

  fun set_vertex_buffer(vertex_buffer: KoreGraphics4VertexBuffer) => //box
    KoreGraphics4Primitive.set_vertex_buffer(vertex_buffer)

  fun set_vertex_buffers(
    vertex_buffers: Array[KoreGraphics4VertexBuffer]) //box
  =>
    KoreGraphics4Primitive.set_vertex_buffers(vertex_buffers)

  fun set_index_buffer(index_buffer: KoreGraphics4IndexBuffer) => //box
    KoreGraphics4Primitive.set_index_buffer(index_buffer)

  // fun max_texture_size(): I32 =>
  //   I32(4096)

  fun supports_non_pow2_textures(): Bool =>
    KoreGraphics4Primitive.non_pow2_textures_supported()

  fun set_cube_map(unit: KoreGraphics4TextureUnit, cube_map: CubeMap) =>
    match cube_map._get_render_target()
    | let rt: KoreGraphics4RenderTarget => rt.use_color_as_texture(unit)
    else
      match cube_map._get_texture()
      | let t: KoreGraphics4Texture =>
        KoreGraphics4Primitive.set_texture(unit, t)
      end
    end

  fun set_cube_map_depth(unit: KoreGraphics4TextureUnit, cube_map: CubeMap) =>
    match cube_map._get_render_target()
    | let rt: KoreGraphics4RenderTarget => rt.use_depth_as_texture(unit)
    end

  fun scissor(x: I32, y: I32, width: I32, height: I32) =>
    KoreGraphics4Primitive.scissor(x, y, width, height)

  fun disable_scissor() =>
    KoreGraphics4Primitive.disable_scissor()

  fun render_targets_inverted_y(): Bool =>
    KoreGraphics4Primitive.render_targets_inverted_y()

  // fun instanced_rendering_available(): Bool =>
  //   true

  fun set_texture_parameters(
    unit: KoreGraphics4TextureUnit,
    u_addressing: KoreGraphics4TextureAddressing,
    v_addressing: KoreGraphics4TextureAddressing,
    minification_filter: KoreGraphics4TextureFilter,
    magnification_filter: KoreGraphics4TextureFilter,
    mipmap_filter: KoreGraphics4MipMapFilter)
  =>
    KoreGraphics4Primitive.set_texture_addressing(
      unit, TexDirU, u_addressing)
    KoreGraphics4Primitive.set_texture_addressing(
      unit, TexDirV, v_addressing)
    KoreGraphics4Primitive.set_texture_minification_filter(
      unit, minification_filter)
    KoreGraphics4Primitive.set_texture_magnification_filter(
      unit, magnification_filter)
    KoreGraphics4Primitive.set_texture_mipmap_filter(
      unit, mipmap_filter)

  fun set_texture_3D_parameters(
    unit: KoreGraphics4TextureUnit,
    u_addressing: KoreGraphics4TextureAddressing,
    v_addressing: KoreGraphics4TextureAddressing,
    w_addressing: KoreGraphics4TextureAddressing,
    minification_filter: KoreGraphics4TextureFilter,
    magnification_filter: KoreGraphics4TextureFilter,
    mipmap_filter: KoreGraphics4MipMapFilter)
  =>
    KoreGraphics4Primitive.set_texture_3D_addressing(
      unit, TexDirU, u_addressing)
    KoreGraphics4Primitive.set_texture_3D_addressing(
      unit, TexDirV, v_addressing)
    KoreGraphics4Primitive.set_texture_3D_addressing(
      unit, TexDirW, w_addressing)
    KoreGraphics4Primitive.set_texture_3D_minification_filter(
      unit, minification_filter)
    KoreGraphics4Primitive.set_texture_3D_magnification_filter(
      unit, magnification_filter)
    KoreGraphics4Primitive.set_texture_3D_mipmap_filter(
      unit, mipmap_filter)

  fun set_texture(unit: KoreGraphics4TextureUnit, image: Image) =>
    try
      if image.is_render_target() then
        (image._get_render_target() as KoreGraphics4RenderTarget)
          .use_color_as_texture(unit)
      else
        KoreGraphics4Primitive.set_texture(
          unit,
          image._get_texture() as KoreGraphics4Texture)
      end
    end

  fun set_texture_depth(unit: KoreGraphics4TextureUnit, image: Image) =>
    try
      (image._get_render_target() as KoreGraphics4RenderTarget)
        .use_depth_as_texture(unit)
    end

  fun set_texture_array(unit: KoreGraphics4TextureUnit, image: Image) =>
    try
      KoreGraphics4Primitive.set_texture_array(
        unit,
        image._get_texture_array() as KoreGraphics4TextureArray)
    end

// TODO: KoreGraphics4.set_video_texture
/*
  fun set_video_texture(unit: KoreGraphics4TextureUnit, video: Video) =>
    try
      let image: Image = image.from_video(video)
      KoreGraphics4Primitive.set_texture(
        unit,
        image._get_texture() as KoreGraphics4Texture)
    end
*/

  fun set_image_texture(unit: KoreGraphics4TextureUnit, image: Image) =>
    try
      KoreGraphics4Primitive.set_image_texture(
        unit,
        image._get_texture() as KoreGraphics4Texture)
    end

  fun set_pipeline(pipeline: KoreGraphics4PipelineState) => //box
    KoreGraphics4Primitive.set_pipeline(pipeline)

  fun set_bool(
    location: KoreGraphics4ConstantLocation,
    value: Bool)
  =>
    KoreGraphics4Primitive.set_bool(location, value)

  fun set_int(
    location: KoreGraphics4ConstantLocation,
    value: I32)
  =>
    KoreGraphics4Primitive.set_int(location, value)

  fun set_float(
    location: KoreGraphics4ConstantLocation,
    value: F32)
  =>
    KoreGraphics4Primitive.set_float(location, value)

  fun set_float2(
    location: KoreGraphics4ConstantLocation,
    value1: F32,
    value2: F32)
  =>
    KoreGraphics4Primitive.set_float2(location, value1, value2)

  fun set_float3(
    location: KoreGraphics4ConstantLocation,
    value1: F32,
    value2: F32,
    value3: F32)
  =>
    KoreGraphics4Primitive.set_float3(location, value1, value2, value3)

  fun set_float4(
    location: KoreGraphics4ConstantLocation,
    value1: F32,
    value2: F32,
    value3: F32,
    value4: F32)
  =>
    KoreGraphics4Primitive.set_float4(location, value1, value2, value3, value4)

  // Be careful to keep references to the array of floats.
  fun set_floats(
    location: KoreGraphics4ConstantLocation,
    floats: Array[F32])
  =>
    KoreGraphics4Primitive.set_floats(location, floats)

  fun set_vector2(
    location: KoreGraphics4ConstantLocation,
    value: Vec2)
  =>
    KoreGraphics4Primitive.set_float2_vec(location, value)

  fun set_vector3(
    location: KoreGraphics4ConstantLocation,
    value: Vec3)
  =>
    KoreGraphics4Primitive.set_float3_vec(location, value)

  fun set_vector4(
    location: KoreGraphics4ConstantLocation,
    value: Vec4)
  =>
    KoreGraphics4Primitive.set_float4_vec(location, value)

  fun set_matrix3(
    location: KoreGraphics4ConstantLocation,
    value: Mat3)
  =>
    KoreGraphics4Primitive.set_matrix3(location, value)

  fun set_matrix4(
    location: KoreGraphics4ConstantLocation,
    value: Mat4)
  =>
    KoreGraphics4Primitive.set_matrix4(location, value)

  fun draw_indexed_vertices(start: I32 = 0, count: I32 = -1) =>
    if count < 0 then
      KoreGraphics4Primitive.draw_indexed_vertices()
    else
      KoreGraphics4Primitive.draw_indexed_vertices_by_start_count(start, count)
    end

  fun draw_indexed_vertices_instanced(
    instance_count: I32,
    start: I32 = 0,
    count: I32 = -1)
  =>
    if count < 0 then
      KoreGraphics4Primitive.draw_indexed_vertices_instanced(instance_count)
    else
      KoreGraphics4Primitive.draw_indexed_vertices_instanced_by_start_count(
        instance_count,
        start,
        count)
    end

  fun ref begin_gfx(
    additional_render_targets: (Array[KoreGraphics4RenderTarget] | None) = None)
  =>
    if _target is None then
      KoreGraphics4Primitive.restore_render_target()
    else
      try
        match additional_render_targets
        | None =>
          KoreGraphics4Primitive.set_render_target(
            _render_target as KoreGraphics4RenderTarget)
        | let art: Array[KoreGraphics4RenderTarget] =>
          var additional_plus_rt_field = art.clone()
          additional_plus_rt_field.push(
            _render_target as KoreGraphics4RenderTarget)
          KoreGraphics4Primitive.set_render_targets(additional_plus_rt_field)
        end
      end
    end

  fun ref begin_face(face: I32) =>
    try
      KoreGraphics4Primitive.set_render_target_face(
        _render_target as KoreGraphics4RenderTarget, face)
    end

  // fun begin_eye(eye: I32) => // ?

  fun end_gfx() => None

  fun flush() =>
    KoreGraphics4Primitive.flush()
