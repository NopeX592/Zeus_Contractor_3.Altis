private ["_centerPos", "_radius", "_veh", "_type", "_pos", "_lightType", "_lightTypes", "_lights"];
	
		_marker		=	_this select 0;
		_centerPos	=	markerPos _marker;
		_radius		=	markerSize _marker select 0;
		_lights 	= 	[];
		
		
		_lightTypes = ["PortableHelipadLight_01_white_F", "PortableHelipadLight_01_red_F", "PortableHelipadLight_01_green_F", "PortableHelipadLight_01_blue_F", "PortableHelipadLight_01_yellow_F"];
		
		{
		
			_lights = _lights + nearestObjects [_centerPos, [_x], _radius, false];
		
		} forEach _lightTypes;
		

		{
		
			_veh = _x;
			_type = typeOf _veh;
			_pos = getPos _veh; 
			
			switch (true) do {

				case (typeOf _veh == "PortableHelipadLight_01_white_F"): {
				
				_lightType = "Land_Flush_Light_yellow_F";
				
				};
				
				case (typeOf _veh == "PortableHelipadLight_01_red_F"): {
				
				_lightType = "Land_Flush_Light_red_F";
				
				};
				
				case (typeOf _veh == "PortableHelipadLight_01_green_F"): {
				
				_lightType = "Land_Flush_Light_green_F";
				
				};
				
				case (typeOf _veh == "PortableHelipadLight_01_blue_F"): {
				
				_lightType = "Land_Flush_Light_blue_F";
				
				};

				case (typeOf _veh == "PortableHelipadLight_01_yellow_F"): {
				
				_lightType = "Land_Flush_Light_yellow_F";
				
				};
				
			};

			deleteVehicle _veh;

			createVehicle [_lightType, _pos, [], 0, "CAN_COLLIDE"];

		} forEach _lights;
		
