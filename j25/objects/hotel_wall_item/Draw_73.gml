if inspect_alpha > 0 {
	var cam = view_camera[0];
	var cx  = camera_get_view_x(cam);
	var cy  = camera_get_view_y(cam);
		
	if cursed{
		draw_sprite_ext(cur_sprite, 0, cx+320, cy+180, 1, 1, 0, image_blend, inspect_alpha)
	}else{
		draw_sprite_ext(big_sprite, 0, cx+320, cy+180, 1, 1, 0, image_blend, inspect_alpha)
	}
}