#version 330 core
in vec2 uv;
uniform sampler2D colorTex;
uniform sampler2D velocityTex;
out vec4 color;

void main() {
    /// TODO: use the velocity vector stored in velocityTex to compute the line integral
    vec2 velocity = texture(velocityTex,uv).xy;
    /// TODO: use a constant number of samples for integral (what happens if you take too few?)
    /// HINT: you can scale the velocity vector to make the motion blur effect more prominent
    /// HINT: to debug integration don't use the velocityTex, simply assume velocity is constant, e.g. vec2(1,0)
    color = texture(colorTex, uv);
    int nSamples = 50;
    float scale = 5.0f;
    float range = 0.5f;
    for(int i = 1; i < nSamples; i++){
        vec2 offSet = velocity * scale * (float(i) * range / float(nSamples - 1) - range/2);
        color += texture(colorTex, uv + offSet);
    }
    color /= float(nSamples);
}
