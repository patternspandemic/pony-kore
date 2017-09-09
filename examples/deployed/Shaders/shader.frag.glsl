#version 100

#ifdef GL_ES
precision mediump float;
#endif

varying vec4 fragmentColor;

void main() {
	gl_FragColor = fragmentColor;
}