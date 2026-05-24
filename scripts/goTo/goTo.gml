
///@param object
///@param xFrom
///@param yFrom
///@param xTo
///@param yTo
///@param speed_of_movement
///@param *last_in_a_chain?*
function goTo(_object, _xFrom, _yFrom, _xTo, _yTo, _speed){
			
			if (_object.x = _xTo && _object.y = _yTo)
			{
				if (argument_count > 6)
				{
					if (argument[6] = false)
						return true;
				} else add_move_order();
				return true;
				exit;
			}
			
			var _xdis = _xFrom - _xTo;
			var _ydis = _yFrom - _yTo;
			var _checkx = false;
			var _checky = false;

			if (_speed != 1)
			{
				//check to see if we should go straight to destination due to the speed
				//for x
					if (_xFrom < _xTo)
					{
						if (_object.x + _speed >= _xTo)
						{
							_object.x = _xTo;
							_checkx = true;
						}
					} else {
						if (_object.x - _speed <= _xTo)
						{
							_object.x = _xTo;
							_checkx = true;
						}
					}
				//for y
					if (_yFrom < _yTo)
					{
						if (_object.y + _speed >= _yTo)
						{
							_object.y = _yTo;
							_checky = true;
						}
					} else {
						if (_object.y - _speed <= _yTo)
						{
							_object.y = _yTo;
							_checky = true;
						}
					}
				if (_checkx && _checky)
				{
					_object.x = _xTo;
					_object.y = _yTo;
					if (argument_count > 6)
					{
						if (argument[6] = false)
							return true;
					} else add_move_order();
					return true;
					exit;
				}
			}
	
	
			if (_object.x != _xTo && _object.y != _yTo)
			{
				//checking to see if the object will be moving to the left or right (pos x or neg x)
				if (_xdis != 0)
				{
					if (_xdis < 0)
					{
						_object.x += _speed;
					} else {
						_object.x -= _speed;
					}
				}
		
				//checking to see if the object will be moving up or down (neg y or pos y)
				if (_ydis != 0)
				{
					if (_ydis > 0)
					{
						_object.y -= _speed;
					} else {
						_object.y += _speed;
					}
				}
			} else {
		
				if (_object.x = _xTo && _object.y != _yTo)
				{
			
					if (_ydis > 0)
					{
						_object.y -= _speed;
					} else {
						_object.y += _speed;
					}
			
				} else {
					if (_object.y = _yTo && _object.x != _xTo)
					{
				
						if (_xdis < 0)
						{
							_object.x += _speed;
						} else {
							_object.x -= _speed;
						}
				
					} else {
				
						if (_object.x = _xTo && _object.y = _yTo)
						{
							_object.x = _xTo;
							_object.y = _yTo;
							if (argument_count > 6)
							{
								if (argument[6] = false)
									return true;
							} else add_move_order();
							return true;
							exit;
						} 
					} 
				}
			}	
}