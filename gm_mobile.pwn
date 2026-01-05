#include <a_samp>

#define COR_BRANCO   0xFFFFFFFF
#define COR_VERDE    0x33FF33FF
#define COR_VERMELHO 0xFF3333FF
#define COR_AZUL     0x3399FFFF

main()
{
    print("====================================");
    print("      OCEANO ROLEPLAY INICIADO      ");
    print("====================================");
}

public OnGameModeInit()
{
    SetGameModeText("Oceano Roleplay");
    ShowNameTags(1);
    ShowPlayerMarkers(1);
    EnableStuntBonusForAll(0);

    // Spawn inicial (Los Santos)
    AddPlayerClass(
        0,
        1958.3783, 1343.1572, 15.3746,
        270.0,
        0, 0,
        0, 0,
        0, 0
    );

    return 1;
}

public OnPlayerConnect(playerid)
{
    new nome[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nome, sizeof(nome));

    new msg[128];
    format(msg, sizeof(msg), "Bem-vindo %s ao Oceano Roleplay!", nome);
    SendClientMessage(playerid, COR_VERDE, msg);

    SendClientMessage(playerid, COR_AZUL, "Servidor Oceano Roleplay");
    SendClientMessage(playerid, COR_BRANCO, "Digite /ajuda para ver os comandos.");

    return 1;
}

public OnPlayerSpawn(playerid)
{
    SendClientMessage(playerid, COR_BRANCO, "Respeite as regras do roleplay.");
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    // /ajuda
    if (strcmp(cmdtext, "/ajuda", true) == 0)
    {
        SendClientMessage(playerid, COR_VERDE, "=== Comandos Oceano RP ===");
        SendClientMessage(playerid, COR_BRANCO, "/ajuda - Ver comandos");
        SendClientMessage(playerid, COR_BRANCO, "/info  - Informacoes do servidor");
        return 1;
    }

    // /info
    if (strcmp(cmdtext, "/info", true) == 0)
    {
        SendClientMessage(playerid, COR_AZUL, "Oceano Roleplay");
        SendClientMessage(playerid, COR_BRANCO, "Gamemode criada 100% pelo celular.");
        SendClientMessage(playerid, COR_BRANCO, "Projeto em desenvolvimento.");
        return 1;
    }

    return 0;
}
