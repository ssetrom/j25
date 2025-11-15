depth = - y - 1

if place_meeting(x,y,obj_player){
	target_xscale = 1.1
	target_yscale = 1.1
	target_rot_mult = 4
}else{
	target_xscale = 1
	target_yscale = 1
	target_rot_mult = 0
}

image_xscale += (target_xscale-image_xscale) * 0.2
image_yscale += (target_yscale-image_yscale) * 0.2

rot_mult += (target_rot_mult-rot_mult) * 0.2
image_angle = sin(t)*rot_mult
t+=0.05