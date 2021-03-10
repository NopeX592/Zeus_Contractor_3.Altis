private ["_selectedObjective", "_playAreaIcon"];

_selectedObjective = param [0];
_playAreaIcon = param [1];

_objectivePos = markerPos _selectedObjective;
_playAreaSize = markerSize _selectedObjective select 0;


