#version 330

in vec2 uv;

out vec3 color;

uniform sampler1D colormap;

void main() {
	
    float value;
    int row = int(uv[0] * 10);
    int col = int(uv[1] * 10);
    
    float dist = sqrt((uv[0] - row * 0.1 - 0.05f) * (uv[0] - row * 0.1 - 0.05f) +
            (uv[1] - col * 0.1 - 0.05f) * (uv[1] - col * 0.1 - 0.05f));
    float yellowborderdist = 0.058f;
    float redgreenborderdist = 0.035f;
    if ((row + col) % 2 == 1)
        value = 0.33f + (dist > yellowborderdist ? yellowborderdist - redgreenborderdist: dist - redgreenborderdist) * 0.17f / (yellowborderdist - redgreenborderdist);
    else
        value = 0.67f - (dist > yellowborderdist ? yellowborderdist - redgreenborderdist: dist - redgreenborderdist) * 0.17f / (yellowborderdist - redgreenborderdist);

    int splitRow = int(uv[0] * 300);
    int splitCol = int(uv[1] * 300);

    if ((splitRow % 30 == 0) || (splitRow % 30 == 29)|| (splitCol % 30 == 0) || (splitCol % 30 == 29))
    	value = 0.5f;

    if ((uv[0] > 0.9967) || (uv[1] > 0.9967))
                value = 0.5f;


    color = texture(colormap, value).rgb;
    

}


