varying vec2 pos; //current pixel position

uniform vec2 u_pos; //light source positon
uniform float mult; //light source positon
uniform float redness; //light source positon


void main(){
	vec2 dis = pos - u_pos;
	float str = 0.8 - (sqrt(dis.x*dis.x + dis.y*dis.y + 1.0))*0.005*mult; //strength of light is the inverse distance
    gl_FragColor = vec4(str,(1.0-redness)*str,(1.0-redness)*str,1.);
}
