///@param object
///@param length_of_hold
///@param "sec"_or_"frm"
function hold(_object, _time, _unit){
	show_debug_message("time = " + string(_time));
	show_debug_message("holdtime = " + string(_object.holdTime));

	if (!instance_exists(Otextbox))
	{
		
		if (_object.holdTime != 0)
		{
			_object.holdTime--;
			if (_object.holdTime = 0)
				add_move_order();
		} else {
			if (_unit = "sec")
					_time = round(_time * FRAME_RATE);	
			_object.holdTime = round(_time);
		}
		
	} else exit;
	
	
		/*
		_time--;
		_object.holdTime = _time;
		
		if (_object.holdTime != 0)
			exit;
		else
			return true;
		*/
		
	
		
}