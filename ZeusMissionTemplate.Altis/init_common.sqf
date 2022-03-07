// 通用初始化逻辑，会在服务端和客户端任务初始化时执行

// 设置AI技能，仅对服务器生成的AI或宙斯放置的AI有效
["CAManBase", "InitPost", custom_fnc_set_ai_skills] call CBA_fnc_addClassEventHandler;
