// 玩家阵亡事件逻辑，仅在玩家阵亡时，在玩家的客户端上执行

params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

player setVariable ["Saved_Loadout", getUnitLoadout player]; // 重生时保持装备