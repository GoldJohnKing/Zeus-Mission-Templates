// 客户端初始化逻辑，仅在客户端任务初始化时执行

[{!isNull player}, { // 等待玩家角色初始化完成

    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // 小队菜单 - 客户端

    // 载具频道逻辑 - 开始
    player addEventHandler ["GetInMan", {4 enableChannel true;}]; // 玩家进入载具时自动添加载具频道
    player addEventHandler ["GetOutMan", {4 enableChannel false;}]; // 玩家离开载具时自动删除载具频道
    // 载具频道逻辑 - 结束

    // 重生至小队长
    if (allowPlayerRespawnBesideLeader) then {
        [15,25] execVM "scripts\respawnBesideLeader.sqf";
    };

    // 在地图上显示玩家图标
    if (showFriendlyMarkerOnMap) then {
        [] execVM "scripts\QS_icons.sqf";
    };

    // 耳塞
    [] execVM "scripts\earplugs.sqf";

    // 无限体力
    if (noPlayerStamina) then {
        player enableStamina false;
    };

}] call CBA_fnc_waitUntilAndExecute;
