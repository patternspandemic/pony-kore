#version 120
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

void main()
{
    gl_FragData[0] = vec4(1.0, 0.0, 0.0, 1.0);
}
