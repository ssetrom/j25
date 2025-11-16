
var cam = view_camera[0];
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);

for (var i = 0; i<num_requirements; i++) {
	draw_sprite_ext(spr_icons, requirements[i].icon_index, 50 +cx , 50*(i+1) + cy, 1,1,0, requirements[i].image_blend, 1)
}