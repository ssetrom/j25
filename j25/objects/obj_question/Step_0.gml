
if !text_made {
	with instance_create_depth(640/2, 100,depth,obj_text_thing){
		base_string = other.my_string
		text_array = string_split(base_string, " " )
	}
	text_made = true
}

if keyboard_check_pressed(ord("D")){
	if (answer_is_yes){
		goto_next_hotel_room()
	}else{
		instance_create_depth(0,0,0, obj_loss)
		instance_destroy()
	}
}

if keyboard_check_pressed(ord("A")){
	if (answer_is_yes){
		instance_create_depth(0,0,0, obj_loss)
		instance_destroy()
	}else{
		goto_next_hotel_room()
	}
}

current_alpha += (target_alpha - current_alpha) * 0.2