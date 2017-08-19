use "lib:korec"

use @Kore_Graphics4_begin[None](window_id: I32)
use @Kore_Graphics4_clear[None](
  flags: U32,
  color: U32,
  depth: F32,
  stencil: I32)
use @Kore_Graphics4_end[None](window_id: I32)
use @Kore_Graphics4_swapBuffers[None](window_id: I32)

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
