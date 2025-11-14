varying vec2 pos; //current pixel position

uniform vec2 u_pos; //light source positon

const float zz = 1.; //larger zz, larger light

void main(){
	vec2 dis = pos - u_pos;
	float str = 0.8 - (sqrt(dis.x*dis.x + dis.y*dis.y + zz*zz))*0.005; //strength of light is the inverse distance
    gl_FragColor = vec4(vec3(str),1.);
}
