// Feather disable all
function __InputConfigVerbs()
{
   enum INPUT_VERB
	{
		LEFT,
		RIGHT,
		UP,
		DOWN,
		SELECT,
		BACK,
		ITEM,
		PAUSE,
		ANYKEY,
		ANYMOVE,
	}
	
	InputDefineVerb(INPUT_VERB.LEFT, "left", vk_left, [-gp_axislh, gp_padl]);
	InputDefineVerb(INPUT_VERB.RIGHT, "right", vk_right, [gp_axislh, gp_padr]);
	InputDefineVerb(INPUT_VERB.UP, "up", vk_up, [-gp_axislv, gp_padu]);
	InputDefineVerb(INPUT_VERB.DOWN, "down", vk_down, [gp_axislv, gp_padd]);
	if (INPUT_ON_SWITCH_X || INPUT_ON_PS4 || INPUT_ON_PS5)
	{
		InputDefineVerb(INPUT_VERB.SELECT, "select", undefined, gp_face2);
		InputDefineVerb(INPUT_VERB.BACK, "back", undefined, gp_face1);	
		InputDefineVerb(INPUT_VERB.PAUSE, "pause", undefined, gp_start);
	} else {
		InputDefineVerb(INPUT_VERB.SELECT, "select", ord("Z"), gp_face1);
		InputDefineVerb(INPUT_VERB.BACK, "back", ord("X"), gp_face2);
		InputDefineVerb(INPUT_VERB.PAUSE, "pause", vk_shift, gp_select);
	}
	InputDefineVerb(INPUT_VERB.ITEM, "item", undefined, gp_face3);
	InputDefineVerb(INPUT_VERB.ANYKEY, "anykey", vk_anykey, [-gp_axislh, gp_axislh, gp_axislv, -gp_axislv, gp_padl, gp_padr, gp_padu, gp_padd, gp_face1, gp_face2, gp_face3, gp_face4]);
	InputDefineVerb(INPUT_VERB.ANYMOVE, "anymove", [vk_up, vk_down, vk_left, vk_right], [-gp_axislh, gp_axislh, gp_axislv, -gp_axislv, gp_padl, gp_padr, gp_padu]);
}
