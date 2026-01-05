#include <a_samp>
#pragma rational

#define COR_BRANCO 0xFFFFFFFF
#define COR_VERDE  0x33FF33FF
#define COR_VERMELHO 0xFF3333FF

forward OnPlayerDeath(playerid, killerid, reason);

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

    AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 270.0, 71, 0,0,0,0,0);
    return 1;
}

public OnPlayerConnect(playerid)
{
    new nome[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nome, sizeof(nome));

    new msg[128];
    format(msg, sizeof(msg), "Bem-vindo %s ao Oceano RP!", nome);
    SendClientMessage(playerid, COR_VERDE, msg);
    return 1;
}

public OnPlayerSpawn(playerid)
{
    // Spawn no aeroporto
    new Float:x = 1958.3783, Float:y = 1343.1572, Float:z = 15.3746, Float:angle = 270.0;
    SetPlayerPos(playerid, x, y, z);
    SetPlayerFacingAngle(playerid, angle);

    // Skin FBI
    SetPlayerSkin(playerid, 71);

    // Armas iniciais
    GivePlayerWeapon(playerid, 24, 12);  // Doze
    GivePlayerWeapon(playerid, 31, 50);  // M4
    GivePlayerWeapon(playerid, 22, 50);  // Pistola

    // NRG-500
    new vehid = CreateVehicle(522, x+5.0, y+5.0, z, angle, -1, -1, 100);
    PutPlayerInVehicle(playerid, vehid, 0);

    SendClientMessage(playerid, COR_BRANCO, "Você spawnou pronto para trocar tiro!");
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp(cmdtext, "/ajuda", true) == 0)
    {
        SendClientMessage(playerid, COR_VERDE, "=== Comandos ===");
        SendClientMessage(playerid, COR_BRANCO, "/ajuda - Ver comandos");
        SendClientMessage(playerid, COR_BRANCO, "/info - Info do servidor");
        return 1;
    }

    if (strcmp(cmdtext, "/info", true) == 0)
    {
        SendClientMessage(playerid, COR_VERDE, "GM criada 100% pelo celular! Oceano RP");
        return 1;
    }

    return 0;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    SendClientMessage(playerid, COR_VERMELHO, "Você morreu! Respawn no aeroporto.");
    return 1;
}
