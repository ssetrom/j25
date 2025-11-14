//If inside

hspeed += keyboard_check(vk_right) - keyboard_check(vk_left)
vspeed += keyboard_check(vk_down) - keyboard_check(vk_up)
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