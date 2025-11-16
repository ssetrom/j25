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

hspeed += lengthdir_x(mdist, mdir) * 0.5
vspeed += lengthdir_y(mdist, mdir) * 0.5
speed *= 0.8;

if (speed>0.1){
	if (hspeed<0) dir_mult = -1 else dir_mult = 1
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