if (!isDedicated) then {
 waitUntil {!isNull player && {time > 0}};
player addAction [
	"Flip Vehicle", 
	"functions\FlipVehicle\fn_FlipAction.sqf", 
	[], 
	0, 
	false, 
	true, 
	"", 
	"_this == (vehicle _target) && {(count nearestObjects [_target, ['landVehicle'], 5]) > 0 && {(vectorUp cursorTarget) select 2 < 0}}"
];
Player AddEventHandler ["Respawn", {
	(_this select 0) addAction [
		"Flip Vehicle", 
		"functions\FlipVehicle\fn_FlipAction.sqf", 
		[], 
		0, 
		false, 
		true, 
		"", 
		"_this == (vehicle _target) && {(count nearestObjects [_target, ['landVehicle'], 5]) > 0 && {(vectorUp cursorTarget) select 2 < 0}}"
	];
}];
};