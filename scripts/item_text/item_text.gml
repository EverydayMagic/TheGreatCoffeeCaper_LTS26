
function item_text(_text_id){
	
	if (_text_id != "Love Letter" && Omenu.visible)
	{
		if (Omenu.downtrack = 0)
		{ 
			if (Oitem_manager.inv[Omenu.active_box].consumable = false)
			{
				_text_id = "nameanddesc"; 
			} else {
				_text_id = "consumable";
			}
		} else {
			if (_text_id = Oitem_manager.inv_stash[Omenu.stash_active_box].display_name)
			{
				if (Oitem_manager.inv_stash[Omenu.stash_active_box].consumable = false)
				{
					_text_id = "nameanddesc"; 
				} else {
					_text_id = "consumable";
				}	
			}
		}
	}
	
	switch (_text_id)
	{
		/////////////////////
		//ITEM DESCRIPTIONS//
		/////////////////////
			
			case "nameanddesc":
				if (Omenu.downtrack = 0)
				{
					Text(Oitem_manager.inv[Omenu.active_box].display_name);
					Text(Oitem_manager.inv[Omenu.active_box].description);
					
					if (Oitem_manager.inv[Omenu.active_box].display_name = "Spark Glass")
					{
						//display hp if it's spark glass
						Text("HP: @" + string(global.hp) + "^@/" + string(global.total_hp));
					}
				} else if (Omenu.downtrack = 1) {
					Text(Oitem_manager.inv_stash[Omenu.stash_active_box].display_name);
					Text(Oitem_manager.inv_stash[Omenu.stash_active_box].description);
					//options for stashable items
					Text("What will you do?");
						Option("Toss", "consumableToss");
						Option("Back", "consumableBack");
				}
			break;
			
		
		//////////////
		//EQUIP ITEM//
		//////////////
			case "equipitemYes":
				Text("Hootsworth pulled out " + Oitem_manager.inv[Omenu.active_box].name + ".", Oitem_manager.inv[Omenu.active_box].name);
				Oitem_manager.equipped = Oitem_manager.inv[Omenu.active_box];
			break;
			
			case "equipitemNo":
				if(instance_exists(Otextbox))
					instance_destroy(Otextbox);
				global.textActive = false;
			break;
			
		////////////////////
		//OTHER ITEM TEXTS//
		////////////////////
			case "currentlyequipped":
				Text("Hootsworth is already holding this.", Oitem_manager.inv[Omenu.active_box].name);
				Text("Put it away?", Oitem_manager.inv[Omenu.active_box].name);
					Option("Yes", "putawayitemYes");
					Option("No", "putawayitemNo");
			break;
			
			case "putawayitemYes":
				Text("Hootsworth put away " + Oitem_manager.inv[Omenu.active_box].name + ".");
				Oitem_manager.equipped = -1;
			break;
			
			case "putawayitemNo":
				if(instance_exists(Otextbox))
					instance_destroy(Otextbox);
				global.textActive = false;
			break;
			
		/////////////////////
		//LOVE LETTER STUFF//
		/////////////////////
			case "Love Letter":
				Text(Oitem_manager.inv[Omenu.active_box].name);
				Text(Oitem_manager.inv[Omenu.active_box].description);
				Text("A few too many large words...", "Hoots Yawn");
				Text("Take a peek?");
					Option("Yes", "LetterLook");
					Option("No", "LetterNo");
			break;
			
			case "LetterLook":
				Oloveletter_letter.visible = true;
				if(instance_exists(Otextbox))
					instance_destroy(Otextbox);
				global.textActive = false;
			break;
			
			case "LetterNo":
				Text("It's none of your business anyway...");
			break;
		
		//////////////////////
		//HEALTH CONSUMABLES//
		//////////////////////
			case "consumable":
				Text(Oitem_manager.inv_stash[Omenu.stash_active_box].display_name);
				Text(Oitem_manager.inv_stash[Omenu.stash_active_box].description);
				if (Ocluehunt.item_held != Oitem_manager.inv_stash[Omenu.stash_active_box])
				{
					Text("What will you do?");
						Option("Eat", "consumableEat");
						Option("Hold", "consumableHold");
						Option("Toss", "consumableToss");
						Option("Back", "consumableBack");
				} else {
					Text("Hootsworth is currently holding this.");
					Text("What will you do?");
						Option("Put Away", "consumableHoldPutAway");
						Option("Back", "consumableBack");
				}
			break;
			
			case "consumableEat":
				if (global.hp < global.total_hp)
				{
					//make it a different description based on how much hp was healed
					Text("Mmmm! Srumptious!");
					ChangeHP(Oitem_manager.inv_stash[Omenu.stash_active_box].effect);
					Text("Restored @" + string(Oitem_manager.inv_stash[Omenu.stash_active_box].effect) + "^@ HP&HP: @" + string(global.hp) + "^@/" + string(global.total_hp));
					if (Oitem_manager.inv_stash[Omenu.stash_active_box].quantity <= 1)
					{
						array_set(Oitem_manager.inv_stash, Omenu.stash_active_box, global.item_list.unknown);
					} else {
						Oitem_manager.inv_stash[Omenu.stash_active_box].quantity--;	
					}
					
				} else {
					//don't heal if hp is already max
					Text("Hootsworth is feeling stuffed...&HP: @" + string(global.hp) + "^@/" + string(global.total_hp));
				}
			break;
			
			case "consumableHold":
				if (Ocluehunt.item_held = noone)
				{
					Text("Hootsworth is now holding his @" + string(Oitem_manager.inv_stash[Omenu.stash_active_box].display_name) + "^@");
					Ocluehunt.item_held = Oitem_manager.inv_stash[Omenu.stash_active_box];
				} else {
					Text("Hootsworth is already holding his @" + string(Ocluehunt.item_held.display_name) + "^@.");
					Text("Hold @" + string(Oitem_manager.inv_stash[Omenu.stash_active_box].display_name) + "^@ instead?");
						Option("Yes", "consumableHoldSwapYes");
						Option("No", "consumableHoldSwapNo");
				}
			break;
				
				case "consumableHoldSwapYes":
					Text("Hootsworth is now holding his @" + string(Oitem_manager.inv_stash[Omenu.stash_active_box].display_name) + "^@.");
					Ocluehunt.item_held = Oitem_manager.inv_stash[Omenu.stash_active_box];
				break;
				
				case "consumableHoldSwapNo":
					if(instance_exists(Otextbox))
						instance_destroy(Otextbox);
					global.textActive = false;
				break;
				
				case "consumableHoldPutAway":
					Text("Hootsworth puts away his @" + string(Oitem_manager.inv_stash[Omenu.stash_active_box].display_name) + "^@.");
					Ocluehunt.item_held = noone;
				break;
			
			case "consumableToss":
				Text("Toss?");
					Option("Yes", "consumableTossYes");
					Option("No", "consumableTossNo");
			break;
				
				case "consumableTossYes":
					if (Oitem_manager.inv_stash[Omenu.stash_active_box].quantity <= 1)
					{
						Text("Hootsworth set the @" + string(Oitem_manager.inv_stash[Omenu.stash_active_box].display_name) + "^@ on the ground...");
					} else {
						Text("Hootsworth set all of the @" + string(Oitem_manager.inv_stash[Omenu.stash_active_box].display_name) + "s^@ on the ground...");
					}
					array_set(Oitem_manager.inv_stash, Omenu.stash_active_box, global.item_list.unknown);
				break;
				
				case "consumableTossNo":
					if(instance_exists(Otextbox))
						instance_destroy(Otextbox);
					global.textActive = false;
				break;
			
			case "consumableBack":
				if(instance_exists(Otextbox))
					instance_destroy(Otextbox);
				global.textActive = false;
			break;
			
			case "testspr":
				//Text("%Sonebelow^% Town&%Sonebelow^% Lake&%Sonebelow^% Mama's House");
				//Text("%Sonebelow^% Testing everything under the sun! Nobody%Sonebelow^% does sun like the sun!%Sonebelow^% Right?");
				//Text("The quick brown fox ran over the lazy dog The quick brown fox ran over the lazy dog");
			break;
			
	}
}