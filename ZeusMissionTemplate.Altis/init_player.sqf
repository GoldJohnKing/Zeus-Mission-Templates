// 客户端初始化逻辑，仅在客户端任务初始化时执行

[{!isNull player}, { // 等待玩家角色初始化完成

    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // 小队菜单 - 客户端

    // 载具频道逻辑 - 开始
    player addEventHandler ["GetInMan", {4 enableChannel true;}]; // 玩家进入载具时自动添加载具频道
    player addEventHandler ["GetOutMan", {4 enableChannel false;}]; // 玩家离开载具时自动删除载具频道
    // 载具频道逻辑 - 结束

    // 重生至小队长
    if (allowPlayerRespawnBesideLeader) then {
        [15, 25] call compileScript ["scripts\respawnBesideLeader.sqf"];
    };

    // 在地图上显示玩家图标
    if (showFriendlyMarkerOnMap) then {
        [] call compileScript ["scripts\QS_icons.sqf"];
    };

    // 耳塞
    [] call compileScript ["scripts\earplugs.sqf"];

    // 无限体力
    if (noPlayerStamina) then {
        player enableStamina false;
    };

    // 禁用玩家角色的自动语音状态报告 - 开始
    // 注意：宙斯通过军火库编辑某个角色的装备时，该角色的语音不会被禁用
    [player, "NoVoice"] remoteExec ["setSpeaker", 0, "NO_PLAYER_VOICE_REPORT"];

    // 玩家关闭 BI 军火库时触发此逻辑
    [missionNamespace, "arsenalClosed", {
        [player, "NoVoice"] remoteExec ["setSpeaker", 0, "NO_PLAYER_VOICE_REPORT"];
    }] call BIS_fnc_addScriptedEventHandler;

    // 若 ACE 军火库模组存在，则玩家关闭 ACE 军火库时触发此逻辑
    if (isClass(configFile >> "CfgPatches" >> "ace_arsenal")) then {
        ["ace_arsenal_displayClosed", {
            [player, "NoVoice"] remoteExec ["setSpeaker", 0, "NO_PLAYER_VOICE_REPORT"];
        }] call CBA_fnc_addEventHandler;
    };
    // 禁用玩家角色的自动语音状态报告 - 结束

}] call CBA_fnc_waitUntilAndExecute;
