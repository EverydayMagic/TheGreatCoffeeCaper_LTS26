//leaf footsie fun
//for (var i = 0; i < array_length(char_list); i++)
//{
//	if (place_meeting(x, y, char_list[i]))
//	{
//		var _id = id;
//		var _char = char_list[i];
//		var _dontmake = false
//		//make sure a leaf foot object doesn't already exist
//		with (Oleaf_tile_foot)
//		{
//			if (feetsies = _char)
//			{
//				_dontmake = true;	
//			}
//		}
//		if (!_dontmake)
//		{
//			with (instance_create_depth(_char.x, _char.y, _char.depth, Oleaf_tile_foot))
//			{
//				parent = _id;
//				feetsies = _char;
//			}
//		}
//	}
//}

//holed
if (holed)
{
	if (place_meeting(x, y, Oplayer) && point_distance(x + 8, y + 8, Oplayer.x, Oplayer.y) <= 2)
	{
		//create hole
		sprite_index = Spushblock_hole;
		image_index = 0;
		Oplayer.state_manual = true;
		Oplayer.state = PlayerStateLocked;
		if (alarm[0] = -1){ alarm[0] = 10; }
	}
}