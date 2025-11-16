with obj_player {
	can_move = false
}
answer_is_yes = false

current_alpha = 0
target_alpha = 1

var cam = view_camera[0];
var cx  = camera_get_view_x(cam);
var cy  = camera_get_view_y(cam);

my_string = "This is a random question: one, two, three, four, five, six, seven"

text_made  = false

next_room = choose(GiganticRoom,Room1)