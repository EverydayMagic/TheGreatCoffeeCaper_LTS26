//what state are we in?
	//idle / not sliding
	if (!sliding)
	{
		//get new start pos
		start_x = x;
		start_y = y;
		
		//reset move speed
		xspd = 0;
		yspd = 0;
	}
	
	//get ground type
	//if true, block is in special space for only pushing blocks
	on_push_area = place_meeting(x, y, Opushblock_push_area);	
	on_slide_area = place_meeting(x, y, Opushblock_slide_area);
	
	//sliding
	if (sliding)
	{
		//get the direction to move in
		var _real_dir = dir * 90;
		
		//get target coords
		var _target_x_dist = lengthdir_x(gridSpace, _real_dir);
		var _target_y_dist = lengthdir_y(gridSpace, _real_dir);
		
		target_x = start_x + _target_x_dist;
		target_y = start_y + _target_y_dist;
		
		//if on sliding area - keep adding to coords until edge of slide area or wall
		if (on_slide_area)
		{
			//reset our target_x and target_y;
			target_x = start_x;
			target_y = start_y;
			
			//search each space ahead to make sure there IS sliding area and NOT a wall
			while (place_meeting(target_x + _target_x_dist, target_y + _target_y_dist, Opushblock_slide_area) && !place_meeting(target_x + _target_x_dist, target_y + _target_y_dist, Ocol))
			{
				target_x += _target_x_dist;
				target_y += _target_y_dist;
			}
		}
		
		//set the speeds
		var _target_dist = point_distance(x, y, target_x, target_y);
		var _final_spd = min(moveSpd, _target_dist);
		xspd = lengthdir_x(_final_spd, _real_dir);
		yspd = lengthdir_y(_final_spd, _real_dir);
		
		//cancel movement if currently in push block area but target coords aren't
		if (on_push_area && !place_meeting(target_x, target_y, Opushblock_push_area))
		{
			xspd = 0;
			yspd = 0;	
		}
		
		//dont let the block to a grid space that has a wall in it
		if (place_meeting(target_x, target_y, Ocol))
		{
			xspd = 0;
			yspd = 0;
		}
		
	}

//move
if (!instance_exists(Ofade) && !global.gamePaused)
{
	x += xspd;
	y += yspd;
}

//done with sliding
if (xspd = 0 && yspd = 0)
{
	sliding = false;	
}

//fall if over hole
var _hole = instance_place(x, y, Opushblock_hole);
if (!sliding && instance_exists(_hole) && !_hole.full)
{
	_hole.full = true;
	_hole.full_by = id;
}

//fall if over leaf hole
var _leaf_tile = instance_place(x, y, Oleaf_tile);
if (!sliding && instance_exists(_leaf_tile))
{
	if (_leaf_tile.holed)
	{
		with (_leaf_tile)
		{
			//create hole
			sprite_index = Spushblock_hole;
			image_index = 0;
			Oplayer.state_manual = true;
			Oplayer.state = PlayerStateLocked;
			if (alarm[0] = -1){ alarm[0] = 10; }		
		}
	}
}

//instructions when interacted with
if (instance_exists(Ocluehunt) && Ocluehunt.cluehunt_active && instance_exists(Ointeractbox))
{
	if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.trans_to_battle)
	{
		create_textbox("pushblockinstructions");		
	}
}


depth = -y;

//var _vari_names = variable_instance_get_names(self.id);
//for (var v = 0; v < array_length(_vari_names); v++)
//{
//	show_debug_message(_vari_names[v] + ": " + string(variable_instance_get(self.id, _vari_names[v])));
//}






