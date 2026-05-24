view_width = 160;
view_height = 144;

app_scale = 2;
window_scale = 5;

window_set_size(view_width * window_scale, view_height * window_scale);
alarm[0] = 1;

surface_resize(application_surface, view_width * app_scale, view_height * app_scale);
display_set_gui_size(view_width * app_scale, view_height * app_scale);


depth = -9999;

