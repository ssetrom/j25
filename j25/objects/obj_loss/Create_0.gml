sound_pitched(snd_die, 0.9, 1.1)

instance_destroy(obj_question)

with instance_create_depth(640/2, 200, depth ,obj_text_thing){
	base_string = "you checked out ..."
	text_array = string_split(base_string, " " )
}

flash = 1
obj_player.dead = true