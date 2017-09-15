#version 120
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform sampler2D texsampler;

varying vec2 texcoord;

void main()
{
    vec4 color = texture2D(texsampler, texcoord);
    gl_FragData[0] = vec4(color.x, color.y, color.z, 1.0);
}

