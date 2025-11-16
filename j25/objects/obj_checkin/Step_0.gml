if collision_point(mouse_x, mouse_y, self, 1, 0){
	target_xscale = 1.2
	target_yscale = 1.2
	if mouse_check_button_pressed(mb_left){
		goto_next_hotel_room()
	}
}else{
	target_xscale = 1
	target_yscale = 1
}

image_xscale += ( target_xscale - image_xscale ) * 0.3
image_yscale += ( target_yscale - image_yscale ) * 0.25