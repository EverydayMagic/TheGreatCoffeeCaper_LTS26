set_song_ingame(noone);


//reset some globals and inventory
///we should only be in this room when starting a new save file therefore, reseting variables and inventory shouldn't harm anything

//reset inventory
if (instance_exists(Oitem_manager))
{
	with (Oitem_manager)
	{
		for (var i = 0; i < inv_max; i++)
		{
			array_set(inv, i, global.item_list.unknown);
		}
	}
}

//reset some globals
global.gamePaused = false;
//global.debugActive = false;
global.cutsceneActive = false;
global.battleActive = false;
global.itemAdding = false;
for (var bt = 0; bt < array_length(global.battleTutorial); bt++)
{
	array_set(global.battleTutorial, bt, true); 
}
for (var bsb = 0; bsb < array_length(global.bigsparkboss_intro); bsb++)
{
	array_set(global.bigsparkboss_intro, bsb, true); 
}

//reset this cluehunt variable
if (instance_exists(Ocluehunt))
{
	Ocluehunt.beating = false;	
}