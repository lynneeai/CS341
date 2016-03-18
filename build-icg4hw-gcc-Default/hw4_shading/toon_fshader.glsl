#version 330
out vec3 color;

uniform sampler1D tex1D;

in vec3 normal_mv;
in vec3 light_dir;
in vec3 view_dir;

uniform vec3 La, Ld, Ls;
uniform vec3 ka, kd, ks;
uniform float alpha;

void main() {
    color = vec3(0.0,0.0,0.0);


    ///>>>>>>>>>> TODO >>>>>>>>>>>
    /// TODO 2.2: Toon shading.
    /// 1) compute ambient term.
    vec3 ref_dir = reflect( -light_dir, normal_mv);
    vec3 Iamb = ka*La;
    /// 2) compute diffuse term using the texture sampler tex.
    vec3 Idiff = kd*Ld*texture(tex1D, max( 0, dot( normal_mv, light_dir))).r;
    /// 3) compute specular term using the texture sampler tex.
    vec3 Ispec = ks*Ls*texture(tex1D, pow(max( 0, dot( ref_dir, view_dir)),alpha)).r;
    
    color = Iamb  + Idiff + Ispec;
    ///<<<<<<<<<< TODO <<<<<<<<<<<


}
