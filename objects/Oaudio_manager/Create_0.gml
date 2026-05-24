cutscene_override = false;





//info for the song we are playing/currently trying to play
songInstance = noone;
oldSongAsset = noone;
songAsset = noone;
songAssetString = noone;
songAssetString_justsong = noone;
oldSongAssetString_justsong = noone;
targetSongAsset = noone;
endFadeOutTime = 0;//how many frames to fade out the song currently playing
startFadeInTime = 0;//how many frames to fade in the new song
fadeInInstVol = 1;//the volume of songInstance

//for fading music out and stopping songs that are no longer playing
fadeOutInstances = array_create(0);//audio instances to fade out
fadeOutInstanceVol = array_create(0);//the volumes of each individual audio instance
fadeOutInstTime = array_create(0);//how fast the fadeout should happen

//for connected songs (like overworld and indoor music)
songStartTime = 0;
songStopwatch = 0;

oldStopwatch = 0;




//pitch
songPitch = 1;
oldSongPitch = 1;

songLoop = true;
songAfterPlay = noone; //song to succeed song that is only playing once (like title theme)

crossFade = false;

//room groups
global.house_rooms = [
	Rhooters,
	Rhooterscloset,
	Rjitterhouse,
	Rsnifflehouse
]

global.outside_rooms = [
	Rneighborhood,
	Routbighouse,
	Routchophouse,
	Routcoffeehouse,
	Routsidehooters,
	Rbeforeneighborhood,
	Rbridge,
	Rinbetween,
	Rladder,
	Rpathtopond,
	Rroadtohoots,
	Rstage
]

global.special_house_rooms = [
	Rfroggyhouse,
	Rcoffeeshop,
	Rcoffeecloset,
	Rwoodshop
]

global.other_rooms = [
	Rbattle,
	Rtitle,
	Rsubtitle,
	Rgame_start,
	Rdebug_menu
]

