_upload_status = 0;
while {_upload_status != 100} do {
	_upload_status = _upload_status + 5;
	hint str format ["Uploading Data.\n %1%/100%",str _upload_status];
	sleep 9;
};