var cam = view_camera[0];
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);

gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
draw_surface(shadow_surface, cx, cy);
gpu_set_blendmode(bm_normal);