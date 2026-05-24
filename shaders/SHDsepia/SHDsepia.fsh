//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);

    vec3 darkColor   = vec3(0.220, 0.047, 0.078); // #390C14
    vec3 brightColor = vec3(0.514, 0.224, 0.114); // #83391D

    // How close a pixel needs to be to #390C14 to count as that color
    float threshold = 0.1;

    float diff = distance(texColor.rgb, darkColor);

    vec3 finalColor = (diff < threshold) ? darkColor : brightColor;

    gl_FragColor = v_vColour * vec4(finalColor, texColor.a);
}
