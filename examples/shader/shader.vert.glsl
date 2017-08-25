#version 100

#ifdef GL_ES
precision mediump float;
#endif

attribute vec3 pos;

varying vec4 fragmentColor;

void main() {
	gl_Position = vec4(pos.x, pos.y, 0.5, 1.0);
	fragmentColor = vec4(1.0, 0.0, 0.0, 1.0);
}