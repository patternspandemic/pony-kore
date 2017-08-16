use "lib:korec"



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
