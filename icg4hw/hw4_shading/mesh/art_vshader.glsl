#version 330

in vec3 vpoint;
in vec3 vnormal;

uniform mat4 projection;
uniform mat4 model;
uniform mat4 view;
uniform vec3 light_pos;

out vec3 normal_mv;
out vec3 light_dir;
out vec3 view_dir;

void main() {
    mat4 MV = view * model;
    vec4 vpoint_mv = MV * vec4(vpoint, 1.0);
    gl_Position = projection * vpoint_mv;
    // TODO: These variables need to be set approriatly.
    //>>>>>>>>>> TODO >>>>>>>>>>>
    // TODO 1.1: Phong shading.
    // 1) compute normal_mv using the model_view matrix.
    // 2) compute the light direction light_dir.
    // 3) compute the view direction view_dir.
    /*
    normal_mv = normalize(mat3(inverse(transpose(MV))) * vnormal);
    light_dir = normalize(light_pos - vpoint_mv.xyz);
    view_dir = normalize(vec3(0.0,0.0,0.0) - vpoint_mv.xyz);
    */

    normal_mv = mat3(transpose(inverse(MV))) * vnormal;
    light_dir = light_pos - vpoint_mv.xyz;
    view_dir = -vpoint_mv.xyz;

    //<<<<<<<<<< TODO <<<<<<<<<<<

}
