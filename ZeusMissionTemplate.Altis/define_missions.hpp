// 任务名称
onLoadName = "“任务名称”_任务类型_宙斯导演任务";


// ===重生设置===

// 步兵重生等待时间(秒)
respawnDelay = 5;

// 载具重生等待时间(秒)
respawnVehicleDelay = 90;

// 是否禁用手动重生(即ESC菜单中的重生按钮)，0-禁用手动重生，1-允许手动重生
respawnButton = 1;

// 是否显示重生界面，即是否允许玩家选择重生位置，0-不显示，1-显示
respawnDialog = 1;


// ===复苏模式设置===

// 是否启用复苏(长按空格键复苏倒地队友)，挂载ACE模组时应始终保持关闭，0-禁用，1-启用
reviveMode = 0;

// 倒地状态的计算模式
// 0-基础模式：玩家在受到重伤时，始终进入倒地状态，不会立即死亡
// 1-高级模式：小口径武器更容易让玩家进入倒地状态，大口径武器更容易让玩家立即死亡
// 2-拟真模式：计算模型同高级模式，但是玩家直接死亡的可能性更高
reviveUnconsciousStateMode = 0;

// 只有医疗兵(或拥有医疗箱的玩家)才能复苏玩家，0-否，1-是
reviveRequiredTrait = 0;

// 复苏玩家所需物品，0-无需特定物品即可复苏玩家，1-医疗箱，2-医疗箱或急救包
reviveRequiredItems = 0;

// 复苏玩家是否消耗急救包，0-否，1-是
reviveRequiredItemsFakConsumed = 1;

// 医疗兵(或拥有医疗箱的玩家)的复苏速度加成(倍率)
reviveMedicSpeedMultiplier = 3;

// 复苏等待时间(秒)，即玩家需要面对倒地单位按住空格多少秒才能将其复苏
reviveDelay = 3;

// 倒地玩家手动重生的等待时间(秒)，即倒地玩家需要按住空格多少秒才能强制重生
reviveForceRespawnDelay = 3;

// 失血过多等待时间(秒)，即玩家倒地多久之后会死亡
reviveBleedOutDelay = 90;
