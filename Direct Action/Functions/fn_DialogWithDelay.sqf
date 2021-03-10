
		
		_caller	= param [0];
			_callerName = name _caller;
		
		_dialogue = param [1];
		_size = param [2, 1.5];
		_color = param [3, '#ffffff']; 
				
		call compile format ["
		
			_dialogue = ""<t size='%1' color='%2'>%3</t>"";
		
		", _size, _color, _dialogue];
		
		[_callerName, _dialogue] spawn BIS_fnc_showSubtitle;
		
		_sleepTime = [count _dialogue] call BEW_FNC_calculateReadDelayTime;
		
		playSound3D ["a3\3DEN\Data\Sound\CfgSound\notificationDefault.wss", player];
			
		_sleepTime
			

