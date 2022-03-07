// 服务端初始化逻辑，仅在服务端任务初始化时执行

["Initialize"] call BIS_fnc_dynamicGroups; // 小队菜单 - 服务端

// 设置重生票数
if (playerRespawnTicket isNotEqualTo 0) then {
	[playerRespawnTicketSide, playerRespawnTicket] call BIS_fnc_respawnTickets;
};

// 设置AI技能，仅对编辑器放置的AI有效
{
	[_x] call custom_fnc_set_ai_skills;
} forEach allUnits;
