function reset_window(){
    if (global.settings.fullscreen) 
	{
		with (Ocamera)
		{
			view_width = 160;
			view_height = 144;
			base_window_width = 288;
			base_window_height = 162;

			window_width = display_get_width();
			window_height = display_get_height();

			max_window_width = window_width;
			max_window_height = window_height;

			window_scale = min(max_window_width/base_window_width, max_window_height/base_window_height);
			window_scale = max(window_scale, 1);
			app_scale = window_scale;

			window_width = base_window_width * window_scale;
			window_height = base_window_height * window_scale;

			surface_resize(application_surface, view_width * app_scale, view_height * app_scale);
			display_set_gui_size(window_width * app_scale, window_height * app_scale);	
		}
		
		return;
	}
    with (Ocamera) {
		view_width = 160;
		view_height = 144;
		base_window_width = 288;
		base_window_height = 162;

		window_width = display_get_width();
		window_height = display_get_height();

		max_window_width = window_width * 0.75;
		max_window_height = window_height * 0.75;

		window_scale = floor(min(max_window_width/base_window_width, max_window_height/base_window_height));
		window_scale = max(window_scale, 1);
		app_scale = window_scale;

		window_width = base_window_width * window_scale;
		window_height = base_window_height * window_scale;

		window_set_size(window_width, window_height);

		alarm[0] = 1;

		surface_resize(application_surface, view_width * app_scale, view_height * app_scale);
		application_surface_draw_enable(false);
		display_set_gui_size(base_window_width * app_scale, base_window_height * app_scale);
		gpu_set_texfilter(false);
    }
}