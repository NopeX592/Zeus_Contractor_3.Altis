

	_chars = _this select 0;;

	_wpm = 400;  
    _word_length = 5;  
    _words = _chars / _word_length;
    _words_time = ((_words / _wpm) *60);

    _delay = 1.5; 
    _bonus = 1; 

    _delayTime = _delay + _words_time + _bonus;
	
	_delayTime;
	
