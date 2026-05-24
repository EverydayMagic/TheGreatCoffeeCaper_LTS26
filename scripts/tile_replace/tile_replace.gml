// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function tile_replace(_layer, _new_data, x1, x2, y1, _cut_dontadd = false){
	
	var map = layer_tilemap_get_id(layer_get_id(_layer));
	
	for (var i = x1; i < x2 + 1; i++)
	{
		var data = tilemap_get(map, i, y1);
		
		if (!tile_get_empty(data))
		{
			data = tile_set_empty(data);
			tilemap_set(map, _new_data, i, y1);
				
		} else tilemap_set(map, _new_data, i, y1);
	}
	if (_cut_dontadd = true)
	{
		return true;
	} else add_move_order();
	
	return true;
		
	
}