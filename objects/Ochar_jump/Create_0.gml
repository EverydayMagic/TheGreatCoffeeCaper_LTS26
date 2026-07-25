char = [];
time = 0;

starty = [];
endy = [];
dist = [];
char_spr_swap = []; //2D array of sprites to swap between each jump. Ex: [[Splayer_1, Splayer_2], [Scmouse_1, Scmouse_2, Scmouse_3]]
char_img_swap = [];
char_spr_swap_index = [];

anim_curve = animcurve_get_channel(charjump_animcurve, "jump_up");

percent = 0;
position = 0;

swap = false;

cut_dontadd = false;

infin = false;
wait_time = 0;

fade_bubble = false;


next_jump = function(){
	percent = 0;
	swap =! swap;
	anim_curve = animcurve_get_channel(charjump_animcurve, "jump_up");
	
	//swap sprites
	if (array_length(char_spr_swap) > 0)
	{
		for (var _char = 0; _char < array_length(char_spr_swap); _char++)
		{
			var _obj = char[_char];
			
			_obj.sprite_index = char_spr_swap[_char][char_spr_swap_index[_char]];
			if (char_img_swap[_char][char_spr_swap_index[_char]] != -1)
			{
				_obj.image_index = char_img_swap[_char][char_spr_swap_index[_char]];
				_obj.image_speed = 0;
			} else {
				_obj.image_index = 0;
				_obj.image_speed = 1;
			}
			
			if (char_spr_swap_index[_char] < (array_length(char_spr_swap[_char]) - 1))
			{
				char_spr_swap_index[_char]++;		
			} else {
				char_spr_swap_index[_char] = 0;
			}
		}
	}

	//get new variables
	for (var i = 0; i < array_length(char); i++)
	{
		endy[i] = starty[i];
		starty[i] = char[i].y;
		dist[i] = endy[i] - starty[i];
	}	
}







