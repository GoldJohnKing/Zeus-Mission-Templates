// 在地图上显示玩家图标，true-开启，false-关闭
showFriendlyMarkerOnMap = true;

// 允许玩家在小队长附近重生，true-开启，开启，false-关闭
allowPlayerRespawnBesideLeader = true;

// 默认AI技能，取值范围为[0,1]，数值越大AI越强
// 关于各项参数的说明，详见：https://community.bistudio.com/wiki/Arma_3:_AI_Skill
custom_ai_skills = [
    1,      // general
    0,      // aimingAccuracy
    0,      // aimingShake
    0.75,   // aimingSpeed
    1,      // endurance
    0.75,   // spotDistance
    0.75,   // spotTime
    1,      // courage
    1,      // reloadSpeed
    1       // commanding
];

// 计票重生设置
// 重生票数由阵营共享，玩家每次重生均会扣除1票，当票数为0时，玩家将无法重生
// 玩家重生票数，0-无限重生，其他-启用计票重生并设置重生票数
playerRespawnTicket = 0;
// 计票重生阵营(应与玩家角色阵营一致)，west-蓝方，east-红方，resistance-中立方，civilian-平民
playerRespawnTicketSide = west;
