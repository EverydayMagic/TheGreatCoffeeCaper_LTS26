beat = 0;

txt_alpha = 0;
black_alpha = 1;

fadespd = 0.02;

cofhouse_scale = 1;

beat_time_length = 1;

global.cutsceneActive = true;

beat_time = time_source_create(time_source_game, beat_time_length, time_source_units_seconds, function(){
		beat++;
		time_source_destroy(beat_time);
});







