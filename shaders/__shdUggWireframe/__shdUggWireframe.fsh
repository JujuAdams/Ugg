varying vec3 v_vColour;

uniform vec3 u_vColor;

void main()
{
    gl_FragColor = vec4(u_vColor/255.0, 1.0);
}