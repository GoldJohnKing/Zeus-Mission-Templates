// 初始化逻辑入口

// 禁用存档功能
enableSaving [false, false];

// 预先加载全局变量
[] call compileScript ["define_variables.sqf"];

// 执行服务端初始化
if (isServer) then {
    [] call compileScript ["init_server.sqf"];
};

// 执行通用初始化
[] call compileScript ["init_common.sqf"];

// 执行客户端初始化
if (!isDedicated && hasInterface) then {
    [] call compileScript ["init_player.sqf"];
};
