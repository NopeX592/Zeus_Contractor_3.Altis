params["_group","_pos","",["_arg",-1]];

_radius = waypointCompletionRadius [_group,currentWaypoint _group];
if(_radius == 0)then{_radius = 300};

_group move _pos;

private _veh = vehicle (leader _group);

while{alive _veh && _veh distance2d _pos >_radius}do{
	sleep 1;
};

_veh setVehicleCargo objNull;

{

	[[_x, _veh], {

		_passenger = _this select 0;
		_veh = _this select 1;
	
		if (vehicle _passenger == _veh) then {
	

			_passenger action ["Eject", _veh];
			unassignVehicle _passenger;
			moveOut _passenger;
			_passenger leaveVehicle _veh;
			
			[_passenger] execVM "BEWParadrop\BEW_FNC_ParadropLoadout.sqf";
			
		};		

	}] remoteExec ["bis_fnc_call", _x]; 
		
} forEach ([] call BEW_FNC_AllUnitsInGroupsWithPlayers);	