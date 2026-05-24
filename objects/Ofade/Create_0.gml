
trans_type = "iris";
newX = 0;
newY = 0;
newRoom = undefined;
newRoom_data = undefined;
oldRoom = undefined;
oldRoom_data = undefined;
oldChars = undefined;
oldChars_data_array = [];
newChars_depth_array = [];
fadeLevel = 0.1;

fadeColor = c_black;
fadeSpd = 0.035;

mapX = 0;
mapY = 0;
vert = 0;
horz = 0;
spd = 8;
mapIndex = -1;
newMapIndex = -1;

inout = false;

loading = false;
load_out = false;

arrived = false;
arrive_timer = 2;

iris_speed = 8;
ispd_const = 8;
start_iris_timer = 10;
iris_enter_sfx_played = false;

map_placed = false;

x = camera_get_view_width(VIEW) / 2;
y = camera_get_view_height(VIEW) / 2;

image_index = 0;
image_speed = 0;


surface = -1;
GUI_W = display_get_gui_width();
GUI_H = display_get_gui_height();
radius = 220;
_x = GUI_W/2;
_y = GUI_H/2;
wait_a_frame_iris = 1;
wait_a_frame_map = 1;

exiting_game = false;
waiting = false;
wait_time = 45;

iris_fade_start_fade = false;

party_dir = -1;

depth = -999;;