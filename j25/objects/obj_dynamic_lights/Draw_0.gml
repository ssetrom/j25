//Local variables setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _u_z = u_z;
var _u_z2 = u_z2;
var _vb = vb;
var _u_mult = u_mult;
var _u_redness = u_redness;

if !surface_exists(shadow_surface){
	shadow_surface = surface_create(640,360)
}

//Turn on the Zbuffer (3D)
surface_set_target(shadow_surface)

draw_clear_alpha(c_black, 0);
draw_clear_depth(1);

gpu_set_ztestenable(1);
gpu_set_zwriteenable(1);


var cam = view_camera[0];
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);
var _z = 0;
with(obj_player){
	
	var should_light = irandom(demon_time)>15
	if (should_light && demon_time>0){
			
		var _x = flashlight_pos_x
		var _y = flashlight_pos_y
		
		//Draw the shadows (AKA light blockers)
		shader_set(shd_shadow);
		shader_set_uniform_f(_u_pos2,_x-cx,_y-cy - 20);
		shader_set_uniform_f(_u_z2,_z);
		vertex_submit(_vb,pr_trianglelist,-1);
	
		//Draw the Light
		gpu_set_blendmode(bm_add);
		shader_set(shd_light);
		shader_set_uniform_f(_u_pos,_x - cx,_y - cy - 20);
		shader_set_uniform_f(_u_mult, 0.5);
		shader_set_uniform_f(_u_redness, 0);
	
		var tx0 = _x
		var ty0 = _y - 20
	
		var tx1 = _x + cos((pi/3) + flashlight_direction) * 700
		var ty1 = _y - sin((pi/3) + flashlight_direction) * 700 - 20
	
		var tx2 = _x + cos((-pi/3) + flashlight_direction) * 700
		var ty2 = _y - sin((-pi/3) + flashlight_direction) * 700 - 20

		draw_triangle(tx0 - cx, ty0 - cy, tx1 - cx, ty1 - cy, tx2 - cx, ty2 - cy, 0);
	
		shader_set_uniform_f(_u_mult, 2);
	
		draw_circle(tx0 - cx, ty0 - cy, 200, 0)

		gpu_set_blendmode(bm_normal);
	
		_z--; //Next set of shadows and lights is set closer to the screen
	}else{
		if demon_time>0.5 { //&& !audio_is_playing(flicker_sound){
			flicker_sound = sound_pitched(snd_flashflicker, 0.9, 1.1)
		}
	}
}
shader_reset();

gpu_set_ztestenable(0);
gpu_set_zwriteenable(0);
surface_reset_target()

/*var cam = view_camera[0];
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);*/