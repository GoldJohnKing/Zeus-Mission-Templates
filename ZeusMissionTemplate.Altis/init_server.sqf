// 服务端初始化逻辑，仅在服务端任务初始化时执行

["Initialize"] call BIS_fnc_dynamicGroups; // 小队菜单 - 服务端

// 设置重生票数
if (playerRespawnTicket isNotEqualTo 0) then {
	[playerRespawnTicketSide, playerRespawnTicket] call BIS_fnc_respawnTickets;
};
