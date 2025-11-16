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


if (player_collision && keyboard_check_pressed(vk_space)) {
	
	if (!good_door){
		if  !obj_room_gen.room_is_cursed{
			show_message("YOU LOOOOOS");
		}else{
			with instance_create_depth(0,0,0,obj_question){
				my_string = obj_room_gen.end_question
				answer_is_yes = obj_room_gen.end_question_truthy
			}
		}
	}
	if (good_door){
		if obj_room_gen.room_is_cursed{
			show_message("YOU LOOOOOS");
		}else{
			with instance_create_depth(0,0,0,obj_question){
				my_string = obj_room_gen.end_question
				answer_is_yes = obj_room_gen.end_question_truthy
			}
		}
	}
		
}


t+=0.05