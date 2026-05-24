//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


uniform vec2 texture_pixel;
void main()
{
	vec2 thickness = texture_pixel * 1.0;
	
	vec4 end_pixel = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	if (texture2D( gm_BaseTexture, v_vTexcoord ).a <= 0.0) //<-- must be a decimal number
	{
		float alpha = 0.0;
		//left side
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - thickness.x, v_vTexcoord.y)).a);
		//right side
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + thickness.x, v_vTexcoord.y)).a);
		//bottom
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + thickness.y)).a);
		//top
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - thickness.y)).a);
		
		
		if (alpha != 0.0)
		{
			end_pixel = vec4(1.0, 0.957, 0.69, 1.0);	
		}
	}
	
	
	
    gl_FragColor = end_pixel;
}
