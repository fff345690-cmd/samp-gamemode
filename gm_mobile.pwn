#include <a_samp>

#define SPAWN_X 1685.53
#define SPAWN_Y -2334.78
#define SPAWN_Z 13.55
#define SPAWN_A 90.0

main()
{
    print("Oceano Roleplay carregado.");
}

public OnGameModeInit()
{
    SetGameModeText("Oceano Roleplay");
    UsePlayerPedAnims();
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, 0x00FF00FF, "Bem-vindo ao Oceano Roleplay!");
    return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerSkin(playerid, 286); // FBI

    SetPlayerPos(playerid, SPAWN_X, SPAWN_Y, SPAWN_Z);
    SetPlayerFacingAngle(playerid, SPAWN_A);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);

    GivePlayerWeapon(playerid, 25, 200); // Doze
    GivePlayerWeapon(playerid, 31, 300); // M4
    GivePlayerWeapon(playerid, 22, 200); // Pistola

    new veh = CreateVehicle(522, SPAWN_X + 3.0, SPAWN_Y, SPAWN_Z, SPAWN_A, 1, 1, -1);
    PutPlayerInVehicle(playerid, veh, 0);

    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SetTimerEx("RespawnPlayer", 2000, false, "i", playerid);
    return 1;
}

forward RespawnPlayer(playerid);
public RespawnPlayer(playerid)
{
    SpawnPlayer(playerid);
    return 1;
}
