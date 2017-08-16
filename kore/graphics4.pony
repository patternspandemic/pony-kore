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

type KoreGraphics4TexDir is
  ( TexDirU
  | TexDirV
  | TexDirW
  )

primitive FogTypeLinearFog
  fun apply(): I32 => 0

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

type KoreGraphics4TextureOperation is
  ( TextureOperationModulateOperation
  | TextureOperationSelectFirstOperation
  | TextureOperationSelectSecondOperation
  )

primitive TextureArgumentCurrentColorArgument
  fun apply(): I32 => 0
primitive TextureArgumentTextureColorArgument
  fun apply(): I32 => 1

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
