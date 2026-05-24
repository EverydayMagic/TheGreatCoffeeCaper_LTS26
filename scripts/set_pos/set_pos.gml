function set_pos(_obj, _x, _y){
	if (instance_exists(_obj))
	{
		_obj.x = _x;
		_obj.y = _y;
		
	} else return false;
}