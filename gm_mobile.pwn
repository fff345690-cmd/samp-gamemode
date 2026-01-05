#include <a_samp>
#pragma rational

#define COR_BRANCO 0xFFFFFFFF
#define COR_VERDE  0x33FF33FF
#define COR_VERMELHO 0xFF3333FF

main()
{
    print("====================================");
    print("   GM MOBILE - Oceano RP INICIADA   ");
    print("====================================");
}

public OnGameModeInit()
{
    SetGameModeText("Oceano Roleplay");
    ShowNameTags(1);
    ShowPlayerMarkers(1);
    EnableStuntBonusForAll(0);

    AddPlayerClass(
        0,
        1958.3783,
        1343.1572,
        15.3746,
        270.0,
        71, 0,
        0, 0,
        0, 0
    );
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, COR_VERDE, "Bem-vindo ao Oceano RP!");
    return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
    SetPlayerFacingAngle(playerid, 270.0);
    SetPlayerSkin(playerid, 71);

    GivePlayerWeapon(playerid, 24, 12);
    GivePlayerWeapon(playerid, 31, 50);
    GivePlayerWeapon(playerid, 22, 50);

    new veh = CreateVehicle(522, 1963.0, 1348.0, 15.3, 270.0, -1, -1, 0);
    PutPlayerInVehicle(playerid, veh, 0);

    return 1;
}
