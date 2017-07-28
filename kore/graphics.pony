use "lib:korec"

use @Kore_Graphics4_begin[None](window_id: I32)
use @Kore_Graphics4_clear[None](
  flags: U32,
  color: U32,
  depth: F32,
  stencil: I32)
use @Kore_Graphics4_end[None](window_id: I32)
use @Kore_Graphics4_swapBuffers[None](window_id: I32)

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
