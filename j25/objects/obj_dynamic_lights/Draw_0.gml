//Local variables setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _u_z = u_z;
var _u_z2 = u_z2;
var _vb = vb;

//Turn on the Zbuffer (3D)
gpu_set_ztestenable(1);
gpu_set_zwriteenable(1);
var old_cull = gpu_get_cullmode();
gpu_set_cullmode(cull_noculling);

var _z = 0;
with(obj_player){
	
	//Draw the shadows (AKA light blockers)
	shader_set(shd_shadow);
	shader_set_uniform_f(_u_pos2,x,y);
	shader_set_uniform_f(_u_z2,_z);
	vertex_submit(_vb,pr_trianglelist,-1);
	
	//Draw the Light
	gpu_set_blendmode(bm_add);
	shader_set(shd_light);
	shader_set_uniform_f(_u_pos,x,y);
	shader_set_uniform_f(_u_z,_z);
	
	var tx0 = x
	var ty0 = y
	
	var tx1 = x + cos((pi/3) + flashlight_direction)*500
	var ty1 = y - sin((pi/3) + flashlight_direction)*500
	
	var tx2 = x + cos((-pi/3) + flashlight_direction)*500
	var ty2 = y - sin((-pi/3) + flashlight_direction)*500

	draw_triangle(tx0, ty0, tx1, ty1, tx2, ty2, 0);

	gpu_set_blendmode(bm_normal);
	
	_z--; //Next set of shadows and lights is set closer to the screen
}
shader_reset();
gpu_set_cullmode(old_cull);
gpu_set_ztestenable(0);
gpu_set_zwriteenable(0);