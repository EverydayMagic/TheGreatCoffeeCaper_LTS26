depth = -50;


var _obs = instance_place(x, y, Ocluebattle_obstacle);

if (instance_exists(_obs))
{
	if (y <= _obs.y){ depth = _obs.depth + 5; }
	if (y > _obs.y){ depth = _obs.depth - 5; }
}


















