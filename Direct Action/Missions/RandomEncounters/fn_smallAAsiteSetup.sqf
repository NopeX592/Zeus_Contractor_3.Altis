	private ["_centerPos", "_spawnMarkersTemp", "_spawnMarker", "_sitesToSpawn"];
	
	_spawnMarkers = BEW_v_smallAASiteMarkers;

	while {true} do {
	
		_spawnMarkersTemp = _spawnMarkers ;
		
			_sitesToSpawn = missionLevel;
			_sitesToSpawn = round _sitesToSpawn;
			
			if (_sitesToSpawn > 6) then {_sitesToSpawn = 6};

			for "_i" from 1 to _sitesToSpawn do {

				_spawnMarker = _spawnMarkersTemp call BIS_FNC_SelectRandom;
				_spawnMarkersTemp =  _spawnMarkersTemp - [_spawnMarker];
				
				_centerPos = markerPos _spawnMarker;

				[_centerPos] spawn BEW_FNC_smallAAsite;
	
				sleep 1;
				
			};
		
		_currentMissionLevel = missionLevel;
	
		waitUntil {!(_currentMissionLevel == missionLevel)};
		
		sleep 5;
			
	};

