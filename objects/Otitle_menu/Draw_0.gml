

switch (beat)
{
	//ED Magic Logo
	
	
	//1st Coffee Caper Logo
	case 2:
		depth = Otitle_circle.depth + 2;
		//brown bg
		draw_sprite(Stitle_bg, 1, 0, 0);
		draw_sprite(Scoffee_title, 0, 0, 0);
	break;
	
	//Circle Appears
	case 3:
		//orange bg
		layer_set_visible("BG", true);
	break;
	
	//Circle Grows and Start is Shown
	case 4:
		layer_set_visible("BG", true);
		//z start
		draw_sprite(Stitle_zstart, zstart_img, 54, 128);
		//title
		draw_sprite(Scoffee_title, 1, 0, 0);
		//start text
		draw_set_font(global.settings.font);
		draw_set_color(#390C14);
		draw_text(75, 130, "START");
		draw_set_color(c_white);
		
	break;
	
	//Only Start
	case 5:
		//orange bg
		layer_set_visible("BG", true);
		//z start
		draw_sprite(Stitle_zstart, zstart_img, 54, 128);
		//title
		draw_sprite(Scoffee_title, 1, 0, 0);
		//start text
		draw_set_font(global.settings.font);
		draw_set_color(#390C14);
		var _y = 130;
		if (global.settings.font = global.font_ffl){ _y = 134; }
		draw_text(75, _y, "START");
		draw_set_color(c_white);
		if (instance_exists(Otitle_circle) && surface_exists(Otitle_circle.surface))
		{
			surface_free(Otitle_circle.surface);
			instance_destroy(Otitle_circle);
		}
	break;

}








