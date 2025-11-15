// Inherit the parent event
depth = - y - 1

if !obj_player.inspect_captured && place_meeting(x,y,obj_player) {
	target_xscale = 1.1
	target_yscale = 1.1
	target_rot_mult = 4
	
	obj_player.inspect_captured = true
	
	if keyboard_check_pressed(vk_space) {
		inspecting = !inspecting
	}
	
}else{
	inspecting = false
	target_xscale = 1
	target_yscale = 1
	target_rot_mult = 0
}

image_xscale += (target_xscale-image_xscale) * 0.2
image_yscale += (target_yscale-image_yscale) * 0.2

rot_mult += (target_rot_mult-rot_mult) * 0.2
image_angle = sin(t)*rot_mult

t+=0.05

image_index = hotel_wall_item_index
if collision_point(x, y+3, hotel_wall_parent, 1, 1 ){
	depth = collision_point(x, y+3, hotel_wall_parent, 1, 1 ).depth-1
}

if inspecting{
	target_inspect_alpha = 1
}else{
	target_inspect_alpha = 0
}

inspect_alpha += (target_inspect_alpha - inspect_alpha)*0.2
