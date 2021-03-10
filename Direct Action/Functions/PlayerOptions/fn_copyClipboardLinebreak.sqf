 
	_data = _this select 0;
	
	
	_br = toString [13,10]; 

	_outputString = "[" + _br; 
	 
	{ 
	 
		
		 
		 _entry = format ["""%1""", _x]; 
		 
		 _outputString = _outputString + _br + _entry; 
		 
		
		_count = count _data;
		_lastPlace = _count - 1;
		_last = _data select _lastPlace;

		if !(_x == _last) then {
		 
		 _outputString = _outputString + ","; 
		
		}else{
		
		 _outputString = _outputString + _br + _br + "];"; 
		
		};
		
	} forEach _data; 
	 
	systemchat _outputString;

	copyToClipboard  _outputString;
	
	