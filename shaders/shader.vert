#version 330 core

layout (location = 0) in vec3 position;
// location = 1 for normals
layout (location = 2) in vec2 tc;

uniform mat4 pr_matrix = mat4(1.0);
uniform mat4 vw_matrix = mat4(1.0);
uniform mat4 ml_matrix = mat4(1.0);

out DATA {
    vec3 position;
    vec2 tc;
} vs_out;

void main() {
    gl_Position = pr_matrix * vw_matrix * ml_matrix * vec4(position, 1.0);
    vs_out.position = vec3(ml_matrix * vec4(position, 1.0));
    vs_out.tc = tc;
}