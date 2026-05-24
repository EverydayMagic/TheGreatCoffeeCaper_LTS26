if (global.cutsceneActive = false)
{
	if (!instance_exists(Ofade)) //this check is for end of the demo
	{
		instance_activate_object(Oplayer);
		Oplayer.x = x;
		Oplayer.y = y;
		Oplayer.image_index = image_index;
		Oplayer.sprite_index = sprite_index;
		Oplayer.visible = true;
	
		//give charlie positions
		//if (recorded)
		//{
		//	var _p = Oplayer;
		//	_p.pos_x = pos_x_togive;
		//	_p.pos_x = pos_x_togive;
		//	_p.pos_y = pos_y_togive;
		//	_p.toRecordSprite = toRecordSprite_togive;
		//	_p.toRecordImageIndex = toRecordImageIndex_togive;
		//	_p.toRecordImageSpeed = toRecordImageSpeed_togive;
		//}
	}
	
	instance_destroy();
}


if (global.cutsceneActive)
{
	//if (begin_record)
	//{
	/*
		if (x != xprevious or y != yprevious)
		{
				for (var i = array_size_togive - 1; i > 0; i--){
	
					//pos_x_togive[i] = pos_x_togive[i - 1];
					//pos_y_togive[i] = pos_y_togive[i - 1];
			
					//toRecordSprite_togive[i] = toRecordSprite_togive[i - 1];
					//toRecordImageIndex_togive[i] = toRecordImageIndex_togive[i - 1];
					//toRecordImageSpeed_togive[i] = toRecordImageSpeed_togive[i - 1];
					pos_x[i] = pos_x[i - 1];
					pos_y[i] = pos_y[i - 1];
	
				}
				
				pos_x[0] = x;
				pos_y[0] = y;
				
				//pos_x_togive[0] = x;
				//pos_y_togive[0] = y;
				
				//var _spr_nm = sprite_get_name(sprite_index);
				//if (_spr_nm = "Splayer_capwalk_d" || _spr_nm = "Splayer_capwalk_l" || _spr_nm = "Splayer_capwalk_r" || _spr_nm = "Splayer_capwalk_u")
				//{
				//	toRecordSprite_togive[0] = Splayer_capwalk;
				//} else {
				//	toRecordSprite_togive[0] = sprite_index;
				//}
				//toRecordImageIndex_togive[0] = image_index;
				//toRecordImageSpeed_togive[0] = image_speed;
				
				//recorded = true;
		
		}		
	//}
	*/
	var _pm = Opartypoint_manager;
	//update pos recording
	if (x != xprevious or y != yprevious)
	{		
		pm_backup = true;
		
		_pm.pos_x[0] = x;
		_pm.pos_y[0] = y;
		
		
		_pm.toRecordSprite[0] = sprite_index;
		_pm.toRecordImageIndex[0] = image_index;
		_pm.toRecordImageSpeed[0] = image_speed;
		
	} else pm_backup = false;
}

if (!depth_manual)
	depth = -y;



