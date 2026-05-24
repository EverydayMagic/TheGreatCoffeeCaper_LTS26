if (!instance_exists(Ofade))
{//regular behavior
	
	if (!inside)
	{

		//checking to see if we can spawn in new leaf
		if (instance_number(Oleaf) < 6)
		{
			//get new leaf stats
			new_leaf_stats();
			
			var _spr = leaf_spr_index;
			var _index = leaf_img_index;
			with (instance_create_depth(leaf_x, leaf_y, 0, Oleaf))
			{
				sprite_index = choose(Sleaf, Sleaf_roll);
				image_index = _index;
			}
		}
	}

}











