_pos = testSub modelToWorld [0, 30 ,0];

for "_i" from 0 to 8 do {

scriptedCharge = "DemoCharge_Remote_Ammo_Scripted" createVehicle (_pos);

_pos = scriptedCharge modelToWorld [0, 10 ,0];

scriptedCharge setDamage 1


};
