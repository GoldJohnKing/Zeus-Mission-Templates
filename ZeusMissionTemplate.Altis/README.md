# 使用说明

1. 将此文件夹内的所有文件复制到 `mission.sqm` 同级路径下。

2. 使用文本编辑器(如记事本、VSCode等)打开 `define_missions.hpp` 和 `define_variables.sqf`，根据实际情况进行修改。

3. 启动任务，进行测试。


# 其他功能

## 伞降功能

在编辑器内，向某个物件的初始化栏目添加如下代码，玩家通过该物体的互动菜单即可进行伞降。

原版互动(鼠标滚轮互动菜单)

```
this addAction ["伞降", {[] spawn custom_fnc_parajump;}];
```

ACE互动(ACE互动菜单)

```
_action = ["custom_action_parajump", "伞降", "", {[] spawn custom_fnc_parajump;}, {true}] call ace_interact_menu_fnc_createAction;
[this, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
```

## 转换为简单物件
在编辑器内，增加一个名为 `Simple Objects` 的图层，将所有无需运算且无需交互的物件，如用于布景的物体、无视损伤的墙壁、无视损伤且无需开关门的建筑物等，全都移动到该图层中即可。
任务加载时，上述物件会自动被转换为简单物件，从而大幅提升物件数量众多的复杂场景的性能。
