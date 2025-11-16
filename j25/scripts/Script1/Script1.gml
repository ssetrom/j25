function sound_pitched( sound_index, lower, higher ){
	var snd = audio_play_sound(sound_index, 0, 0)
	audio_sound_pitch(snd, random_range(lower, higher) )
}