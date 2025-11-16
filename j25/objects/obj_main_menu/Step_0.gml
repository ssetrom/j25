if keyboard_check_pressed(vk_space)
	goto_next_hotel_room()
	
image_xscale += (2 - image_xscale)*0.5
image_yscale += (2 - image_yscale)*0.4

y += sin(t)*0.5
t+=0.05