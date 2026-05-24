char = [];
time = 0;

starty = [];
endy = [];
dist = [];

anim_curve = animcurve_get_channel(charjump_animcurve, "jump_up");

percent = 0;
position = 0;

swap = false;

cut_dontadd = false;

infin = false;
wait_time = 0;


next_jump = function(){
	percent = 0;
	swap =! swap;
	anim_curve = animcurve_get_channel(charjump_animcurve, "jump_up");

	//get new variables
	for (var i = 0; i < array_length(char); i++)
	{
		endy[i] = starty[i];
		starty[i] = char[i].y;
		dist[i] = endy[i] - starty[i];
	}	
}







