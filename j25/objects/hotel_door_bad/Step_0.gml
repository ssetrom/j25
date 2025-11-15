function array_from_two_types(objA, objB){
    var countA = instance_number(objA);
    var countB = instance_number(objB);
    var total  = countA + countB;

    var arr = array_create(total);
    var i   = 0;

    for (var k = 0; k < countA; k++)  arr[i++] = instance_find(objA, k);
    for (var k = 0; k < countB; k++)  arr[i++] = instance_find(objB, k);

    return arr
}

var player_collision = collision_point(x-10 ,y+10, obj_player, 1, 1) || collision_point(x+10 ,y+10, obj_player, 1, 1)

if player_collision target_wobble = 1 else target_wobble = 0

wobble += (target_wobble-wobble)*0.1
if (wobble<0.01) t=1.5

if (!good_door){
	if player_collision && keyboard_check_pressed(vk_space) {
		array_of_items = array_from_two_types(hotel_floor_item, hotel_wall_item)
		
		for (var j=0; j<obj_room_gen.num_requirements; j++){
			for (var inst = 0; inst < array_length(array_of_items); inst++){
				this_item = array_of_items[inst]
				if (!this_item.im_real){
					continue;
				}
			}
			
			if (obj_room_gen.requirements[ j ].hotel_wall_item_index == this_item.hotel_wall_item_index && requirements[ j ].image_blend == this_item.image_blend ){
				should_skip = true
			}
		}
		
		var isValid = false
		for (var i = 0; i<obj_room_gen.num_requirements; i++) {
			draw_sprite_ext(spr_icons, v.requirements[i].icon_index, 50 +cx , 50*(i+1) + cy, 1,1,0, requirements[i].image_blend, 1)
		}
		
	}
}

t+=0.05