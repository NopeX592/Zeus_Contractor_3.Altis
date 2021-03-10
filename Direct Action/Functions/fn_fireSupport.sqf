	_fireSupportData 				=	[];
	
	_heMortars						= ["HE Mortar", ["B_Soldier_TL_F"], 100, 1000, 30, 180, 'Sh_82mm_AMOS', 5];
	_smokeMortars					= ["Smoke Mortar", ["B_Soldier_TL_F"], 100, 1000, 50, 180, 'Smoke_120mm_AMOS_White', 10];
		
	
switch (typeOf player) do {
	
    case "B_Soldier_TL_F": {
	
		_fireSupportData append [_smokeMortars];
	
	};
	
    case "B_recon_JTAC_F": {
	
		_fireSupportData append [_heMortars];
		_fireSupportData append [_smokeMortars];
	
	};
	
    default {};
	
};
	
	
{
	
	_data = _x;
	
		BEW_v_fireSupportTypeText		=	(_data select 0);
		BEW_v_fireSupportAssistantTypes	= 	(_data select 1);
		BEW_v_fireSupportMinRadius 		=	(_data select 2);
		BEW_v_fireSupportMaxRadius		=	(_data select 3);
		BEW_v_fireSupportSpread			=	(_data select 4);
		BEW_v_fireSupportBarrageDelay 	= 	(_data select 5);
		BEW_v_fireSupportRoundType 		=	(_data select 6);
		BEW_v_fireSupportRoundNumber	=	(_data select 7);
	
	fireMissionCooldown = false;
	
	
	_actionPassThruArray = [BEW_v_fireSupportTypeText, BEW_v_fireSupportAssistantTypes, BEW_v_fireSupportMinRadius, BEW_v_fireSupportMaxRadius, BEW_v_fireSupportSpread, BEW_v_fireSupportBarrageDelay, BEW_v_fireSupportRoundType, BEW_v_fireSupportRoundNumber];
	
	// Main Fire Support Action
	
		_actionText = format ["<t color='#FFC0CB'>Call %1 Barrage", BEW_v_fireSupportTypeText];
	
		player addaction [_actionText, 	
		
		{
			
			_fireSupportTypeText		=	((_this select 3) select 0);
			_fireSupportMinRadius 		=	((_this select 3) select 1);
			_fireSupportAssistantTypes	=	((_this select 3) select 2);
			_fireSupportMaxRadius		=	((_this select 3) select 3);
			_fireSupportSpread			=	((_this select 3) select 4);
			_fireSupportBarrageDelay 	= 	((_this select 3) select 5);
			_fireSupportRoundType 		=	((_this select 3) select 6);
			_fireSupportRoundNumber		=	((_this select 3) select 7);
		
			if (fireMissionCooldown) then {
			
				HQ sidechat 'Fire mission not available at this time.';
			
			}else{
		
				private ["_pos"];
			
				if (visibleMap) then {
				
					_pos =  screenToWorld getMousePosition;
					
				}else{
				
					_pos = screenToWorld [0.5,0.5];
				
				};
				
			
				_arrow = 'Sign_Arrow_Large_F' createVehicle _pos;
				_arrow setDir getDir player;
				_arrow allowDamage false;
				
				
				_fireSupportAreaMarker = createMarker ['fireSupportArea', _pos];
				_fireSupportAreaMarker setMarkerShape 'ELLIPSE';
				_fireSupportAreaMarker setMarkerSize [(_fireSupportSpread) * 2, (_fireSupportSpread) * 2];
				_fireSupportAreaMarker setMarkerColor 'colorRED';
				_fireSupportAreaMarker setMarkerAlpha 1;
							
				fireMissionCooldown = true;
				
				BEW_v_fireSupportCooldownTimer = [_fireSupportBarrageDelay + 30, false] call BIS_fnc_countdown;

				_message = format ["Fire mission received. %1 %2 rounds out, %3m spread. Impact in 30 seconds.", _fireSupportRoundNumber, _fireSupportTypeText, _fireSupportSpread];
				
				[HQ , _message] remoteExec ['sideChat', 0];
				
				sleep 25;

				[HQ , 'Impact in 5 seconds.'] remoteExec ['sideChat', 0];
				
				sleep 5;
				
				[_pos, _fireSupportRoundType, _fireSupportSpread, _fireSupportRoundNumber, 2] spawn BIS_fnc_fireSupportVirtual;
								
				_message = format ["Spash. Fire support will be back online in %1 seconds. Out.", _fireSupportBarrageDelay];
				
				[HQ , _message] remoteExec ['sideChat', 0];
				
				deleteVehicle _arrow;
				deleteMarker  _fireSupportAreaMarker;
				
				waitUntil {([0] call BIS_fnc_countdown) == 0};
				
				[HQ , "Fire support is back online. Ready for fire mission."] remoteExec ['sideChat', 0];
				
				fireMissionCooldown = false;
			};
		
		}
		
		, _actionPassThruArray, 98, true, true, "", "!(fireMissionCooldown) and ((currentWeapon player isKindOf ['Binocular', configFile >> 'CfgWeapons']) and (cameraView == 'Gunner')) and (_target distance screenToWorld [0.5,0.5] >= BEW_v_fireSupportMinRadius) and (_target distance screenToWorld [0.5,0.5] <= BEW_v_fireSupportMaxRadius) and (count (_target nearEntities [['Man'], 10] select {leader group _target == _x}) > 0)" ];
	
	
	
	// Fire Support Offline
	
		_actionText = format ["<t color='#FFC0CB'>Cannot Call %1 Barrage: Fire Support Currently Offline", BEW_v_fireSupportTypeText];
	
		player addaction [_actionText, 	
		
		{
		
			_timeRemaining 	= 	([0] call BIS_fnc_countdown);
			_timeRemaining 	=	[_timeRemaining, 0] call BIS_fnc_cutDecimals;
			_message		= 	format ["Fire support is currently offline. Please wait %1 seconds.", _timeRemaining]; 
			HQ sidechat _message;

		}
		
		, _actionPassThruArray, 98, true, true, "", "(fireMissionCooldown) and ((currentWeapon player isKindOf ['Binocular', configFile >> 'CfgWeapons']) and (cameraView == 'Gunner'))" ];
	
	
	
	
	// Danger Close Action
	
		_actionText = format ["<t color='#FFC0CB'>Cannot Call %1 Barrage: Danger Close", BEW_v_fireSupportTypeText];
	
		player addaction [_actionText, 	
		
		{
		
			HQ sidechat "Can't call fire support at that location. You are too close to the target area.";
		
		}
		
		, [], 98, true, true, "", "!(fireMissionCooldown) and ((currentWeapon player isKindOf ['Binocular', configFile >> 'CfgWeapons']) and (cameraView == 'Gunner')) and (_target distance screenToWorld [0.5,0.5] < BEW_v_fireSupportMinRadius) and (count (_target nearEntities [['Man'], 10] select {leader group _target == _x}) > 0)" ];
		
		
		
	// Out Of Range Action
	
		_actionText = format ["<t color='#FFC0CB'>Cannot Call %1 Barrage: Out Of Range", BEW_v_fireSupportTypeText];
		
		player addaction [_actionText, 	
		
		{
		
			HQ sidechat "Can't call fire support at that location. The target is out of range.";
		
		}
		
		, [], 98, true, true, "", "!(fireMissionCooldown) and ((currentWeapon player isKindOf ['Binocular', configFile >> 'CfgWeapons']) and (cameraView == 'Gunner')) and (_target distance screenToWorld [0.5,0.5] > BEW_v_fireSupportMaxRadius) and (count (_target nearEntities [['Man'], 10] select {leader group _target == _x}) > 0)" ];
		
		
		sleep 1;
		
} forEach _fireSupportData;