var running_text_length = -string_width(base_string)/2
for (var i=0; i<num_displayed; i++){
	var text_chunk = text_array[i]+" "
	draw_text( x + running_text_length, y, text_chunk)
	running_text_length+=string_width(text_chunk)
}