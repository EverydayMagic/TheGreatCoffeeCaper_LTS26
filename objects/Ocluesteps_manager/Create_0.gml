//class is whether it is spark or footprint
//subclass is what kind of spark or footprint
class = -1;
subclass = -1;

dice = -1;
diced_it = false;
dice_target = 0;


x = -1;
y = -1;


//possible x & y are so that the spark is always placed on the tile
possible_x[0] = -1;
possible_y[0] = -1;

for (var i = 0; i < 8; i++)
	possible_x[i] = (room_width - (16 * (i + 1)));

for (var q = 0; q < 8; q++)
	possible_y[q] = (room_height - (16 * (q + 1)));
	
spark_placed = false;


check_dir[0] = -1;


footprint_id[0] = -1;

tile_pix_array[0] = -1;
all_empty = true;

scripted_cluehunt = false;
scripted_footssplaced = false;

