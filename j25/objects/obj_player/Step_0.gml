//If inside

hspeed += keyboard_check(ord("D")) - keyboard_check(ord("A"))
vspeed += keyboard_check(ord("S")) - keyboard_check(ord("W"))
speed *= 0.8;

if place_meeting(x, y, obj_wall){
    var collider = instance_place(x, y, obj_wall);
    var collider_dir =-direction
    
    while place_meeting(x, y, obj_wall){
        collider = instance_place(x, y, obj_wall)
        x+=cos(collider_dir);
        y-=sin(collider_dir);
    }
    vspeed=0;
    hspeed=0;
}

if place_meeting(x+hspeed, y+vspeed, obj_wall){

    while place_meeting(x+hspeed, y, obj_wall){
        hspeed*=0.9;
    }
    while place_meeting(x, y+vspeed, obj_wall){
        vspeed*=0.9;
    }
}

flashlight_direction -= (keyboard_check(ord("E")) - keyboard_check(ord("Q"))) * 0.1
