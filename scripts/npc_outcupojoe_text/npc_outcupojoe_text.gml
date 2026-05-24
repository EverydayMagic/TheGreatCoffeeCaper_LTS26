function npc_outcupojoe_text(_text_id){
	
	switch (_text_id)
	{
	
		#region ducks
		
			case "whatwillbabydrink":
				Text("Cup O' Joe? Closed!?");
					talk_turn(Omotherduck, Smotherduck_freakout);
					pause(11, 11, 5);
				Text("Well! Just!");
					pause(5, 5, 5);
				Text("What are my little DARLINGS going to drink now?! Huh?!");
					pause(27, 27, 2);
					pause(48, 48, 5);
			break;
			
			case "needmacawfee":
				Text("Mama! Mama!&I need ma cawfee!");
					pause(5, 5, 2);
					pause(11, 11, 5);
			break;
			
			case "fowestdwink":
				Text("Mama! Mama!&Where in da fowest is my dwink!?");
					pause(5, 5, 2);
					pause(11, 11, 5);
			break;
			
			case "earlgrey":
				Text("Mother dearest.&I require my Earl Grey at this fine hour...");
					pause(15, 15, 10);
			break;
		
		#endregion
		
		#region harmony
			
			case "wahclosed":
				Text("WAAAAH!!!")
					text_shake(0, 8);
				Text("Hoot!&What's with all the sniffling?", "Hoots Regular");
					pause(5, 5, 5);
				Text("Cup O' Joe&-sniff-&it's closed...");
					pause(10, 10, 5);
					pause(18, 18, 5);
				Text("But... It closes every night.", "Hoots Squint");
					pause(3, 5, 2);
					pause(6, 6, 5);
				Text("Yeah, but today w-when I knocked on the door today-");
					pause(5, 5, 5);
					pause(9, 9, 2);
					pause(17, 17, 2);
				Text("the - the - the door...");
					pause(5, 5, 5);
					pause(11, 11, 5);
				Text("was STILL CLOOOOOOSSEED!!!!&WAAAAH!!!");
					pause(3, 3, 5);
					pause(9, 9, 5);
					pause(27, 27, 5);
					text_shake(3, 36);
			break;
			
		#endregion
		
		#region fox
			
			case "foxkeepscool":
				Text("Say, how come you're not panicking?", "Hoots Curious");
					pause(4, 4, 5);
				Text("I always keeps it cool...&Ain't noth'n gonna melt my icey exteriah.");
					pause(25, 25, 10);
				Text("Keeping cool, eh?", "Hoots Regular");
					pause(13, 13, 5);
				Text("You're the only one who happens to be calm around here.", "Hoots Squint");
				Text("Awfully suspicious, isn't it?", "Hoots Curious");
					pause(19, 19, 5);
				Text("Yooz ask'n too many questions, bird...&Why dontcha beat it?");
					pause(38, 38, 10);
				Text("What the!&-oooh! I'll beat it all right!", "Hoots Yell");
					pause(9, 9, 10);
					pause(16, 16, 10);
				Text("Hey, cool it, birdy!&Cool it!");
					pause(4, 4, 5);
					pause(20, 20, 10);
				Text("Yooz don't wanna go upset'n everybody even more, do yaz?");
					pause(48, 48, 5);
				Text("I- I guess you're right.", "Hoots Shocked");
					pause(2, 2, 5);
				Text("I did lose my cool there for a second...", "Hoots Wide-Eyed");
				Text("Yooz tell'n me!");
				Text("Now, if'n yooz don't mind, I gots tah get back tah keep'n it cool.");
					pause(4, 4, 5);
					pause(26, 26, 10);
				
			break;
			
			case "alwayskeepscool":
				Text("I always keeps it cool...");
			break;
			
		#endregion
		
		#region business fish
		
			case "businessfishlate":
				Text("Hey! You there!&In the funny looking hat!");
					talk_turn(Obusinessfish, Sbusfish_idle);
					pause(4, 4, 5);
					pause(15, 15, 5);
				Text("I beg your pardon?!", "Hoots Shocked");
				Text("What time is it???");
					talk_turn(Obusinessfish, Sbusfish_idle, 0);
				Text("It's mid-morning.&Why-", "Hoots Shocked");
					pause(17, 17, 10);
				Text("I'M LATE! I'M LATE FOR MY INTERVIEW!!");
					talk_turn(Obusinessfish, Sbusfish_shocked);
					pause(9, 9, 5);
				Text("FIRST MARTHA LEAVES ME!&NOW I'M LATE!!!");
					pause(23, 23, 5);
				Text("Er- spinning in circles again might help?", "Hoots Curious");
					pause(3, 3, 5);
				Text("SURE WHY NOT?! I'M A LOST CAUSE ANYWAY! HAHAHAHAHA!!");
					talk_turn(Obusinessfish, Sbusfish_idle);
					pause(14, 14, 5);
					pause(39, 39, 5);
					text_shake(39, 51);
				Text("...Right then", "Hoots Wide-Eyed");
					pause(0, 2, 5);
				Text("well... ahem-&I'm leaving now.", "Hoots Wide-Eyed");
					pause(4, 6, 2);
					pause(7, 7, 5);
					pause(13, 13, 5);
			break;
		
		#endregion
		
		#region jitters
			
			case "jittersjoeclosed":
				Text("Jitters?...&Are you...", "Hoots Curious");
					pause(8, 10, 5);
					pause(11, 11, 10);
					pause(19, 21, 5);
				Text("oh no...", "Hoots Wide-Eyed");
				Text("cupojoeclosednono&joeclosedopenjoe&closedfldjdkfsijf", "Jitters Drool");
					text_shake(0, 51);
			break;
			
		#endregion
		
		#region sniffles
			
			case "snifflesoutshop":
				Text("Detective!&Thank goodness you're here!", "Sniffles Happy");
					pause(10, 10, 5);
				Text("The shop is closed and....", "Sniffles Regular");
				Text("and...", "Sniffles Uh");
					pause(3, 5, 5);
				Text("I JUST DON'T KNOW WHAT TO DO!", "Sniffles CrazyYell");
				Text("Me? I'm fine detective...&real fine........", "Sniffles Crazy");
					pause(3, 3, 10);
					pause(25, 25, 10);
			break;
			
		#endregion
		
		#region hedgehog
			
			case "hedgehogpanic":
				Text("Oooo goodness me!&All this panicking is making me panic!");
					pause(17, 17, 10);
				Text("What if I lost something?&Where's my sock!?");
					pause(25, 25, 5);
				Text("Lefty?&Say something, Lefty!");
					talk_turn(Ohedgehog, Shedgehog_idle);
					pause(6, 6, 5);
			break;
			
		#endregion
	}
}