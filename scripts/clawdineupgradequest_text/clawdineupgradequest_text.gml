function clawdineupgradequest_text(_text_id){
	switch(_text_id)
	{
		case "clawdineclawdine":
			Text("Hello, Clawdine!", "Hoots Happy");
			add_move_order();
		break;
		case "clawdineclawdine2":
			Text("Clawdine?", "Hoots Curious");
			add_move_order();
		break;
		case "howwakeup":
			Text("That's just great!", "Charlie FacePalm");
				talk_turn(Ocharliemouse_cutscene, Scmouse_embarrassed_cap);
			Text("How are we supposed to wake her up?", "Charlie Confused");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
			add_move_order();
		break;
		case "illriptoshreds":
			Text("*HISS*&I'll rip whoever did that to shreds!", "Clawdine Regular");
				pause(6, 6, 10);
			add_move_order();
		break;
		case "goodchapcheck":
			Text("Charlie, be a good chap and go check on her.", "Hoots Regular");
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 0);
				talk_turn(Ohoots_cutscene, Splayer_capidle, 3);
				pause(8, 8, 5);
			Text("No way!&I'm not going near that hissy fit!", "Charlie Regular");
				pause(7, 7, 10);
			add_move_order();
		break;
		case "ahabehindthis":
			Text("Aha!&So you're behind this!", "Clawdine Regular");
				talk_turn(Oclawdine, Sclawdine_idle, 1);
				pause(4, 4, 5);
			add_move_order();
		break;
		case "behindohdear":
			Text("Oh dear.", "Hoots Wide-Eyed");
				talk_turn(Ohoots_cutscene, Splayer_capidle, 3);
				talk_turn(Ocharliemouse_cutscene, Scmouse_idle, 3);
			add_move_order();
		break;
		case "whyincident":
			Text("And that's why this incident transpired.", "Hoots Regular");
			Text("You're lucky cats always land on their feet!", "Clawdine HmmCrossed");
			Text("Again, we’re terribly sorry, Clawdine.", "Hoots Regular");
				pause(6, 6, 3);
			Text("Now, I'm in no position to ask favors, but-", "Hoots Regular");
				pause(4, 4, 5);
			Text("I'm in need of new Spark Glass.", "Hoots Regular");
			Text("New Spark Glass??&What for?", "Clawdine HmmCrossed");
				pause(17, 17, 10);
			Text("For our search for Sniffles' niece!", "Hoots Happy");
			Text("She's missing?!", "Clawdine Regular");
			Text("Hmmm...", "Clawdine HmmHips");
			Text("Can't say I'm eager to help out after what you did.", "Clawdine HmmCrossed");
			Text("But, if that egg is in trouble...", "Clawdine Regular");
				pause(4, 4, 5);
			Text("Sure!&I'll give you an upgrade!", "Clawdine BigSmile");
				talk_turn(Oclawdine, Sclawdine_smile);
				pause(5, 5, 10);
			Text("But, it's only fair that you get the materials!", "Clawdine Fire");
				talk_turn(Oclawdine, Sclawdine_fire);
				pause(4, 4, 5);
			Text("We're at your service.", "Hoots Happy");
			Text("Let's see...", "Clawdine Regular");
			Text("A @Ribbon^@, a @Gold Hoop^@, and @3 Sticks^@ ought to do it.", "Clawdine Regular");
				pause(12, 12, 3);
				pause(28, 28, 3);
			Text("Consider it done!", "Hoots Regular");
			add_move_order();
		break;
		case "bringmerecipe":
			Text("Bring me a @Ribbon^@, a @Gold Hoop^@, and @3 Sticks^@.", "Clawdine Fire");
				talk_turn(Oclawdine, Sclawdine_fire);
				pause(21, 21, 3);
				pause(37, 37, 3);
			Text("I can't build out of thin air!", "Clawdine HmmHips");
				talk_turn(Oclawdine, Sclawdine_hips_eyebrow);
		break;
		case "charlie_clawdinequestbeforepush":
			Text("How are we supposed to wake her up?", "Charlie Confused");
		break;
	}
}

/*
This is a small cutscene that activates when the player goes up the ladder. It needs to be a cutscene so the player can do a different action on Clawdine afterward (keep reading).

Hootsworth: “Clawdine. Clawdine?”

Hootsworth tries pushing on her.

Clawdine: (Z speech bubble and snoring sound effect)

Charlie: “That’s just great! How are we supposed to wake her up?”

Charlie Interaction: “Wow, she’s really knocked out.”

If the player uses their Spark Glass, Clawdine will be highlighted as something to push. The player presses Z to push her (this is why the interaction needed to be a cutscene to avoid conflicting button inputs). Clawdine falls to the ground. Her eyes open wide and she starts rolling in mid air, landing on her feet in her action-hero pose.

Clawdine: “Hiss! I’ll rip whoever did that to shreds!”

Hootsworth nudges Charlie.

Hootsworth: “Charlie, be a good chap and go check on her.”

Charlie: “No way! I’m not going near that hissy fit!”

Clawdine looks around (questionmark bubble) and spots them. An exclamation point bubble goes over her head.

Clawdine: “Aha! So you’re behind this!”

Hootsworth: “Oh dear.”

The screen transition occurs. Hootsworth and Charlie are now on the ground with Clawdine.

Hootsworth: “And that’s why this unfortunate incident transpired.”

Clawdine: “You’re lucky cats always land on their feet!”

Hootsworth: “Again, we’re terribly sorry, Clawdin. I’m in no position to ask favors, but I need a new Spark Glass that will aid our search for Sniffles’s niece.”

Clawdine: “She’s missing?! Hmm… Can’t say I’m eager to help out after what you did. But if that egg is in trouble… Sure! I’ll give you an upgrade. But it’s only fair that you get the materials!”

Hootsworth: “We’re at your service.”

Clawdine: “Let’s see… a ribbon, a gold hoop, and three sticks ought to do it.” (the materials are in orange text)

Hootsworth: “Consider it done!”

After that interaction, Clawdine stays outside until the player exits the room. If the player interacts with her again, she will repeat her last line:

Clawdine: “Bring me a ribbon, a gold hoop, and three sticks. I can’t build out of thin air!”
