draw_sprite_ext( spr_hand, image_index, arm_pos_x+sin(_t)*bobb*1, arm_pos_y-20, image_xscale*dir_mult, image_yscale, 0, image_blend, image_alpha )
draw_sprite_ext( spr_body, image_index, x, y+sin(_t)*bobb*2, image_xscale*dir_mult, image_yscale, 0, image_blend, image_alpha )
draw_sprite_ext( spr_head, image_index, head_pos_x, head_pos_y-50+sin(_t)*bobb*1, image_xscale*dir_mult, image_yscale, 0, image_blend, image_alpha )

draw_sprite_ext( spr_hand, image_index, flashlight_pos_x+sin(_t)*bobb*1, flashlight_pos_y-20, image_xscale*dir_mult, image_yscale, 0, image_blend, image_alpha )
draw_sprite_ext( spr_flash, image_index, flashlight_pos_x+sin(_t)*bobb*1, flashlight_pos_y-20, 1, 1, (flashlight_direction/(pi*2))*360, image_blend, image_alpha )