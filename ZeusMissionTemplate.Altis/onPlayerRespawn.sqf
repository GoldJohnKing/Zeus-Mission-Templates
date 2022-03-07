// 玩家重生事件逻辑，仅在玩家重生时，在玩家的客户端上执行

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"]; // 传入参数

player setUnitLoadout (configFile >> "EmptyLoadout"); // 清空当前装备
player setUnitLoadout (player getVariable ["Saved_Loadout", []]); // 重生时保持装备

_oldUnit connectTerminalToUAV objNull; // 断开阵亡单位与无人机的连接