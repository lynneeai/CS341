#version 330
in vec3 normal_mv;
in vec3 light_dir;
in vec3 view_dir;

uniform float alpha;
uniform sampler2D tex2D;
uniform vec3 La, Ld, Ls;
uniform vec3 ka, kd, ks;

out vec3 color;

void main() {
    color = vec3(0.0, 0.0, 0.0);

    /*const vec3 COLORS[6] = vec3[](
        vec3(1.0,0.0,0.0),
        vec3(0.0,1.0,0.0),
        vec3(0.0,0.0,1.0),
        vec3(1.0,1.0,0.0),
        vec3(0.0,1.0,1.0),
        vec3(1.0,0.0,1.0));
    int index = int( mod(gl_PrimitiveID,6) );
    color = COLORS[index];*/

    //>>>>>>>>>> TODO >>>>>>>>>>>
    // TODO 3.2: Artistic shading.
    // 1) compute the output color by doing a look-up in the texture using the
    //    texture sampler tex.
    //<<<<<<<<<< TODO <<<<<<<<<<<
    /*
    vec3 ref_dir = reflect( -light_dir, normal_mv);
    vec3 Iamb = ka*La;
    vec3 Idiff = kd*Ld*texture(tex2D, vec2(max( 0, dot( normal_mv, light_dir)), pow(max( 0, dot( ref_dir, view_dir)),alpha))).rgb;
    vec3 Ispec = ks*Ls*texture(tex2D, vec2(max( 0, dot( normal_mv, light_dir)), pow(max( 0, dot( ref_dir, view_dir)),alpha))).rgb;
    */

    color += La*ka;
    vec3 n = normalize(normal_mv);
    vec3 l = normalize(light_dir);
    vec3 v = normalize(view_dir);
    vec3 r = reflect(-l,n);
    float lambert = dot(n,l);
    if(lambert > 0.0) {
        color += kd*Ld*texture(tex2D, vec2(lambert,pow(max( 0, dot(r, v)),alpha))).rgb;
        color += Ls*ks*texture(tex2D, vec2(lambert,pow(max( 0, dot(r, v)),alpha))).rgb;
    }

    //color = Iamb  + Idiff + Ispec;
}
