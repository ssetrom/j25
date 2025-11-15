shouldPrint = true

if tag=="hotel_wall_1"{
	n = instance_create_depth( x+0,y+-35,0,obj_collision);
	n.image_xscale=137; n.image_yscale=35
	n = instance_create_depth( x+0,y+-49,0,obj_occluder);
	n.image_xscale=137; n.image_yscale=4
}
if tag=="hotel_wall_2"{
	n = instance_create_depth( x+119,y+-109,0,obj_collision);
	n.image_xscale=18; n.image_yscale=109
	n = instance_create_depth( x+0,y+-35,0,obj_collision);
	n.image_xscale=137; n.image_yscale=35
	n = instance_create_depth( x+123,y+-109,0,obj_occluder);
	n.image_xscale=14; n.image_yscale=4
	n = instance_create_depth( x+119,y+-109,0,obj_occluder);
	n.image_xscale=4; n.image_yscale=64
	n = instance_create_depth( x+0,y+-49,0,obj_occluder);
	n.image_xscale=123; n.image_yscale=4
}
if tag=="hotel_wall_3"{
	n = instance_create_depth( x+2,y+-35,0,obj_collision);
	n.image_xscale=135; n.image_yscale=35
	n = instance_create_depth( x+0,y+-79,0,obj_collision);
	n.image_xscale=17; n.image_yscale=79
	n = instance_create_depth( x+14,y+-79,0,obj_occluder);
	n.image_xscale=4; n.image_yscale=30
	n = instance_create_depth( x+14,y+-49,0,obj_occluder);
	n.image_xscale=123; n.image_yscale=4
}
if tag=="hotel_wall_4"{
	n = instance_create_depth( x+-18,y+-79,0,obj_collision);
	n.image_xscale=18; n.image_yscale=109
	n = instance_create_depth( x+-18,y+-35,0,obj_collision);
	n.image_xscale=137; n.image_yscale=35
	n = instance_create_depth( x+-18,y+-75,0,obj_occluder);
	n.image_xscale=4; n.image_yscale=70
	n = instance_create_depth( x+-18,y+-79,0,obj_occluder);
	n.image_xscale=14; n.image_yscale=4
	n = instance_create_depth( x+-4,y+-79,0,obj_occluder);
	n.image_xscale=4; n.image_yscale=30
	n = instance_create_depth( x+-4,y+-50,0,obj_occluder);
	n.image_xscale=123; n.image_yscale=5
}