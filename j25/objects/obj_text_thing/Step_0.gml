if time_until_next_text<=0 && num_displayed<array_length(text_array){
	num_displayed++
	time_until_next_text = 20+irandom(20)
	obj_camera.shake = shake
	sound_pitched(choose(snd_grunt_one, snd_grunt_two, snd_grunt_three), 0.5, 1.3)
}

done = num_displayed=array_length(text_array)

time_until_next_text--
