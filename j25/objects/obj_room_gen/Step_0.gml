
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

function are_the_same(a, b){
	return a.hotel_wall_item_index == b.hotel_wall_item_index && a.image_blend == b.image_blend
}

if !generated{
	
	array_of_items = array_from_two_types(hotel_floor_item, hotel_wall_item)
	array_shuffle_ext(array_of_items)

	if (array_length(array_of_items)<7){
		show_message(string(array_length(array_of_items)))
		show_message("ROOM NEEDS TO HAVE AT LEAST ONE 7 items")
		game_end()
	}
	
	room_is_cursed = choose(0,1)
	var num_items_to_gen = 4 + irandom(3)
	var num_generated = 0
	var set_cursed_flag = room_is_cursed
	var num_generated_required = 0
	
	for (var i = 0; i<array_length(array_of_items); i++){
		var this_item = array_of_items[i]

		if i>num_items_to_gen{
			instance_destroy(this_item)
			continue;
		}
	
		
		if (this_item.object_index==hotel_floor_item){
			with this_item{
				im_real = true
				sprite_index = spr_floorItem
				hotel_wall_item_index = irandom( array_length(other.floor_item_names)-1 )
				icon_index = other.floor_icon_indexes[hotel_wall_item_index]
				
				big_sprite = other.floor_big_res_sprites[hotel_wall_item_index]
				cur_sprite = other.floor_cur_res_sprites[hotel_wall_item_index][irandom(1)]
				
				if (other.floor_item_has_colors[hotel_wall_item_index]){
					image_blend = choose(make_colour_rgb(58,64,100), make_colour_rgb(107,41,41), make_colour_rgb(112,72,98), make_colour_rgb(283,50,39))
				}
			}
		}else{
			with this_item{
				im_real = true
				sprite_index = spr_wall_item
				hotel_wall_item_index = irandom( array_length(other.wall_item_names)-1 )
				icon_index = other.wall_icon_indexes[hotel_wall_item_index]
				
				big_sprite = other.wall_big_res_sprites[hotel_wall_item_index]
				cur_sprite = other.wall_cur_res_sprites[hotel_wall_item_index][irandom(1)]

				if (other.wall_item_has_colors[hotel_wall_item_index]){
					image_blend = choose(make_colour_rgb(58,64,100), make_colour_rgb(107,41,41), make_colour_rgb(112,72,98), make_colour_rgb(283,50,39))
				}
			}
		}
		

		if (num_generated_required<num_requirements){
			var should_skip = false
			for (var j=0; j<num_generated_required; j++){
				if (requirements[ j ].hotel_wall_item_index == this_item.hotel_wall_item_index && requirements[ j ].image_blend == this_item.image_blend ){
					should_skip = true
				}
			}
			
			if (!should_skip){
				this_item.cursed = set_cursed_flag
				set_cursed_flag = false
				this_item.maybe_cursed = true
				requirements[ num_generated_required ] = this_item
				num_generated_required++
			}
		}
		
		num_generated++
	}
	
	with hotel_floor_item {
		if maybe_cursed{
			with hotel_floor_item{
				if (other!=self){
					if !maybe_cursed && are_the_same(other, self){
						instance_destroy()
					}
				}
			}
		}
	}
	with hotel_wall_item {
		if maybe_cursed{
			with hotel_wall_item{
				if (other!=self){
					if !maybe_cursed && are_the_same(other, self){
						instance_destroy()
					}
				}
			}
		}
	}
	
	var typeToCheck = irandom(1) ? hotel_wall_item : hotel_floor_item
	var numOfType = instance_number(typeToCheck);
	if (numOfType == 0){
		end_question = "did you see 1 phone?"
		end_question_truthy = false
	}else{
		array_of_items = array_from_two_types(typeToCheck, typeToCheck)
		array_shuffle_ext(array_of_items)
		var targ_item = 0
		for (var tt = 0; tt<array_length(array_of_items); tt++){
			targ_item = array_of_items[tt]
			if (!targ_item.cursed){
				break;
			}
		}
		
		var typename = wall_item_names[targ_item.hotel_wall_item_index]
		var num_found = 0
		for (var tt = 0; tt<instance_number(typeToCheck); tt++){
			 var this_one = instance_find(typeToCheck, tt);
			 if are_the_same(this_one, targ_item){
				num_found++
			 }
		}
		
		end_question_truthy = true
		if irandom(1){
			num_found++
			end_question_truthy = false
		}
		
		end_question = "did you see " + string(num_found) + " " + typename + "?"
	}
	
	
	num_requirements = num_generated_required
	
	generated = true
}