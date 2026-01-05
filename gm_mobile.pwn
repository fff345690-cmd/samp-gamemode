#include <a_samp>

#define COR_BRANCO 0xFFFFFFFF
#define COR_VERDE  0x33FF33FF
#define COR_VERMELHO 0xFF3333FF

main()
{
    print("====================================");
    print("     GM OCEANO RP INICIADA          ");
    print("====================================");
}

// ====================================
// GameMode Init
// ====================================
public OnGameModeInit()
{
    SetGameModeText("Oceano Roleplay 🌊");
    ShowNameTags(1);
    ShowPlayerMarkers(1);
    EnableStuntBonusForAll(0);

    return 1;
}

// ====================================
// Player Connect
// ====================================
public OnPlayerConnect(playerid)
{
    new nome[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nome, sizeof(nome));

    new msg[128];
    format(msg, sizeof(msg), "Bem-vindo %s ao Oceano RP!", nome);
    SendClientMessage(playerid, COR_VERDE, msg);

    return 1;
}

// ====================================
// Player Spawn
// ====================================
public OnPlayerSpawn(playerid)
{
    // Spawn no aeroporto
    new Float:x = 1958.3783, Float:y = 1343.1572, Float:z = 15.3746, Float:angle = 270.0;
    SetPlayerPos(playerid, x, y, z);
    SetPlayerFacingAngle(playerid, angle);

    // Skin FBI
    SetPlayerSkin(playerid, 71); // FBI

    // Armas
    GivePlayerWeapon(playerid, 24, 12);  // Shotgun (Doze) com 12 tiros
    GivePlayerWeapon(playerid, 31, 50);  // M4 com 50 tiros
    GivePlayerWeapon(playerid, 22, 50);  // Pistola com 50 tiros

    // NRG-500
    new vehid = CreateVehicle(522, x+5.0, y+5.0, z, angle, -1, -1, 100); // 522 = NRG-500
    PutPlayerInVehicle(playerid, vehid, 0);

    // Mensagem no spawn
    SendClientMessage(playerid, COR_BRANCO, "Você spawnou pronto para trocar tiro!");
    SendClientMessage(playerid, COR_BRANCO, "Aproveite o Oceano RP 🌊");

    return 1;
}

// ====================================
// Player Death
// ====================================
public OnPlayerDeath(playerid, killerid, reason)
{
    new nome[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nome, sizeof(nome));

    SendClientMessage(-1, COR_VERMELHO, "%s morreu! Preparando respawn...", nome);
    return 1;
}

// ====================================
// Player Commands
// ====================================
public OnPlayerCommandText(playerid, cmdtext[])
{
    if(strcmp(cmdtext, "/ajuda", true) == 0)
    {
        SendClientMessage(playerid, COR_VERDE, "=== Comandos ===");
        SendClientMessage(playerid, COR_BRANCO, "/ajuda - Ver comandos");
        SendClientMessage(playerid, COR_BRANCO, "/info - Informações do servidor");
        return 1;
    }

    if(strcmp(cmdtext, "/info", true) == 0)
    {
        SendClientMessage(playerid, COR_VERDE, "GM Oceano RP criada 100% pelo celular!");
        return 1;
    }

    return 0;
}
