#if defined _a_samp_included
    #endinput
#endif
#define _a_samp_included

#define MAX_PLAYER_NAME 24

native print(const string[]);
native SendClientMessage(playerid, color, const message[]);
native ShowNameTags(show);
native ShowPlayerMarkers(mode);
native EnableStuntBonusForAll(enable);
native SetGameModeText(const string[]);
native AddPlayerClass(modelid, Float:x, Float:y, Float:z, Float:rotation,
    weapon1, ammo1, weapon2, ammo2, weapon3, ammo3);
native GetPlayerName(playerid, name[], len);

forward OnGameModeInit();
forward OnPlayerConnect(playerid);
forward OnPlayerSpawn(playerid);
forward OnPlayerCommandText(playerid, cmdtext[]);
