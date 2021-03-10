
    
		private ["_input", "_return", "_allObjectives", "_military", "_industrial", "_airfield", "_port", "_town", "_tower", "_power", "_sea", "_resistance"]; 

		_input = _this select 0;

		_allObjectives = [];
		
		_military = getMissionLayerEntities "Military" select 1;
			
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
			} forEach _military;
			
		_industrial = getMissionLayerEntities "Industrial" select 1;
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
			} forEach _industrial;
			
		_airfield = getMissionLayerEntities "Airfield" select 1;
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
			} forEach _airfield;
			
		_port = getMissionLayerEntities "Port" select 1;
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
			} forEach _port;
			
		_town = getMissionLayerEntities "Town" select 1;
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
			} forEach _town;
		
		_power = getMissionLayerEntities "Power" select 1;
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
			} forEach _power;
			
		_tower = getMissionLayerEntities "Tower" select 1;
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
			} forEach _tower;
			
		_sea = getMissionLayerEntities "Sea" select 1;
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
		} forEach _sea;
			
		_resistance = getMissionLayerEntities "Resistance" select 1;
			{
			
				if (getMarkerColor _x == "") then {
				
				}else{	
				
					_allObjectives = _allObjectives + [_x];
				
				};
						
			} forEach _resistance;
		
		_return = [];
		
		{
		
			switch (_x) do {
			
				case "ALL": {_return = _return + _allObjectives};
				case "MILITARY": {_return = _return + _military};
				case "INDUSTRIAL": {_return = _return + _industrial};
				case "AIRFIELD": {_return = _return + _airfield};
				case "PORT": {_return = _return + _port};
				case "TOWN": {_return = _return + _town};
				case "POWER": {_return = _return + _power};
				case "TOWER": {_return = _return + _tower};
				case "SEA": {_return = _return + _sea};
				case "RESISTANCE": {_return = _return + _resistance};
				default {_return = _return + _allObjectives};
				
			};

		} forEach _input;

		_return;
	

