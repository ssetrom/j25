//Local variables setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _u_z = u_z;
var _u_z2 = u_z2;
var _vb = vb;
var _u_mult = u_mult;


if !surface_exists(shadow_surface){
	shadow_surface = surface_create(640,360)
}

//Turn on the Zbuffer (3D)
surface_set_target(shadow_surface)

draw_clear_alpha(c_black, 0);
draw_clear_depth(1);

gpu_set_ztestenable(1);
gpu_set_zwriteenable(1);
var old_cull = gpu_get_cullmode();
gpu_set_cullmode(cull_noculling);

var cam = view_camera[0];
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);
var _z = 0;
with(obj_player){
	
	//Draw the shadows (AKA light blockers)
	shader_set(shd_shadow);
	shader_set_uniform_f(_u_pos2,x-cx,y-cy - 20);
	shader_set_uniform_f(_u_z2,_z);
	vertex_submit(_vb,pr_trianglelist,-1);
	
	//Draw the Light
	gpu_set_blendmode(bm_add);
	shader_set(shd_light);
	shader_set_uniform_f(_u_pos,x - cx,y - cy - 20);
	shader_set_uniform_f(_u_mult, 0.5);
	
	var tx0 = x
	var ty0 = y - 20
	
	var tx1 = x + cos((pi/3) + flashlight_direction)*500
	var ty1 = y - sin((pi/3) + flashlight_direction)*500 - 20
	
	var tx2 = x + cos((-pi/3) + flashlight_direction)*500
	var ty2 = y - sin((-pi/3) + flashlight_direction)*500 - 20

	draw_triangle(tx0 - cx, ty0 - cy, tx1 - cx, ty1 - cy, tx2 - cx, ty2 - cy, 0);
	
	shader_set_uniform_f(_u_mult, 2);
	draw_circle(tx0 - cx, ty0 - cy, 200, 0)

	gpu_set_blendmode(bm_normal);
	
	_z--; //Next set of shadows and lights is set closer to the screen
}
shader_reset();
gpu_set_cullmode(old_cull);
gpu_set_ztestenable(0);
gpu_set_zwriteenable(0);
surface_reset_target()

/*var cam = view_camera[0];
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);*/