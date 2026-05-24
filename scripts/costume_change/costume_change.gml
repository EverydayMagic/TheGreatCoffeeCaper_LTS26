
///@param obj
///@param sprite to change to
///@param *image_index*
///@param *loop?*(type_"noloop")
///@param *flip?*(type_"flip")
function costume_change(_obj, _spr_index){
	var _loopthenadd = false;
	
		if (!instance_exists(Otextbox))
		{
			if (_obj.sprite_index != _spr_index)
			{
				_obj.sprite_index = _spr_index;
				_obj.image_index = 0;
			}
		
			if (argument_count > 2)
			{
				//checking if image index was inputted
				if (!is_string(argument[2]))
				{
					_obj.image_index = argument[2];
					_obj.image_speed = 0;
				} else {
					
					//looping (loops automatically without this argument being filled)
					if (argument[2] = "noloop")
					{
						if (_obj.image_index > _obj.image_number - 1)
						{
							_obj.image_speed = 0;
							_loopthenadd = true;
						} else _obj.image_speed = 1;
						
					} else {
						_obj.image_speed = 1;
					}
					
				}
				
				//checking if image should be flipped
				if (argument[2] = "flip" || argument[3] = "flip")
				{
					_obj.image_xscale = -1;	
				} else _obj.image_xscale = 1;
				
				if (argument_count < 6)
				{
					if (is_string(argument[2]))
					{
						if (argument[2] = "noloop")
						{
							if (_loopthenadd = true)
							{
								add_move_order();
								return true;
							}
							
						} else { add_move_order(); return true; }
					
					} else { add_move_order(); return true; }
				}
				
				
			} else { _obj.image_speed = 1; _obj.image_xscale = 1; add_move_order(); return true; }

		} else exit;

}
