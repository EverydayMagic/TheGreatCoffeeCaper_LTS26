x = camera_get_view_x(view_camera[0]) + 16;
y = camera_get_view_y(view_camera[0]) + 32;

_Omenu = Omenu;

depth = Omenu.depth - 1;

//item constructor
function create_item(_name, _description, _sprite_ovr, _sprite_icon, _battle_sprite_fill = _sprite_ovr, _battle_sprite_idle = _sprite_ovr, _effect, _quantity = 1, _display_name = _name, _consumable = false) constructor
	{
		name = _name;
		description = _description;
		sprite = _sprite_ovr;
		sprite_icon = _sprite_icon;
		battle_sprite_fill = _battle_sprite_fill;
		battle_sprite_idle = _battle_sprite_idle;
		effect = _effect;
		quantity = _quantity;
		display_name = _display_name;
		consumable = _consumable;
	}

//create the items
global.item_list = 
	{
	#region story items
	
		detective_hat : new create_item(
			"Hoots Hat",
			"How can you solve a mystery without your special hat?",
			Shootshat_item_ovr,
			Shootshat_item_icon,
			Sbattleclue_hootshat_fill,
			Sbattleclue_hootshat,
			function()
			{
				ex_cutscene("Equip Hat");
			}
		),
	
		mglass : new create_item(
			"Spark Glass LVL 0",
			"A special tool to snuff out sparks!",
			Ssparkglass_item_ovr,
			Ssparkglass_item_icon,
			Ssparkglass_item_icon,
			Ssparkglass_item_icon,
			function()
			{
				ex_cutscene("Mole Guide");
			},
			1,
			"Spark Glass",
		),
	
		mglass_fly : new create_item(
			"Spark Glass LVL 1",
			"Press [@C^@] to glide across the battle field!",
			Ssparkglass_fly_item_ovr,
			Ssparkglass_fly_item_icon,
			Ssparkglass_fly_item_ovr,
			Ssparkglass_fly_item_ovr,
			function()
			{
				//do nothing	
			},
			1,
			"Spark Glass",
		),
	
		unknown : new create_item(
			"Unknown",
			"Who knows what this could be?! Also how did you find this!?",
			Sunknown_item_icon,
			Sunknown_item_ovr,
			Sunknown_item_ovr,
			Sunknown_item_ovr,
			function()
			{
				//do nothing	
			}
		),
		
		book : new create_item(
			"Book",
			"Book it baby.",
			Sbook_item,
			Sbook_item,
			Sbook_item,
			Sbook_item,
			function()
			{
				//do nothing	
			}
		),
	
		music_sheet : new create_item(
			"Music Sheet",
			"Where could these strange glyphs have come from?",
			Sbattleclue_musicsheet,
			Smusicsheet_item_icon,
			Sbattleclue_musicsheet_fill,
			Sbattleclue_musicsheet,
			function()
			{
				ex_cutscene("MusicSheet Found");		
			}
		),
	
		cloud_puff : new create_item(
			"Cloud Puff",
			"Don't these normally float in the sky?",
			Sbattleclue_cloudpuff,
			Scloudpuff_item_icon,
			Sbattleclue_cloudpuff_fill,
			Sbattleclue_cloudpuff,
			function()
			{
				ex_cutscene("CloudPuff Found");
			}
		),
	
		blue_hat : new create_item(
			"Blue Hat",
			"Quite dashing! Who could have used something like this?",
			Sbattleclue_bluehat,
			Sbluehat_item_icon,
			Sbattleclue_bluehat_fill,
			Sbattleclue_bluehat,
			function()
			{
				ex_cutscene("BlueHat Found");	
			}
		),
	
		clue_timer_lvl1 : new create_item(
			"Clue Timer LVL 1",
			"LVL 1&Handle turning, the time keeps on burning!",
			Sbattleclue_cluetimer_lvl1,
			Scluetimer_lvl1_item_icon,
			Sbattleclue_cluetimer_lvl1,
			Sbattleclue_cluetimer_lvl1,
			function()
			{
				//do nothing	
			}, 
			1, 
			"Stopwatch",
		),
	
		clue_timer_lvl2 : new create_item(
			"Clue Timer LVL 2",
			"LVL 2&A little more time to snuff out crime!",
			Sbattleclue_cluetimer_lvl2,
			Scluetimer_lvl2_item_icon,
			Sbattleclue_cluetimer_lvl2,
			Sbattleclue_cluetimer_lvl2,
			function()
			{
				//do nothing	
			},
			1,
			"Stopwatch",
		),
	
		feather : new create_item(
			"Feather",
			"Perfect for a cap. We'll call it macaroni...",
			Sbattleclue_feather,
			Sfeather_item_icon,
			Sbattleclue_feather_fill,
			Sbattleclue_feather,
			function()
			{
				//do nothing	
			}
		),
	
		gear : new create_item(
			"Gear",
			"",
			Sbattleclue_gear,
			Sgear_item_icon,
			Sbattleclue_gear_fill,
			Sbattleclue_gear,
			function()
			{
				//do nothing	
			}
		),
	
		gold_ring : new create_item(
			"Ringlet Piece",
			"",
			Sbattleclue_goldring,
			Sgoldring_item_icon,
			Sbattleclue_goldring_fill,
			Sbattleclue_goldring,
			function()
			{
				//do nothing	
			}
		),
	
		handle_piece : new create_item(
			"Handle Piece",
			"I guess you really did get a get a grip!",
			Sbattleclue_handlepiece,
			Shandlepiece_item_icon,
			Sbattleclue_handlepiece_fill,
			Sbattleclue_handlepiece,
			function()
			{
				//do nothing	
			}
		),
	
		love_letter : new create_item(
			"Love Letter",
			"A heartfelt parchment full of sophisticated emotions...",
			Sbattleclue_loveletter,
			Sloveletter_item_icon,
			Sbattleclue_loveletter_fill,
			Sbattleclue_loveletter,
			function()
			{
				ex_cutscene("LoveLetter Found");	
			}
		),
	
		hammer : new create_item(
			"Hammer",
			"A name is engraved on the handle: 'CLAWDINE'",
			Sbattleclue_hammer,
			Shammer_item_icon,
			Sbattleclue_hammer_fill,
			Sbattleclue_hammer,
			function()
			{
				//ex_cutscene("Hammer Found");	
			}
		),
	
		spring : new create_item(
			"Spring",
			"",
			Sbattleclue_spring,
			Sspring_item_icon,
			Sbattleclue_spring_fill,
			Sbattleclue_spring,
			function()
			{
				//do nothing	
			}
		),
	
	#endregion
	
	#region health items
		
		apple : new create_item(
			"Apple",
			"A worm sends his greetings!&Heals @10^@ HP",
			Sitem_consum_apple_ovr,
			Sitem_consum_apple_icon,
			Sitem_consum_apple_ovr,
			Sitem_consum_apple_ovr,
			10,
			1,
			"Apple",
			true
		),
		
		pie : new create_item(
			"Apple Pie",
			"Baked with love in every bite!&Heals @75^@ HP",
			Sitem_consum_pie_ovr,
			Sitem_consum_pie_icon,
			Sitem_consum_pie_ovr,
			Sitem_consum_pie_ovr,
			75,
			1,
			"Apple Pie",
			true
		),
		
	#endregion
	
	#region other stash items
		
		screw : new create_item(
			"Screw",
			"Great use if you've got one loose!",
			Sbattleclue_screw,
			Sscrew_item_icon,
			Sbattleclue_screw_fill,
			Sbattleclue_screw,
			function()
			{
				//do nothing	
			},
			1,
			"Screw",
			false
		),
		
	#endregion
	
	}
	

//create the clue inventory
inv = array_create(0);
inv_max = 12;


for (var i = 0; i < inv_max; i++)
{
	array_set(inv, i, global.item_list.unknown);
}
//create the stash inventory
inv_stash = array_create(0);
inv_stash_max = 6;

for (var ii = 0; ii < inv_stash_max; ii++)
{
	array_set(inv_stash, ii, global.item_list.unknown);	
}



//for drawing and mouse positions
item_surface = -1;

//Inventory Key
keyInventory=keyboard_check_pressed(ord("C"));

pos = -1;
it_length = 0;
invent = 0;




equipped = -1;



pick_up_cap = false;