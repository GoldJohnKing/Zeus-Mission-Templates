// 初始化逻辑入口

// 禁用存档功能
enableSaving [false, false];

// 预先加载全局变量
[] call compileScript ["define_variables.sqf"];

// 执行功能编译
custom_fnc_set_ai_skills = compileScript ["scripts\setAISkills.sqf"]; // 设置AI技能
custom_fnc_parajump = compileScript ["scripts\parajump\parajump.sqf"]; // 跳伞功能

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
