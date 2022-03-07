waitUntil {alive player};

_moveTimer = _this select 0;
_markerRadius = _this select 1;

_RespMarker = switch (side (group player)) do 
{
	case WEST: 
	{
		"respawn_west_leader_auto";
	};
	case EAST: 
	{
		"respawn_east_leader_auto";
	};
	case INDEPENDENT: 
	{
		"respawn_guerrila_leader_auto";
	};
	case CIVILIAN: 
	{
		"respawn_civilian_leader_auto";
	};
	default {
		if (true) exitWith {};
	};
};

while {true} do 
{
	if !(isNil _RespMarker) then {deleteMarkerLocal _RespMarker;};
	_dist = random _MarkerRadius;
	_dir = random 360;
	_grpLeader = leader (group (vehicle player));
	_respawnMarker = createMarkerLocal [_RespMarker, position player];
	_respPos1 = [getpos _grpLeader, _dist, _dir] call BIS_fnc_relPos;
	_RespMarker setMarkerPosLocal (_respPos1);
	_RespMarker setMarkerTextLocal "重生至小队长位置";
	sleep _moveTimer;
};
