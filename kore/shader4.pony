use "lib:korec"

/* FFI to WC_Kore_Graphics4_Shader */
use @Kore_Graphics4_Shader_createDLT[
  Pointer[_KoreGraphics4ShaderHandle] tag](
    data: Pointer[U8] tag, length: I32, shader_type: I32)
use @Kore_Graphics4_Shader_destroy[None](
  self: Pointer[_KoreGraphics4ShaderHandle] tag)

/*
/* FFI to WC_Kore_Graphics4_ConstantLocation */
use @Kore_Graphics4_ConstantLocation_create[
  Pointer[_KoreGraphics4ConstantLocationHandle] tag]()
use @Kore_Graphics4_ConstantLocation_destroy[None](
  self: Pointer[_KoreGraphics4ConstantLocationHandle] tag)
*/


primitive ShaderTypeFragmentShader
  fun apply(): I32 => 0
primitive ShaderTypeVertexShader
  fun apply(): I32 => 1
primitive ShaderTypeGeometryShader
  fun apply(): I32 => 2
primitive ShaderTypeTessellationControlShader
  fun apply(): I32 => 3
primitive ShaderTypeTessellationEvaluationShader
  fun apply(): I32 => 4

type KoreGraphics4ShaderType is
  ( ShaderTypeFragmentShader
  | ShaderTypeVertexShader
  | ShaderTypeGeometryShader
  | ShaderTypeTessellationControlShader
  | ShaderTypeTessellationEvaluationShader
  // | ShaderTypeComputeShader
  )

primitive _KoreGraphics4ShaderHandle

class val KoreGraphics4Shader
  let _handle: Pointer[_KoreGraphics4ShaderHandle] tag
  let _data: String val

  // TODO: Neccessary to store data as private field to avoid GC?
  new val create(data: String val, shader_type: KoreGraphics4ShaderType) =>
    _data = data
    _handle = @Kore_Graphics4_Shader_createDLT(
      _data.cpointer(),
      I32.from[USize](_data.size()),
      shader_type())

  fun _get_handle(): Pointer[_KoreGraphics4ShaderHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_Shader_destroy(_handle)

primitive _KoreGraphics4ConstantLocationHandle

class val KoreGraphics4ConstantLocation
  let _handle: Pointer[_KoreGraphics4ConstantLocationHandle] tag

  /*
  // Use KoreGraphics4PipelineState.get_constant_location instead
  new val create() =>
    _handle = @Kore_Graphics4_ConstantLocation_create()
  */

  new val _from_handle(
    handle: Pointer[_KoreGraphics4ConstantLocationHandle] tag)
  =>
    _handle = handle

  fun _get_handle(): Pointer[_KoreGraphics4ConstantLocationHandle] tag =>
    _handle

  // fun _final() =>
  //   @Kore_Graphics4_ConstantLocation_destroy(_handle)
