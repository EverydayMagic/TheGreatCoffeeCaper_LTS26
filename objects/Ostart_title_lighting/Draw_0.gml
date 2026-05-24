switch (beat)
{
	case 0:
		//bg
			draw_set_color(c_black);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
		//title
			draw_sprite(Scoffee_title, 2, 0, 0);
		//lightning
			draw_set_color(white_col);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
	break;
	case 1:
		//bg
			draw_set_color(c_black);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
		//title
			draw_sprite(Scoffee_title, 2, 0, 0);
	break;
	case 2:
		//bg
			draw_set_color(c_black);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
		//title
			draw_sprite(Scoffee_title, 2, 0, 0);
		//lightning
			draw_set_color(white_col);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
	break;
	case 3:
		//bg
			draw_set_color(c_black);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
		//title
			draw_sprite(Scoffee_title, 2, 0, 0);
	break;
	case 4:
		//bg
			draw_set_color(c_black);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
		//title
			draw_sprite(Scoffee_title, 2, 0, 0);
		//lightning
			draw_set_color(white_col);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
	break;
	case 5:
		//bg
			draw_set_color(c_black);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
		//title
			draw_sprite(Scoffee_title, 2, 0, 0);
	break;
	case 6:
		//bg
			draw_set_color(c_black);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
		//title
			draw_sprite(Scoffee_title, 2, 0, 0);
			
		//text
			draw_set_font(global.settings.font);
			draw_set_color(white_col);
			draw_set_halign(fa_center);
			draw_set_alpha(txt_alph);
			draw_text(room_width/2, (room_height/4) * 3, "The next morning...");
			reset_draw_funcs();
	break;
	case 7:
		//bg
			draw_set_color(c_black);
			draw_rectangle(0, 0, 160, 144, false);
			draw_set_color(c_white);
		//title
			draw_sprite(Scoffee_title, 2, 0, 0);
			
		//text
			draw_set_font(global.settings.font);
			draw_set_color(white_col);
			draw_set_halign(fa_center);
			draw_set_alpha(txt_alph);
			draw_text(room_width/2, (room_height/4) * 3, "The next morning...");
			reset_draw_funcs();
	break;
}














