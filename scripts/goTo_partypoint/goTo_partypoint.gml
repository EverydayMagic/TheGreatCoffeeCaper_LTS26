
function goTo_partypoint(){
	//determine which party point to follow
	var _parent = self.id;
	with (Opartypoint)
	{
		if (record = _parent.record)
		{
			_parent.partypoint_id = self.id;
			
		}
	}
	
	if (partypoint_id != noone)
	{
		//is the party point in proper position?
		if (partypoint_id.x = 0 && partypoint_id.y = 0){ exit; }
		
		//determine speed that we'll move this step
		var _dist = point_distance(x, y, partypoint_id.x, partypoint_id.y);
		var _spd = 1;
		
		if (abs(_dist) > 1){ _spd = 2; }
		
		//make the move
		goTo(self.id, x, y, partypoint_id.x, partypoint_id.y, _spd, false);
		
		//add to global party array if not already in it
		var _push = true;
		if (array_length(global.player_party) > 0)
		{
			for (var i = 0; i < array_length(global.player_party); i++)
			{
				if (global.player_party[i] = object_index){	_push = false; break; }
			}
		}
		if (_push){ array_push(global.player_party, object_index); }
		
	} else exit;
}