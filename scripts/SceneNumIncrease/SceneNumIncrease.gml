// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//@param object
//@param moveOrder
//@param *npc*
function SceneNumIncrease(_obj, _moveOrder){
	if (_obj.moveOrder = _moveOrder)
	{
		if (argument_count > 1) 
			argument[2].scene++;
		else
			_obj.scene++;
		
		return true;	
	} else exit;
}