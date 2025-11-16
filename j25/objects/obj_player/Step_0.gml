//If inside
demon_time--
if demon_time < 0 {
	dead = true;
	if !instance_exists(obj_loss){
		instance_create_depth(0,0,0,obj_loss)
	}
}

var mvx = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var mvy = keyboard_check(ord("S")) - keyboard_check(ord("W"))
var mdist = point_distance(0,0,mvx,mvy)
var mdir = point_direction(0,0,mvx,mvy)

if !can_move mdist =0
actively_walking = mdist>0.1

hspeed += lengthdir_x(mdist, mdir) * 0.65
vspeed += lengthdir_y(mdist, mdir) * 0.65
speed *= 0.8;

head_pos_x += (x-head_pos_x) * 0.5
head_pos_y += (y-head_pos_y) * 0.5


if point_distance(x, y, prev_distance_measure_x, prev_distance_measure_y) > 30 {
	prev_distance_measure_x = x
	prev_distance_measure_y = y
	sound_pitched(choose(snd_footstep_1, snd_footstep_2, snd_footstep_3), 0.9, 1.1)
}

if (speed>0.1){
	_t += 0.2
	if (hspeed<0) dir_mult = -1 else dir_mult = 1
}

if actively_walking{
	bobb += (1 - bobb)*0.5
}else{
	bobb += (0 - bobb)*0.5
}

if place_meeting(x, y, obj_collision){
    var collider = instance_place(x, y, obj_collision);
    var collider_dir = backup_dir
    
    while place_meeting(x, y, obj_collision){
        collider = instance_place(x, y, obj_collision)
        x+=cos(collider_dir);
        y-=sin(collider_dir);
    }
	
    vspeed=0;
    hspeed=0;
}else{
	backup_dir = -direction
}

if place_meeting(x+hspeed, y+vspeed, obj_collision){

    while place_meeting(x+hspeed, y, obj_collision){
        hspeed*=0.9;
    }
    while place_meeting(x, y+vspeed, obj_collision){
        vspeed*=0.9;
    }
}

flashlight_direction -= (keyboard_check(ord("L")) - keyboard_check(ord("K"))) * 0.1

depth = -y