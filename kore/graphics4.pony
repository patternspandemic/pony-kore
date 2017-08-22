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
use @Kore_Graphics4_setBool[None]()
use @Kore_Graphics4_setInt[None]()
use @Kore_Graphics4_setFloat[None]()
use @Kore_Graphics4_setFloat2[None]()
use @Kore_Graphics4_setFloat2Vec[None]()
use @Kore_Graphics4_setFloat3[None]()
use @Kore_Graphics4_setFloat3Vec[None]()
use @Kore_Graphics4_setFloat4[None]()
use @Kore_Graphics4_setFloat4Vec[None]()
use @Kore_Graphics4_setFloats[None]()
use @Kore_Graphics4_setMatrix3[None]()
use @Kore_Graphics4_setMatrix4[None]()
use @Kore_Graphics4_setVertexBuffer[None]()
use @Kore_Graphics4_setVertexBuffers[None]()
use @Kore_Graphics4_setIndexBuffer[None]()
use @Kore_Graphics4_setTexture[None]()
use @Kore_Graphics4_setTextureArray[None]()
use @Kore_Graphics4_setImageTexture[None]()
use @Kore_Graphics4_setPipeline[None]()
use @Kore_Graphics4_drawIndexedVertices[None]()
use @Kore_Graphics4_drawIndexedVerticesSC[None]()
use @Kore_Graphics4_drawIndexedVerticesInstancedI[None]()
use @Kore_Graphics4_drawIndexedVerticesInstancedISC[None]()
use @Kore_Graphics4_changeResolution[None]()
use @Kore_Graphics4_hasWindow[Bool]()
use @Kore_Graphics4_setWindow[None]()
use @Kore_Graphics4_antialiasingSamples[I32]()
use @Kore_Graphics4_setAntialiasingSamples[None]()
use @Kore_Graphics4_renderTargetsInvertedY[Bool]()
use @Kore_Graphics4_setRenderTargets[None]()
use @Kore_Graphics4_setRenderTarget[None]()
use @Kore_Graphics4_setRenderTargetFace[None]()
use @Kore_Graphics4_restoreRenderTarget[None]()
use @Kore_Graphics4_setup[None]()
use @Kore_Graphics4_swapBuffers[Bool](window_id: I32)
use @Kore_Graphics4_begin[None](window_id: I32)
use @Kore_Graphics4_end[None](window_id: I32)
use @Kore_Graphics4_makeCurrent[None]()
use @Kore_Graphics4_clearCurrent[None]()
use @Kore_Graphics4_viewport[None]()
use @Kore_Graphics4_scissor[None]()
use @Kore_Graphics4_disableScissor[None]()
use @Kore_Graphics4_setTextureAddressing[None]()
use @Kore_Graphics4_setTextureMagnificationFilter[None]()
use @Kore_Graphics4_setTextureMinificationFilter[None]()
use @Kore_Graphics4_setTextureMipmapFilter[None]()
use @Kore_Graphics4_setTexture3DAddressing[None]()
use @Kore_Graphics4_setTexture3DMagnificationFilter[None]()
use @Kore_Graphics4_setTexture3DMinificationFilter[None]()
use @Kore_Graphics4_setTexture3DMipmapFilter[None]()
use @Kore_Graphics4_setTextureOperation[None]()
use @Kore_Graphics4_vsynced[Bool]()
use @Kore_Graphics4_refreshRate[U32]()
use @Kore_Graphics4_nonPow2TexturesSupported[Bool]()
use @Kore_Graphics4_initOcclusionQuery[Bool]()
use @Kore_Graphics4_deleteOcclusionQuery[None]()
use @Kore_Graphics4_renderOcclusionQuery[None]()
use @Kore_Graphics4_isQueryResultsAvailable[Bool]()
use @Kore_Graphics4_getQueryResults[None]()
use @Kore_Graphics4_clear[None](
  flags: U32,
  color: U32,
  depth: F32,
  stencil: I32)
use @Kore_Graphics4_init[None]()
use @Kore_Graphics4_destroy[None]()
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

primitive MipmapFilterNoMipFilter
  fun apply(): I32 => 0
primitive MipmapFilterPointMipFilter
  fun apply(): I32 => 1
primitive MipmapFilterLinearMipFilter
  fun apply(): I32 => 2

primitive ToKoreGraphics4MipmapFilter
  fun from(value: I32): KoreGraphics4MipmapFilter =>
    match value
    | 0 => MipmapFilterNoMipFilter
    | 1 => MipmapFilterPointMipFilter
    | 2 => MipmapFilterLinearMipFilter
    else
      MipmapFilterNoMipFilter
    end

type KoreGraphics4MipmapFilter is
  ( MipmapFilterNoMipFilter
  | MipmapFilterPointMipFilter
  | MipmapFilterLinearMipFilter
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
    antialiasing: Bool,
    format: KoreGraphics4RenderTargetFormat,
    stencil_buffer_bits: I32,
    context_id: I32)
  =>
    _handle = @Kore_Graphics4_RenderTarget_createWHDAFSC(
      width, height, depth_buffer_bits, antialiasing,
      format(), stencil_buffer_bits, context_id)

  new cube_map(
    cube_map_size: I32,
    depth_buffer_bits: I32,
    antialiasing: Bool,
    format: KoreGraphics4RenderTargetFormat,
    stencil_buffer_bits: I32,
    context_id: I32)
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

primitive KoreGraphics4
  fun begin_gfx(window_id: I32 = 0) =>
    @Kore_Graphics4_begin(window_id)

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

  fun end_gfx(window_id: I32 = 0) =>
    @Kore_Graphics4_end(window_id)

  fun swap_buffers(window_id: I32 = 0) =>
    @Kore_Graphics4_swapBuffers(window_id)
