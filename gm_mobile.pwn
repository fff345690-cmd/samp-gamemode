#include <a_samp>

#define COR_BRANCO   0xFFFFFFFF
#define COR_VERDE    0x33FF33FF
#define COR_VERMELHO 0xFF3333FF

// Coordenadas do Aeroporto LS
#define SPAWN_X 1685.44
#define SPAWN_Y -2244.62
#define SPAWN_Z 13.54
#define SPAWN_A 90.0

new MotoSpawn;

// ===============================
// MAIN
// ===============================
main()
{
    print("====================================");
    print("   OCEANO ROLEPLAY 🌊 INICIADO");
    print("====================================");
}

// ===============================
// GAMEMODE INIT
// ===============================
public OnGameModeInit()
{
    SetGameModeText("Oceano Roleplay");
    ShowNameTags(1);
    ShowPlayerMarkers(1);
    EnableStuntBonusForAll(0);

    // Classe FBI
    AddPlayerClass(
        286,
        SPAWN_X,
        SPAWN_Y,
        SPAWN_Z,
        SPAWN_A,
        0,0,0,0,0,0
    );

    return 1;
}

// ===============================
// PLAYER CONNECT
// ===============================
public OnPlayerConnect(playerid)
{
    new nome[MAX_PLAYER_NAME];
    new msg[128];

    GetPlayerName(playerid, nome, sizeof(nome));
    format(msg, sizeof(msg), "Bem-vindo %s ao Oceano Roleplay 🌊", nome);
    SendClientMessage(playerid, COR_VERDE, msg);

    return 1;
}

// ===============================
// PLAYER SPAWN
// ===============================
public OnPlayerSpawn(playerid)
{
    // Posição
    SetPlayerPos(playerid, SPAWN_X, SPAWN_Y, SPAWN_Z);
    SetPlayerFacingAngle(playerid, SPAWN_A);

    // Skin FBI
    SetPlayerSkin(playerid, 286);

    // Armas
    ResetPlayerWeapons(playerid);
    GivePlayerWeapon(playerid, 25, 200); // Shotgun
    GivePlayerWeapon(playerid, 31, 300); // M4
    GivePlayerWeapon(playerid, 22, 200); // Pistola

    // Criar NRG-500
    MotoSpawn = CreateVehicle(
        522,
        SPAWN_X + 2.0,
        SPAWN_Y,
        SPAWN_Z,
        SPAWN_A,
        1,
        1,
        0
    );

    PutPlayerInVehicle(playerid, MotoSpawn, 0);

    SendClientMessage(playerid, COR_BRANCO, "Digite /ajuda para ver os comandos.");
    return 1;
}

// ===============================
// PLAYER DEATH
// ===============================
public OnPlayerDeath(playerid, killerid, reason)
{
    // Respawn automático
    SpawnPlayer(playerid);
    return 1;
}

// ===============================
// COMANDOS
// ===============================
public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp(cmdtext, "/ajuda", true) == 0)
    {
        SendClientMessage(playerid, COR_VERDE, "=== COMANDOS ===");
        SendClientMessage(playerid, COR_BRANCO, "/ajuda - Lista de comandos");
        SendClientMessage(playerid, COR_BRANCO, "/info - Informações do servidor");
        return 1;
    }

    if (strcmp(cmdtext, "/info", true) == 0)
    {
        SendClientMessage(playerid, COR_VERDE, "Oceano Roleplay 🌊");
        SendClientMessage(playerid, COR_BRANCO, "GM criada para SA-MP Mobile");
        return 1;
    }

    return 0;
}
