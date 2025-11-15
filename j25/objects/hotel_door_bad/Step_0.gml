
var player_collision = collision_point(x-10 ,y+10, obj_player, 1, 1) || collision_point(x+10 ,y+10, obj_player, 1, 1)

if player_collision target_wobble = 1 else target_wobble = 0

wobble += (target_wobble-wobble)*0.1
if (wobble<0.01) t=1.5

if (!good_door){
	if keyboard_check_pressed(vk_space){
		//if collision_point(x,y+40)
	}
}

t+=0.05