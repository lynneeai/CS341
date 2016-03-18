#version 330

in vec4 vpoint_mv;
in vec3 light_dir, view_dir;

out vec3 color;

uniform vec3 La, Ld, Ls;
uniform vec3 ka, kd, ks;
uniform float alpha;


void main() {
    color = vec3(0.0,0.0,0.0);
    const vec3 COLORS[6] = vec3[](
        vec3(1.0,0.0,0.0),
        vec3(0.0,1.0,0.0),
        vec3(0.0,0.0,1.0),
        vec3(1.0,1.0,0.0),
        vec3(0.0,1.0,1.0),
        vec3(1.0,0.0,1.0));
    int index = int( mod(gl_PrimitiveID,6) );
    color = COLORS[index];

    ///>>>>>>>>>> TODO >>>>>>>>>>>
    /// TODO 4.2: Flat shading.
    /// 1) compute triangle normal using dFdx and dFdy
    vec3 dx = dFdx(vpoint_mv.xyz);
    vec3 dy = dFdy(vpoint_mv.xyz);
    /*
    vec3 normal = normalize(cross( dx, dy));
    vec3 ref_dir = reflect( -light_dir, normal);
    /// 1) compute ambient term.
    vec3 Iamb = ka*La;
    /// 2) compute diffuse term.
    vec3 Idiff = kd*Ld*max( 0, dot( normal, light_dir));
    /// 3) compute specular term.
    vec3 Ispec = ks*Ls*pow(max( 0, dot( ref_dir, view_dir)),alpha);
    ///<<<<<<<<<< TODO <<<<<<<<<<<
    color = Iamb + Idiff + Ispec;
    */

    vec3 l = normalize(light_dir);
    vec3 v = normalize(view_dir);
    vec3 n = normalize(cross(dx, dy));
    vec3 r = reflect(-l, n);
    vec3 Iamb = ka*La;
    vec3 Idiff = kd*Ld*max(0, dot(n, l));
    vec3 Ispec = ks*Ls*pow(max(0, dot(r, v)), alpha);
    color = Iamb + Idiff + Ispec;

}

