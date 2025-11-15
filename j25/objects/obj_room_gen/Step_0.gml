if !generated{
	
	with hotel_wall_item{
		other.hotel_wall_item_index = irandom( array_length(other.wall_item_names)-1 )
	}
	
	generated = true
}