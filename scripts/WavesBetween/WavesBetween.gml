function sine_between(_time, _period, _minimum, _maximum){
	var _midpoint = mean(_minimum, _maximum);
	var _amplitude = _maximum - _midpoint;
	return sine_wave(_time, _period, _amplitude, _midpoint);
}

function cosine_between(_time, _period, _minimum, _maximum){
	var _midpoint = mean(_minimum, _maximum);
	var _amplitude = _maximum - _midpoint;
	return cosine_wave(_time, _period, _amplitude, _midpoint);
}

//Pixelated Pope gave you these functions \/

function sin_oscillate(_min, _max, _duration, _pos = get_timer()) {
  if(_duration == 0) _duration = math_get_epsilon();
  return((_max-_min)/2 * dsin(360 * 0.000001 * _pos /_duration) + (_max+_min)/2);
}

function cos_oscillate(_min, _max, _duration, _pos = get_timer()) {
  if(_duration == 0) _duration = math_get_epsilon();
  return((_max-_min)/2 * dcos(360 * 0.000001 * _pos / _duration) + (_max+_min)/2);
}

function steps_to_microseconds(_steps) {
	return 1000000 * (_steps/room_speed)
}