///@param item_id
///@param [stash]
///@param [override_reveal]
function item_add(_item_id){
	var _item_set = true;
	var _slot = -1;
	var _stash = false;
	if (argument_count > 1){ _stash = argument[1]; }
	
	switch (_item_id.display_name)
	{
		case "Hoots Hat": 
			_slot = 0; 
			
			//set all battle tutorials to false
				for (var i = 0; i < array_length(global.battleTutorial); i++)
					global.battleTutorial[i] = false;
		break;
		
		case "Spark Glass": _slot = 1; break;
		
		case "Stopwatch": _slot = 2; break;
		
		case "Cloud Puff": _slot = 3; break;
		
		case "Blue Hat": _slot = 4; break;
		
		case "Music Sheet": _slot = 5; break;
		
		case "Love Letter": _slot = 6; break;
		
		case "Hammer": _slot = 7; break;
		
		default:
			if (!_stash)
			{
				_item_set = false; 
			}
		break;
	}
	
	if (_item_set)
	{
		var _stacking_item = false;
		if (_stash)
		{
			for (var i = 0; i < Oitem_manager.inv_stash_max; i++)
			{
				//if duplicate item (if stacking an item already in inventory), just add to quantity value
				if (Oitem_manager.inv_stash[i].name = _item_id.name)
				{
					Oitem_manager.inv_stash[i].quantity++;
					_stacking_item = true;
					break;
				}
				
				if (Oitem_manager.inv_stash[i].display_name = "Unknown")
				{
					_slot = i;
					break;
				}
			}
		}
		var _inv = Oitem_manager.inv;
		if (_stash){ _inv = Oitem_manager.inv_stash;}
		
		if (!_stacking_item)
			array_set(_inv, _slot, _item_id);
		
		if (argument_count > 1)
			if (argument[1] = true)
				exit;
		else if (argument_count > 2)
			if (argument[2] = true)
				exit;
		
		if (_item_id != global.item_list.clue_timer_lvl1)
		{
			with(instance_create_depth(Oplayer.x, Oplayer.y, -bbox_bottom, Oitem_reveal))
			{
				item_revealing = _item_id;
			}
		}
		exit;	
	} else {
		show_error("ITEM ID NOT SUPPORTED", true);
	}

}