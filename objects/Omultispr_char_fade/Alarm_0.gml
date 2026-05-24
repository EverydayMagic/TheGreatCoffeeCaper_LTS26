for (var i = 0; i < array_length(char); i++)
{
	char_spr[i][draw_count] = char[i].sprite_index;
	char_spr_index[i][draw_count] = char[i].image_index;
	char_spr_alph[i][draw_count] = 1;
	char_spr_x[i][draw_count] = char[i].x;
	char_spr_y[i][draw_count] = char[i].y;
}

draw_count++;

alarm_set(0, frequency);












