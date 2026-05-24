target_x = 72;
target_y = 27;
dest = Rwoodshop;
inout = true;
trans_type = "iris";

if (instance_exists(Oladder))
	if (Oladder.onroof != true)
		instance_destroy();
