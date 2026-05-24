function reset_window(){
    if (window_get_fullscreen()) return;
    with (Ocamera) {
      window_set_size(view_width * window_scale, view_height * window_scale);
      alarm[0] = 1;
	  gpu_set_texfilter(false);
    }
}