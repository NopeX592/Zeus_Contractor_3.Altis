	private ["_heliPads", "_Hangars", "_sheds"];

	_centerPos = param [0];
	_radius = param [1, 200];
	_findHeliPads = param [2, false];
	_findHangars = param [3, false];
	_findSheds = param [4, false];


	_allObjects = [];
	_heliPads = [];
	_Hangars = [];
	_sheds = [];
	

	_heliPadTypes = [

		"Land_HelipadCircle_F",
		"Land_HelipadCivil_F",
		"Land_HelipadEmpty_F",
		"Land_HelipadRescue_F",
		"Land_HelipadSquare_F"

	];


	_hangarTypes = [

		"Land_Hangar_F",
		"Land_TentHangar_V1_F",
		"Land_Airport_01_hangar_F"

	];


	_shedTypes = [

		"Land_Shed_Big_F",
		"Land_SM_01_shelter_wide_F"

	];


	// Find Helipads 

		if (_findHeliPads) then {
		
			_heliPads = nearestObjects [_centerPos, _heliPadTypes, _radius];
			_allObjects = _allObjects + _heliPads;

		};
		
		
	// Find Hangars

		if (_findHangars) then {
		
			_Hangars = nearestObjects [_centerPos, _hangarTypes, _radius];
			_allObjects = _allObjects + _Hangars;

		};
		
		
	// Find Sheds

		if (_findSheds) then {
		
			_sheds = nearestObjects [_centerPos, _shedTypes, _radius];
			_allObjects = _allObjects + _sheds;

		};
		
		
	_outputArray = [_heliPads, _Hangars, _sheds];

	_outputArray