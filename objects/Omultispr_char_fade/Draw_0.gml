if (array_length(char) > 0 && draw_count != -1)
{
	for (var i = 0; i < array_length(char); i++)
	{
		depth = char[i].depth + 1;
		for (var dc = 0; dc < draw_count; dc++)
		{
			draw_sprite_ext(char_spr[i][dc], char_spr_index[i][dc], char_spr_x[i][dc], char_spr_y[i][dc], 1, 1, 0, c_white, char_spr_alph[i][dc]);
		}
	}
} else exit;














