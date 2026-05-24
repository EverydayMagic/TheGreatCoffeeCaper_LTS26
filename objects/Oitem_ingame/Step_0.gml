sprite_index = item_id.sprite;

switch (item_id)
{
	case global.item_list.detective_hat:
		if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox))
		{
			Oitem_manager.pick_up_cap = true;
			create_textbox("hootshousehat");
			item_add(item_id);
			instance_destroy();
		}
	break;
	
	case global.item_list.mglass:
		if (place_meeting(x, y, Ointeractbox) && !instance_exists(Otextbox))
		{
			item_add(item_id); //spark glass
			item_add(global.item_list.clue_timer_lvl1); //clue timer
			instance_destroy();
		}
	break;
}


//check to make sure we aren't already in the inventory (so there are no duplicate clues)
	for (var i = 0; i < Oitem_manager.inv_max - 1; i++)
	{
		if (Oitem_manager.inv[i].name = item_id.name)
			instance_destroy();
	}

if (instance_exists(Oplayer))
	depth = Oplayer.depth + 10;







