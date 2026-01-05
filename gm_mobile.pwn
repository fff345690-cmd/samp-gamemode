#include <a_samp>

// Cores
#define COR_BRANCO 0xFFFFFFFF
#define COR_VERDE  0x33FF33FF

// Coordenadas do Aeroporto LS
#define SPAWN_X 1685.427
#define SPAWN_Y -2334.678
#define SPAWN_Z 13.546
#define SPAWN_A 90.0

main()
{
    print("=================================");
    print("  Oceano Roleplay - GM Iniciada  ");
    print("=================================");
}

public OnGameModeInit()
{
    SetGameModeText("Oceano Roleplay");
    ShowPlayerMarkers(1);
    ShowNameTags(1);
    EnableStuntBonusForAll(0);

    // Classe base (FBI)
    AddPlayerClass(
        286,            // Skin FBI
        SPAWN_X,
        SPAWN_Y,
        SPAWN_Z,
        SPAWN_A,
        0,0,0,0,0,0
    );
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, COR_VERDE, "Bem-vindo ao Oceano Roleplay!");
    SendClientMessage(playerid, COR_BRANCO, "Servidor focado em trocação e RP livre.");
    return 1;
}

public OnPlayerSpawn(playerid)
{
    // Posição
    SetPlayerPos(playerid, SPAWN_X, SPAWN_Y, SPAWN_Z);
    SetPlayerFacingAngle(playerid, SPAWN_A);

    // Skin FBI
    SetPlayerSkin(playerid, 286);

    // Armas
    GivePlayerWeapon(playerid, 22, 200); // Pistola
    GivePlayerWeapon(playerid, 25, 100); // Shotgun (doze)
    GivePlayerWeapon(playerid, 31, 300); // M4

    // Criar NRG-500
    new veh = CreateVehicle(
        522,            // NRG-500
        SPAWN_X + 3.0,
        SPAWN_Y,
        SPAWN_Z,
        SPAWN_A,
        -1,
        -1,
        0
    );
    PutPlayerInVehicle(playerid, veh, 0);

    SendClientMessage(playerid, COR_VERDE, "Você spawnou pronto para a ação!");
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    // Respawn automático
    SetTimerEx("RespawnPlayerDelay", 2000, false, "i", playerid);
    return 1;
}

forward RespawnPlayerDelay(playerid);
public RespawnPlayerDelay(playerid)
{
    SpawnPlayer(playerid);
    return 1;
}
