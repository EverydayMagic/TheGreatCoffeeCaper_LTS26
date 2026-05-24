depth = Omenu.depth - 1;
if (instance_exists(Otextbox))
	depth = Otextbox.depth + 1;
x = Omenu.x;
y = Omenu.y;

//draw equipped item
if (equipped != -1)
	draw_sprite(equipped.sprite_icon, 0, 0, room_height - sprite_get_width(equipped.sprite_icon));


//show_debug_message("spr: " + string(asset_get_index("Sunknown_item_icon")));







