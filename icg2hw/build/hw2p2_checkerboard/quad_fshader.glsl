#version 330

in vec2 uv;

out vec3 color;

uniform sampler1D colormap;

void main() {
	
	float value;
	int row = int(uv[0] * 10);
	int col = int(uv[1] * 10);
    
    if ((row + col) % 2 == 1)
     	value = 0.0f;
    else
        value = 1.0f;

    int splitRow = int(uv[0] * 100);
    int splitCol = int(uv[1] * 100);

    if ((splitRow % 10 == 0) || (splitCol % 10 == 0))
    	value = 0.5f;

   	if ((uv[0] > 0.99) || (uv[1] > 0.99))
   		value = 0.5f; 


    color = texture(colormap, value).rgb;
    
}


