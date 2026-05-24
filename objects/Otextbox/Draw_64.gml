	draw_set_font(global.settings.font);
		
	//- - - - - - - draw the text box - - - - - - - -//
	var _txtb_x = (textbox_x + text_x_offset[page]) * 2;
	var _txtb_y = textbox_y * 2;
    

	txtb_img += txtb_img_spd;

	txtb_spr_w = sprite_get_width(txtb_spr[page]);
	txtb_spr_h = sprite_get_height(txtb_spr[page]);
  
	//back of the text box
	draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x - 1, _txtb_y, (textbox_width / txtb_spr_w) * 2, (textbox_height / txtb_spr_h) * 2, 0, c_white, 1); 

	//draw the speaker
	if (speaker_sprite[page] != noone) {
		sprite_index = speaker_sprite[page];
        
		if (draw_char == text_length[page])
		    image_index = 0;
        
		var _speaker_x = textbox_x + portrait_x_offset[page];
		if speaker_side[page] == -1 {_speaker_x += sprite_width};
		//draw the speaker
		draw_sprite_ext(sprite_index, speaker_imgindex[page], _speaker_x * 2, (textbox_y + portrait_y_offset) * 2, speaker_side[page] * 2, 1 * 2, 0, c_white, 1);
	}
 

	var _optionified = false;
	if (option_number > 0)
		if (page = page_number - 1)	
			_optionified = true;
	//draw arrow
	if (auto_move[page] = false)
	{
		if (draw_char = text_length[page] && !_optionified)
			if ((textbox_y = camera_get_view_y(VIEW) + 78) || down = true)
				draw_sprite_ext(Sarrow, arrow_ani, 143 * 2, 124 * 2, 1 * 2, 1 * 2, 0, c_white, 1);
			else
				draw_sprite_ext(Sarrow, arrow_ani, 143 * 2, 47 * 2, 1 * 2, 1 * 2, 0, c_white, 1);
	}

	//- - - - - - - Options - - - - - - - -//
	if (draw_char == text_length[page] && page == page_number - 1) {
		//option selection
		option_pos += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
		option_pos = clamp(option_pos, 0, option_number-1);
		//draw the options
		var _op_space = 70;
		var _op_text_bord = 48;
		var _col = white_col;
    
		for (var op = 0; op < option_number; op++) {
		    //the highlight
		    if (option_pos == op) {
		        draw_sprite_ext(Sarrow, arrow_ani, (_txtb_x + 50) + (_op_space * op + (1 * op)), _txtb_y + 64, 2, 2, 0, c_white, 1);
		    }
			if (option_pos == op)
				_col = orange_col;
			else
				_col = white_col;
			
		    //the option text
			draw_set_halign(fa_center);
		    draw_text_ext_transformed_color((_txtb_x * 2) + _op_text_bord + _op_space * op + (4 * op) + 4, _txtb_y + ((_op_text_bord - 9) * 2), option[op], 10, 90, 2, 2, 0, _col, _col, _col, _col, 1);
			reset_draw_funcs();
			
		}
	}

	//draw the text
	for (var c = 0; c < draw_char; c++) {
		//- - - special effects - - -//
        
		//floating/wavy text
		var _float_y = 0;
		if float_text[c, page] == true
		    {
		        float_dir[c, page] += -6;
		        _float_y = dsin(float_dir[c, page])*2;
		    }
        
		//shake text
		var _shake_x = 0;
		var _shake_y = 0;
		if shake_text[c, page] == true
		    {
		        shake_timer[c, page]--;
		        if shake_timer[c, page] <= 0
		            {
		                shake_timer[c, page] = irandom_range(4, 8);
		                shake_dir[c, page] = irandom(360);
		            }
		        if shake_timer[c, page] <= 2 {
		            _shake_x = lengthdir_x(1, shake_dir[c, page]);
		            _shake_y = lengthdir_y(1, shake_dir[c, page]);
		        }
		    }
		
		//the text
		draw_text_transformed_color((char_x[c, page] + _shake_x) * 2, (char_y[c, page] + _float_y + _shake_y) * 2, char[c, page], text_scale, text_scale, 0, color_1[c, page], color_2[c, page], color_3[c, page], color_4[c, page], 1);
		if (sprite_exists(inline_spr[c, page]))
		{
			draw_sprite_ext(inline_spr[c, page], 0, (char_x[c, page] + _shake_x) * 2, (char_y[c, page] + _float_y + _shake_y) * 2, 2, 2, 0, c_white, 1);
		}
	}













