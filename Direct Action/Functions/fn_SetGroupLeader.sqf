
	_target = _this select 0;

	_group = group _target; 
	_newLeader = _target; 
	 
	[_group,_newLeader] remoteExec ["selectLeader",groupOwner _group];
