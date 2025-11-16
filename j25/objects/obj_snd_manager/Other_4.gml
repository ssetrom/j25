if room!=MainMenu{
	audio_sound_gain(my_song, 0, 100);
	my_song = audio_play_sound(snd_music, 1, 1)
}
num_rooms++