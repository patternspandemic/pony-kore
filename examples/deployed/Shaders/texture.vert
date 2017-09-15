#version 120
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

//uniform mat3 mvp;

attribute vec3 pos;
varying vec2 texcoord;
attribute vec2 tex;

void main()
{
    //gl_Position = vec4(mvp * vec3(pos.x, pos.y, 0.5), 1.0);
    gl_Position = vec4(vec3(pos.x, pos.y, 0.5), 1.0);
    texcoord = tex;
}

