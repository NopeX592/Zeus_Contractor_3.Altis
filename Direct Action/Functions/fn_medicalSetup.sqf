private ["_obj", "_objs", "_baseObjs"];

_objs = getMissionLayerEntities "Medical" select 0; 
_baseObjs = getMissionLayerEntities "BaseMedical" select 0; 

{

	_obj = _x;


	_varName = [_obj, "Medical_"] call bis_fnc_objectvar;
	_obj setvehiclevarname _varName;


	call compile format ["
	

		%1_Medical_Marker = createMarker [""%1_Medical_Marker"", getPos %1];
		%1_Medical_Marker setMarkerType ""b_med"";
		%1_Medical_Marker setMarkerSize [0.5, 0.5];
		%1_Medical_Marker setMarkerColor ""colorRed"";
		%1_Medical_Marker setMarkerAlpha 0;
		
		_trg = createTrigger [""EmptyDetector"", getPos %1];
		_trg setTriggerArea [100, 100, 100, false, 2];
		_trg setTriggerActivation [""WEST"", ""PRESENT"", false];
		_trg setTriggerStatements [""(this) && (vehicle player in thisList)"", ""%1_Medical_Marker setMarkerAlpha 1;"", """"];

	", _obj];


} forEach _objs;




{

	_obj = _x;

	call compile format ["
	
		%1_Medical_Marker setMarkerAlpha 1;
		
	", _obj];

} forEach _baseObjs;
