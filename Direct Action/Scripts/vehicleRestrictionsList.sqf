	private ["_obj"];
	
	_obj 	=	_this select 0;

		[_obj, [["air","B_Helipilot_F"], ["tank","B_crew_F"], ["Wheeled_APC_F","B_crew_F"]]] execVM "scripts\b2_checkPilot.sqf"; 