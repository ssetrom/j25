//If inside

hspeed += keyboard_check(ord("D")) - keyboard_check(ord("A"))
vspeed += keyboard_check(ord("S")) - keyboard_check(ord("W"))
speed *= 0.8;

if place_meeting(x, y, obj_collision){
    var collider = instance_place(x, y, obj_collision);
    var collider_dir =-direction
    
    while place_meeting(x, y, obj_collision){
        collider = instance_place(x, y, obj_collision)
        x+=cos(collider_dir);
        y-=sin(collider_dir);
    }
    vspeed=0;
    hspeed=0;
}

if place_meeting(x+hspeed, y+vspeed, obj_collision){

    while place_meeting(x+hspeed, y, obj_collision){
        hspeed*=0.9;
    }
    while place_meeting(x, y+vspeed, obj_collision){
        vspeed*=0.9;
    }
}

flashlight_direction -= (keyboard_check(ord("E")) - keyboard_check(ord("Q"))) * 0.1

depth = -y