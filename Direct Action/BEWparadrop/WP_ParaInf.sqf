params["_group","_pos","",["_arg",-1]];

_radius = waypointCompletionRadius [_group,currentWaypoint _group];
if(_radius == 0)then{_radius = 300};

_group move _pos;

private _v = vehicle (leader _group);

while{alive _v && _v distance2d _pos >_radius}do{
	sleep 1;
};

[_v] execVM "BEWparadrop\infParadrop.sqf";