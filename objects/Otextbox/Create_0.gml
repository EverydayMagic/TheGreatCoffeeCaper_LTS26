	if (instance_exists(Omenu))
	depth = Omenu.depth - 1;
	else	
		depth = -bbox_bottom;

	wait_a_frame = 1;
	waiting = false;

	//textbox parameters
	textbox_width = 164;
	textbox_height = 65;
	xborder = 15;

	yborder = 15;

	r_xborder = 20;

	portrait_y_offset = 21;

	line_sep = 12;
	line_width = textbox_width - yborder * 3;
	line = 0;

	txtb_spr[0] = global.txtbox;
	txtb_img=0;
	txtb_img_spd = 6 / 30; 

	//the text
	page = 0;
	page_number = 0;
	text[0] = "";
	text_length[0] = string_length(text[0]);
	char[0, 0] = "";
	char_x[0, 0] = 0;
	char_y[0, 0] = 0;
	draw_char = 0;
	draw_char_floor = 0;
	last_char = -1;
	text_spd[0] = 1;
	text_scale = 2;
	//options
	option[0] = "";
	option_link_id[0] = -1;
	option_pos = 0;
	option_number = 0;


	setup = false;
	
	//for embeds
	color_embed = false;
	sprite_embed = false;
	ending_embed = false;

	//sound
	snd_delay = 1;
	snd_count = snd_delay;

	//effects
	set_defaults_for_text();
	last_free_space = 0;
	text_pause_timer = 0;
	text_pause_time = [];
	text_pause_count = 0;
	talkturn_inst = [];

	textbox_x = 0;
	textbox_y = 0;

	arrow_ani = 0;
	buby = 0;
	bubdown = true;

	down = -1;

	char_online = 0;
	linebreakpos_limit = 0;
	
	inline_spr_width_online = 0;

	surface = 0;

	call_later(0.25, time_source_units_seconds, function(){
		bubdown =! bubdown;
	}, true);



	setup = function() {
	
		textbox_x = camera_get_view_x(VIEW) - 2;
		textbox_y = camera_get_view_y(VIEW) + 78;
	
		text_pause_count = 0;

		if (instance_exists(Oplayer) && Oplayer.visible = true)
			if (Oplayer.y > 78)
				textbox_y = camera_get_view_y(VIEW) + 1;
	
		if (instance_exists(Omglass))
		{
			if (Omglass.y > 78)
				textbox_y = camera_get_view_y(VIEW) + 1;
		}
			
		if (down != -1)
		{
			if (down = false)
				textbox_y = camera_get_view_y(VIEW) + 1;
			if (down = true)
				textbox_y = camera_get_view_y(VIEW) + 78;
		}

		draw_set_font(global.settings.font);
		
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
	
		//loop through the pages
		page_number = array_length(text);
		for (var p = 0; p < page_number; p++) {
			//text[p] = string_replace_all(text[p], "*", "&*");
			if (string_char_at(text[p], 1) == "&")
				text[p] = string_delete(text[p], 1, 1);
		
			//find how many characters are on each page and store that number in the "text_length" array
			text_length[p] = string_length(text[p]);
		
			//get the x position for the textbox
			//character on the left
			text_x_offset[p] = 0;
			portrait_x_offset[p] = 12;
			//character on right
			if (speaker_sprite[p] == -1)
			{
				text_x_offset[p] = 8;
				portrait_x_offset = 216;
			}
		
			//no character (center the textbox)
			if (speaker_sprite[p] == noone) {
				r_xborder = 0;
				text_x_offset[p]= 0;
			} else r_xborder = 20;
		
		
				
			//setting individual characters and finding where the lines of text should break
			char_online = 0;
			for (var c = 0; c < text_length[p]; c++) {
				var _char_pos = c + 1;
			
				//store individual characters in the "char" array
				char[c, p] = string_char_at(text[p], _char_pos);
				
				//if ending embed is detected, prepare to end whatever text effect is currently present
				if (char[c, p] = "^")
				{
					char[c, p] = string_char_at(text[p], _char_pos + 1);
					text[p] = string_delete(text[p], _char_pos, 1);

					ending_embed = true;
				}
				
				//resetting stuff based on the next embed after the closing embed
				if (ending_embed)
				{
					ending_embed = false;
					switch (char[c, p])
					{
						case "@": //reset color of character
							color_1[c, p] = white_col;
							color_2[c, p] = white_col;
							color_3[c, p] = white_col;
							color_4[c, p] = white_col;
							color_embed = false;
							char[c, p] = string_char_at(text[p], _char_pos + 1);
							text[p] = string_delete(text[p], _char_pos, 1);
						break;
						
						default: 
							//ending_embed = true; 
						break;
					}
				}
				
				#region embeds
				
					//setting color of character
						if (char[c, p] = "@")
						{
							color_embed = true;
					
							//setting the current character to the next character and deleting the embed from the text to pull from
							char[c, p] = string_char_at(text[p], _char_pos + 1);
							text[p] = string_delete(text[p], _char_pos, 1);
						}
						if (color_embed)
						{
							color_1[c, p] = orange_col;
							color_2[c, p] = orange_col;
							color_3[c, p] = orange_col;
							color_4[c, p] = orange_col;	
						}
					
					//in-line sprite
						if (char[c, p] = "%")
						{
							var _spr_id_str = "";
							//get the id of the sprite
							text[p] = string_delete(text[p], _char_pos, 1); //delete the first "%"
							for (var ti = _char_pos; ti < string_length(text[p]); ti += 0)
							{
								if (string_char_at(text[p], ti) != "^")
								{
									_spr_id_str += string_char_at(text[p], ti);
									char[c, p] = string_char_at(text[p], _char_pos + 1);
									text[p] = string_delete(text[p], _char_pos, 1); //delete the character of the sprite id
								} else {
									char[c, p] = string_char_at(text[p], _char_pos + 2);
									text[p] = string_delete(text[p], _char_pos, 2); //delete the "^%"
									break;
								}
							}
							
							var _spr_id = asset_get_index(_spr_id_str);
							
							if (sprite_exists(_spr_id))
							{
								inline_spr[c, p] = _spr_id;
								inline_spr_width_online += sprite_get_width(_spr_id);
							}
						}
					
				#endregion
				
				//get current width of the line
				var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
				var _current_txt_w = (string_width( _txt_up_to_char) + inline_spr_width_online) - string_width(char[c, p]);
				//get the last free space
					if (char[c, p] == " ")
						last_free_space = _char_pos + 1;
			
				char_online++;
				if (char[c, p] == "&") {
					char[c, p] = "";
					line_break_pos[ line_break_num[p], p] = _char_pos + 1;
					line_break_num[p]++;
					line++;
					char_online = 0;
					inline_spr_width_online = 0;
					var _txt_up_to_last_space = string_copy(text[p], 1, _char_pos + 1);
					var _last_free_space_string = string_char_at(text[p], _char_pos + 1);
					line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
				} else if (_current_txt_w - line_break_offset[p] > line_width - r_xborder) {
					line_break_pos[ line_break_num[p], p] = last_free_space;
					line_break_num[p]++;
					line++;
					char_online = 0;
					inline_spr_width_online = 0;
					var _txt_up_to_last_space = string_copy (text[p], 1, last_free_space);
					var _last_free_space_string = string_char_at(text[p], last_free_space);
					line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
				}

			}
			
			//getting each characters coordinates
			linebreakpos_limit = 0;
			char_online = 0;
			inline_spr_width_online = 0;
			line = 0;
			xborder = 46;
			for (var c = 0; c < text_length[p]; c++) {
			
				var _char_pos = c + 1;
				var _txt_x = textbox_x + text_x_offset[p] + xborder;
				var _txt_y = textbox_y + yborder;

				//get current width of the line
				var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
				//sprite width calculated only for first line
				if (line = 0)
				{
					if (c > 0 && sprite_exists(inline_spr[c - 1, p]))
					{
						inline_spr_width_online += sprite_get_width(inline_spr[c - 1, p]);
					}
				}
				var _current_txt_w = (string_width(_txt_up_to_char) + inline_spr_width_online) - string_width(char[c, p]);
					
				var _txt_line = 0;
					
				//compensate for string breaks
				for (var lb = 0; lb < line_break_num[p]; lb++)
				{
					show_debug_message("LINE: " + string(line));
					//if the current looping character is after a line break
					if (_char_pos >= line_break_pos[lb, p]) {
						if (_char_pos = line_break_pos[lb, p]){ inline_spr_width_online = 0; line++; }
						
						var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
						if (c > 0 && sprite_exists(inline_spr[c - 1, p]) && lb < (line_break_num[p] - 1))
						{
							inline_spr_width_online += sprite_get_width(inline_spr[c - 1, p]);
						}
						show_debug_message("SPR WID ONLINE: " + string(inline_spr_width_online));
						_current_txt_w = string_width(_str_copy) + inline_spr_width_online;
					
						_txt_line = lb + 1; //+1 since lb starts at 0
					}
				}
				if (speaker_sprite[p] == noone)
					xborder = 15;
			
				_txt_x = textbox_x + text_x_offset[p] + xborder;
			
				//add to the x and y coordinates based on the new info
				char_x[c, p] = _txt_x + _current_txt_w;
				char_y[c, p] = _txt_y + _txt_line * line_sep;
			
				if (linebreakpos_limit < array_length(line_break_pos) - 1)
					linebreakpos_limit++;
			}
		}
	}
