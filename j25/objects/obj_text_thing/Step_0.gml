
if time_until_next_text<=0 && num_displayed<array_length(text_array){
	num_displayed++
	time_until_next_text = 20+irandom(20)
	obj_camera.shake = shake
	sound_pitched(snd_grunt_one, 0.7, 1.3)
}

done = num_displayed=array_length(text_array)

time_until_next_text--
