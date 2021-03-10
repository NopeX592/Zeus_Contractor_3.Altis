

	private ["_sideStrs", "_sideStr", "_factions", "_faction", "_archetypes", "_archetype", "_groupTypes", "_groupType", "_side", "_group"];

	_pos			=	param [0];

	_infantryArray 	=	param [1];
		_side		=	_infantryArray select 0;
		_faction	=	_infantryArray select 1;
		_archetype	=	_infantryArray select 2;
		
		_sideStr = switch (_side) do {
		
			case west:	{"WEST"};
			case east:	{"EAST"};
			case guer:	{"INDEP"};
			case civ:	{"EMPTY"};

		};

	_groupTypes 	= 	param [2, []];

	if (count _groupTypes < 1) then {
	
		_groupTypes = ("true" configClasses (configFile >> "CfgGroups" >> _sideStr >> _faction >> _archetype) apply {configname _x});
	
	};
	
	_groupType 		=	_groupTypes call BIS_fnc_selectRandom; 

	_group = [_pos, _side, (configFile >> "CfgGroups" >> _sideStr >> _faction >> _archetype >> _groupType),[],[],[],[],[-1,1],random 360,true] call BIS_fnc_spawnGroup;	
	
	_group;

