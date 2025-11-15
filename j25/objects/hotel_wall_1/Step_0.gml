depth = -y

if shouldPrint{
	show_debug_message( "if tag==\"" + tag + "\"{" )
	with (obj_collision){
		if place_meeting(x, y, other){
			var dx = -(other.x - x)
			var dy = -(other.y - y)
			show_debug_message( "	n = instance_create_depth( x+" + string(dx) + ",y+"+ string(dy) + ",0,obj_collision);")
			show_debug_message( "	n.image_xscale=" + string(image_xscale) + "; n.image_yscale=" + string(image_yscale)   )
		}
	}
	with (obj_occluder){
		if place_meeting(x, y, other){
			var dx = -(other.x - x)
			var dy = -(other.y - y)
			show_debug_message( "	n = instance_create_depth( x+" + string(dx) + ",y+"+ string(dy) + ",0,obj_occluder);")
			show_debug_message( "	n.image_xscale=" + string(image_xscale) + "; n.image_yscale=" + string(image_yscale)   )
		}
	}
	show_debug_message( "}" )
}