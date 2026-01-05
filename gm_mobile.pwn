#include <a_samp>

#define COR_BRANCO 0xFFFFFFFF
#define COR_VERDE  0x33FF33FF
#define COR_VERMELHO 0xFF3333FF

main()
{
    print("====================================");
    print("   GM MOBILE INICIADA COM SUCESSO   ");
    print("====================================");
}

public OnGameModeInit()
{
    SetGameModeText("GM Mobile Base");
    ShowNameTags(1);
    ShowPlayerMarkers(1);
    EnableStuntBonusForAll(0);

    AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 270.0, 0,0,0,0,0,0);
    return 1;
}

public OnPlayerConnect(playerid)
{
    new nome[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nome, sizeof(nome));

    new msg[128];
    format(msg, sizeof(msg), "Bem-vindo %s ao servidor!", nome);
    SendClientMessage(playerid, COR_VERDE, msg);
    return 1;
}

public OnPlayerSpawn(playerid)
{
    SendClientMessage(playerid, COR_BRANCO, "Digite /ajuda para ver os comandos.");
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
        SendClientMessage(playerid, COR_VERDE, "GM criada 100% pelo celular!");
        return 1;
    }

    return 0;
}