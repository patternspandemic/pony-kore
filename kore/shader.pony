use "lib:korec"

/* FFI to WC_Kore_Graphics4_Shader */
use @Kore_Graphics4_Shader_createDLT[
  Pointer[_KoreGraphics4ShaderHandle] tag](
    data: Pointer[U8] tag, length: I32, type: I32)
use @Kore_Graphics4_Shader_destroy[None](
  self: Pointer[_KoreGraphics4ShaderHandle] tag)

/* FFI to WC_Kore_Graphics4_ConstantLocation */
use @Kore_Graphics4_ConstantLocation_create[
  Pointer[_KoreGraphics4ConstantLocationHandle] tag]()
use @Kore_Graphics4_ConstantLocation_destroy[None](
  self: Pointer[_KoreGraphics4ConstantLocationHandle] tag)


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
  )

primitive _KoreGraphics4ShaderHandle

class KoreGraphics4Shader
  let _handle: Pointer[_KoreGraphics4ShaderHandle] tag

  new create(data: String val, type: KoreGraphics4ShaderType) =>
    _handle = @Kore_Graphics4_Shader_createDLT(
      data.cpointer(),
      data.size(),
      type())

  fun _get_handle(): Pointer[_KoreGraphics4ShaderHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_Shader_destroy(_handle)

primitive _KoreGraphics4ConstantLocationHandle

class KoreGraphics4ConstantLocation
  let _handle: Pointer[_KoreGraphics4ConstantLocationHandle] tag

  new create() =>
    _handle = @Kore_Graphics4_ConstantLocation_create()

  fun _get_handle(): Pointer[_KoreGraphics4ConstantLocationHandle] tag =>
    _handle

  fun _final() =>
    @Kore_Graphics4_ConstantLocation_destroy(_handle)
