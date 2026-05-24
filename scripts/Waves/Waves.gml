function sine_wave(_time, _period, _amplitude, _midpoint, _flip = 1){
	return _flip * sin(_time * 2 * pi / _period) * _amplitude + _midpoint;
}

function cosine_wave(_time, _period, _amplitude, _midpoint){
	return cos(_time * 2 * pi / _period) * _amplitude + _midpoint;
}