private ["_consoles"];

_consoles  = param [0, getMissionLayerEntities "DroneConsole" select 0];

	if (isNil "activeUAVs") then {

		activeUAVs = []; 
		publicVariable "activeUAVs";

	};


	_level1 = [
	
		
	
	];
	
	_level2 = [
	
		
	
	];
	
	_level3 = [
	
		
		"B_UAV_02_dynamicLoadout_F"
	
	];
	
	_level4 = [
	
		
		"B_UAV_05_F"
	
	];
	
	_level5 = [
	
		"B_T_UAV_03_dynamicLoadout_F"
	
	];



// Console Disabled Not UAV Operator
	
	{
	
		[_x,
		
		["<t color='#FFC0CB'>Cannot Spawn UAV: Must Be UAV Operator", 	
		
		{
		}
		
		, [], 98, true, true, "", "(_this distance _target < 3) and !(typeOf _this == 'B_Soldier_UAV_F') and (alive _target) and (alive _target) and (!(_target isKindOf 'man') or (count (_target nearEntities [['Man'], 5] select {typeOf _x == 'B_recon_JTAC_F'}) > 0))" ]
		
		] remoteexec ["addaction", 0, true];
	
	} forEach _consoles;
	
	
	
// Console Disabled UAV Active
	
	{
	
		[_x,
		
		["<t color='#FFC0CB'>Cannot Spawn UAV: UAV Already Active", 	
		
		{
		}
		
		, [], 98, true, true, "", "(vehicle _this == _this) and (_this distance _target < 3) and (typeOf _this == 'B_Soldier_UAV_F') and (count (activeUAVs select {alive _x}) > 0) and (alive _target) and (!(_target isKindOf 'man') or (count (_target nearEntities [['Man'], 5] select {typeOf _x == 'B_recon_JTAC_F'}) > 0))" ]
		
		] remoteexec ["addaction", 0, true];
	
	} forEach _consoles;
	
	
	
// Console Disabled UAV Active
	
	{
	
		[_x,
		
		["<t color='#FFC0CB'>Despawn Active UAV", 	
		
		{
		
			{
			
				{
				
					{deleteVehicle _x} forEach crew _x;
				
					deleteVehicle _x;
				
				} forEach activeUAVs;
			
			} remoteExec ["bis_fnc_call", 2]; 
		
		}
		
		, [], 98, true, true, "", "(vehicle _this == _this) and (_this distance _target < 3) and (typeOf _this == 'B_Soldier_UAV_F') and (count (activeUAVs select {alive _x}) > 0) and (alive _target) and (!(_target isKindOf 'man') or (count (_target nearEntities [['Man'], 5] select {typeOf _x == 'B_recon_JTAC_F'}) > 0))" ]
		
		] remoteexec ["addaction", 0, true];
	
	} forEach _consoles;



	// Level 1 Actions
			
			{

				[_x, _level1] call BEW_FNC_UAVSpawn;

			} forEach _consoles;



	// Level 2 Actions

		waitUntil {missionLevel > 1};
			
			{

				[_x, _level2] call BEW_FNC_UAVSpawn;


			} forEach _consoles;
			
			
			
	// Level 3 Actions
			
		waitUntil {missionLevel > 2};
			
			{

				[_x, _level3] call BEW_FNC_UAVSpawn;


			} forEach _consoles;



	// Level 4 Actions

		waitUntil {missionLevel > 3};	

			{

				[_x, _level4] call BEW_FNC_UAVSpawn;


			} forEach _consoles;



	// Level 5 Actions

		waitUntil {missionLevel > 4};
			
			{

				[_x, _level5] call BEW_FNC_UAVSpawn;


			} forEach _consoles;