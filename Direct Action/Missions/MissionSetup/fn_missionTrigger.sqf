	private ["_objectivePos", "_radius", "_markerType", "_iconMarkerName", "_randomMission", "_markerColor"];			
	
	_objectiveMarker = _this select 0;
	_radius = _this select 1;
	_randomMissionArray = _this select 2;
	_objectivePos = markerPos _objectiveMarker;
		
	_randomMission = _randomMissionArray select 0;
	_origMarkerType = _randomMissionArray select 1;	
		_markerType = [_origMarkerType] call BEW_FNC_TranslateClassNames;
	_missionTypeText = _randomMissionArray select 2;	
	_markerColor = _randomMissionArray select 3;	
	_message = _randomMissionArray select 4;
	_markerText = markerText _objectiveMarker;
	
	if (isNil "BEW_v_AllObjectiveTriggerMarkers") then {BEW_v_AllObjectiveTriggerMarkers = []}; 

	
	// Trigger Area Marker
	
		_areaMarkerName = format ["%1_triggerArea", _objectiveMarker];
	
		_triggerAreaMarker = createMarker [_areaMarkerName, _objectivePos];
		_triggerAreaMarker setMarkerShape "ELLIPSE";
		_triggerAreaMarker setMarkerBrush "FDiagonal";
		_triggerAreaMarker setMarkerSize [_radius, _radius];
		_triggerAreaMarker setMarkerColor _markerColor;
		_triggerAreaMarker setMarkerAlpha 0;


	if (_origMarkerType == OPF_MarkerIcon) then {

		waitUntil {((({(alive _x) and (_x distance2D _objectivePos < _radius * 4) and !(vehicle _x isKindOf 'air') and (isNull (isVehicleCargo vehicle _x))} count allPlayers) > 0) or (_objectivePos distance markerPos "safeZone_1" < 2500)) and !(objectiveMissionActive)};	

	};

	// Name Marker Icon
		
		_iconMarkerName = format ["%1_objectiveIcon", _objectiveMarker];
	
		
	// Create Icon Marker
		
		_playAreaIcon = createMarker [_iconMarkerName, _objectivePos];
		_playAreaIcon setMarkerType _markerType;
		if (_origMarkerType == OPF_MarkerIcon) then {_missionTypeText = format ["%1", markerText _objectiveMarker]};
		if !(_origMarkerType == OPF_MarkerIcon) then {_playAreaIcon setMarkerColor _markerColor};
		_playAreaIcon setMarkerText _missionTypeText;
		_playAreaIcon setMarkerSize [0.5, 0.5];
		
		if (_origMarkerType == OPF_MarkerIcon) then {
		
			_playAreaIcon setMarkerAlpha 1;
		
		}else{
		
			_playAreaIcon setMarkerAlpha 0;
		
		};
		
		BEW_v_AllObjectiveTriggerMarkers = BEW_v_AllObjectiveTriggerMarkers + [_playAreaIcon];


waitUntil {markerAlpha _playAreaIcon > 0};

		BEW_v_AllObjectiveTriggerMarkers = BEW_v_AllObjectiveTriggerMarkers - [_playAreaIcon];
		
		_triggerAreaMarker setMarkerAlpha 0.5;		
	
	
	// Create Trigger To Flip Marker Alpha
	
		call compile format ["
		
			_iconAlphaTrigger = createTrigger [""EmptyDetector"", _objectivePos];
			_iconAlphaTrigger setTriggerArea [1, 1, 0, false, 2];
			_iconAlphaTrigger setTriggerActivation [""ANY"", ""PRESENT"", TRUE];
			_iconAlphaTrigger setTriggerStatements [""(objectiveMissionActive)"", ""'%1' setMarkerAlpha 0"", ""'%1' setMarkerAlpha 1""];
					
			_areaAlphaTrigger = createTrigger [""EmptyDetector"", _objectivePos];
			_areaAlphaTrigger setTriggerArea [1, 1, 0, false, 2];
			_areaAlphaTrigger setTriggerActivation [""ANY"", ""PRESENT"", TRUE];
			_areaAlphaTrigger setTriggerStatements [""(objectiveMissionActive)"", ""'%2' setMarkerAlpha 0"", ""'%2' setMarkerAlpha 1""];
			
		", _iconMarkerName, _areaMarkerName];
		
	
	// Send Message
		
		_message = format [_message, _markerText];
				
		[HQ , _message] remoteExec ["sideChat", 0];
	
	waitUntil {(({(alive _x) and (_x distance2D _objectivePos < _radius) and !(vehicle _x isKindOf 'air') and (isNull (isVehicleCargo vehicle _x))} count allPlayers) > 0) and !(objectiveMissionActive)};	
	
	
	// Delete Trigger Area
	
	
	deleteMarker _triggerAreaMarker;
	
	
	// Spawn Mission
		
		[_objectiveMarker, _iconMarkerName] spawn _randomMission;
		
		

		
		
