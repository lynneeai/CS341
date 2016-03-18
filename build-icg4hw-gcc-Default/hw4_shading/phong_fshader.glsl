#version 330

in vec3 normal_mv;
in vec3 light_dir;
in vec3 view_dir;

out vec3 color;
uniform vec3 La, Ld, Ls;
uniform vec3 ka, kd, ks;
uniform float alpha;

void main() {
    color = vec3(0.0,0.0,0.0);

    /*const vec3 COLORS[6] = vec3[](
        vec3(1.0,0.0,0.0),
        vec3(0.0,1.0,0.0),
        vec3(0.0,0.0,1.0),
        vec3(1.0,1.0,0.0),
        vec3(0.0,1.0,1.0),
        vec3(1.0,0.0,1.0));
    int index = int( mod(gl_PrimitiveID,6) );
    color = COLORS[index];*/
    
    /*
    vec3 ref_dir = reflect( -light_dir, normal_mv);

    //>>>>>>>>>> TODO >>>>>>>>>>>
    // TODO 1.2: Phong shading.
    // 1) compute ambient term.
    vec3 Iamb = ka*La;
    // 2) compute diffuse term.
    vec3 Idiff = kd*Ld*dot( normal_mv, light_dir);
    // 3) compute specular term.
    vec3 Ispec = ks*Ls*pow(max( 0, dot( ref_dir, view_dir)),alpha);
    
    color = Iamb + Idiff + Ispec;
    */
    color += La*ka;
    vec3 n = normalize(normal_mv);
    vec3 l = normalize(light_dir);
    float lambert = dot(n,l);
    if(lambert > 0.0) {
        color += Ld*kd*lambert;
        vec3 v = normalize(view_dir);
        vec3 r = reflect(-l,n);
        color += Ls*ks*pow(max(dot(r,v), 0.0), alpha);
    }
    //<<<<<<<<<< TODO <<<<<<<<<<<
}
