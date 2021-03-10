/*

_centerPos = _this select 0;
_radius = _this select 1; 

_allBuildings = nearestObjects [_centerPos, ["House"], _radius];

_buildingsWithPositions = _allBuildings select {count ([_x] call BIS_fnc_buildingPositions) > 1};


_allPositions = [];

{

	_positions = [_x] call BIS_fnc_buildingPositions;
	
	_allPositions append _positions;

} forEach _buildingsWithPositions;


		_weapons = ["ALLWEAPONS"] call BEW_FNC_LootList;
		_optics = ["OPTIC"] call BEW_FNC_LootList;
		_attachments = ["ATTACHMENTS"] call BEW_FNC_LootList;
		_miscItems = ["MISC"] call BEW_FNC_LootList;
		_launchers = ["LAUNCHER"] call BEW_FNC_LootList;
		_uniforms = ["UNIFORM"] call BEW_FNC_LootList;
		_vests = ["VEST"] call BEW_FNC_LootList;
		_headgears = ["HEADGEAR"] call BEW_FNC_LootList;
		
		
		_globalFrequency = 50;
		_weaponFrequency = 20;
		_LauncherFrequency = 5;
		_OpticFrequency = 20;
		_AttachmentFrequency = 20;
		_MiscFrequency = 10;
		_uniformFrequency = 20;
		_vestFrequency = 10;
		_headgearFrequency = 20;
		
		
{

			
		_targetPos = _x;


		_weapon 			= _weapons call BIS_fnc_selectRandom;
		_magazines 			= getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		_magazine 			= _magazines call bis_fnc_selectRandom;
			
		_optic 				= _optics call BIS_fnc_selectRandom;
		_attachment			= _attachments call BIS_fnc_selectRandom;
		_miscItem 			= _miscItems call BIS_fnc_selectRandom;
		_uniform 			= _uniforms call BIS_fnc_selectRandom;
		_vest 				= _vests call BIS_fnc_selectRandom;
		_headgear 			= _headgears call BIS_fnc_selectRandom;
	
		
		_launcherType 		= _launchers call BIS_fnc_selectRandom;
		_launcherMagazines 	= getArray (configFile / "CfgWeapons" / _launcherType / "magazines");
		_launcherMagazine 	= _launcherMagazines call bis_fnc_selectRandom;

		
		_lootWeaponHolder = createvehicle [ "weaponholdersimulated", _targetPos , [], 0, "can_Collide"];
		_lootWeaponHolder setDir random 360;

		if (_globalFrequency > random 100) then {

			if (_weaponFrequency > random 100) then {
			
				_lootWeaponHolder addWeaponWithAttachmentsCargo [[_weapon, "", "", "", [], [], ""], 1];
				_lootWeaponHolder addMagazineCargoGlobal [_magazine, random 3 + 1];
			
			};
			
			
			if (_LauncherFrequency > random 100) then {
			
				_lootWeaponHolder addWeaponWithAttachmentsCargo [[_launcherType, "", "", "", [], [], ""], 1];
				_lootWeaponHolder addMagazineCargoGlobal [_launcherMagazine, random 1 + 1];
			
			};
			
			
			if (_OpticFrequency > random 100) then {
			
				_lootWeaponHolder addItemCargoGlobal [_optic, 1];
			
			};
				
			if (_AttachmentFrequency > random 100) then {
				
				_lootWeaponHolder addItemCargoGlobal [_attachment, 1];
			
			};
			
			if (_MiscFrequency > random 100) then {
				
				_lootWeaponHolder addItemCargoGlobal [_miscItem, 1];
			
			};
			
			if (_UniformFrequency > random 100) then {
				
				_lootWeaponHolder addItemCargoGlobal [_uniform, 1];
			
			};
			
			if (_vestFrequency > random 100) then {
				
				_lootWeaponHolder addItemCargoGlobal [_vest, 1];
			
			};
			
			if (_headgearFrequency > random 100) then {
				
				_lootWeaponHolder addItemCargoGlobal [_headgear, 1];
			
			};
			
		};
	
	
} forEach _allPositions;

*/