// 在ACE环境下，向物件添加如下代码，然后使用ACE互动，选择“伞降”，即可跳伞
// _action = ["custom_action_parajump", "伞降", "", {[] spawn custom_fnc_parajump;}, {true}] call ace_interact_menu_fnc_createAction;
// [this, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// 在原版环境下，向物件添加如下代码，然后使用互动菜单，选择“伞降”，即可跳伞
// this addAction ["伞降", custom_action_parajump];

// Reference: KP-Liberation\Missionframework\scripts\client\spawn\do_halo.sqf

private _dialog = createDialog "liberation_halo";
private _backpackcontents = [];

dojump = 0;
halo_position = getpos player;

parajump_marker = createMarkerLocal ["parajump_marker", halo_position];
parajump_marker setMarkerColorLocal "colorGreen";
parajump_marker setMarkerShapeLocal "ICON";
parajump_marker setMarkerTypeLocal "mil_circle";

["halo_map_event", "onMapSingleClick", {halo_position = _pos; parajump_marker setMarkerPosLocal _pos;}] call BIS_fnc_addStackedEventHandler;

waitUntil {dialog};
while {dialog && alive player && dojump == 0} do {
    parajump_marker setMarkerPosLocal halo_position;
    sleep 0.1;
};

if (dialog) then {
    closeDialog 0;
    sleep 0.1;
};

deleteMarkerLocal parajump_marker;

["halo_map_event", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

if (dojump > 0) then {
    halo_position = halo_position getPos [random 250, random 360];
    halo_position = [halo_position select 0, halo_position select 1, 1000 + (random [-500, 0, 500])];

    cutRsc ["fasttravel", "PLAIN", 1];
    playSound "parasound";

    private _backpack = backpack player;
    if (_backpack != "" && _backpack != "B_Parachute") then {
        _backpackcontents = backpackItems player;
        removeBackpack player;
    };
    
    sleep 2.5;
    player addBackpack "B_Parachute";
    player setpos halo_position;

    sleep 5;
    waitUntil {!alive player || isTouchingGround player};
    if (_backpack != "" && _backpack != "B_Parachute") then {
        sleep 2;
        player addBackpack _backpack;
        clearAllItemsFromBackpack player;
        {player addItemToBackpack _x;} foreach _backpackcontents;
    } else {
        removeBackpack player;
    };
};
