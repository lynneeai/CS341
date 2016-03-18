#version 330
in vec3 normal_mv;
in vec3 light_dir;
in vec3 view_dir;
in float cos_angle;

out vec3 color;
uniform vec3 La, Ld, Ls;
uniform vec3 ka, kd, ks;
uniform float alpha;

const float spot_cos_cutoff = 0.985; // cos 10 degrees
const float spot_exp = 150;

void main() {    
    const vec3 COLORS[6] = vec3[](
        vec3(1.0,0.0,0.0),
        vec3(0.0,1.0,0.0),
        vec3(0.0,0.0,1.0),
        vec3(1.0,1.0,0.0),
        vec3(0.0,1.0,1.0),
        vec3(1.0,0.0,1.0));
    int index = int( mod(gl_PrimitiveID,6) );
    color = COLORS[index];

    //>>>>>>>>>> TODO >>>>>>>>>>>
    // TODO 5: Spot light.
    // Complete the shader to obtain spot light effect
    //<<<<<<<<<< TODO <<<<<<<<<<<
    vec3 ref_dir = reflect( -light_dir, normal_mv);
    vec3 Iamb = ka*La;
    if(cos_angle < spot_cos_cutoff){
        color = Iamb;
    }
    else{
        vec3 Idiff = kd*Ld*max( 0, dot( normal_mv, light_dir)) * pow(cos_angle,spot_exp) * 1.2;
        vec3 Ispec = ks*Ls*pow(max( 0, dot( ref_dir, view_dir)),alpha) * pow(cos_angle,spot_exp);
        color = Iamb + Idiff + Ispec;
    }

}
