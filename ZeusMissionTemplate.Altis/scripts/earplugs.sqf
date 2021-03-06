if (isClass(configFile >> "CfgPatches" >> "ace_hearing")) exitWith {}; // Do not active if ACE earplug is present

earplugs_activated = false;

earplugs_insert =
{
    1 fadeSound 0.3;
    "已戴上耳塞" call CBA_fnc_notify;
    earplugs_activated = true;
};

earplugs_takeout =
{
    1 fadeSound 1;
    "已取下耳塞" call CBA_fnc_notify;
    earplugs_activated = false;
};

earplugs_add_actions =
{
    waitUntil {(!isNull player) && (alive player)};
    
    player addAction [
    	"<img image='\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa'/><t color='#6199FF'>[戴上耳塞]",
    	earplugs_insert,
    	nil,
    	6,
    	false,
    	true,
    	"",
    	"_originalTarget isEqualTo _this && !earplugs_activated",
    	-1,
    	false
	];

	player addAction [
    	"<img image='\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa'/><t color='#6199FF'>[取下耳塞]",
    	earplugs_takeout,
    	nil,
    	6,
    	false,
    	true,
    	"",
    	"_originalTarget isEqualTo _this && earplugs_activated",
    	-1,
    	false
	];
};

[] call earplugs_add_actions;

player addEventHandler ["Respawn", {
	[] call earplugs_add_actions;
	if (earplugs_activated) then {
		[] call earplugs_insert;
	} else {
		[] call earplugs_takeout;
	};
}];
