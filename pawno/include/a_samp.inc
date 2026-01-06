#if defined _a_samp_included
    #endinput
#endif
#define _a_samp_included

// ===============================
// DEFINIÇÕES BÁSICAS
// ===============================
#define MAX_PLAYERS        1000
#define MAX_PLAYER_NAME    24

// ===============================
// TIPOS
// ===============================
#define bool:            _:
#define Float:           _

// ===============================
// CORE NATIVES
// ===============================
native print(const string[]);
native printf(const format[], {Float,_}:...);
native SendClientMessage(playerid, color, const message[]);
native SendClientMessageToAll(color, const message[]);
native SetGameModeText(const string[]);
native ShowNameTags(show);
native ShowPlayerMarkers(mode);
native EnableStuntBonusForAll(enable);

// ===============================
// PLAYER
// ===============================
native GetPlayerName(playerid, name[], len);
native SetPlayerPos(playerid, Float:x, Float:y, Float:z);
native SetPlayerFacingAngle(playerid, Float:angle);
native SetPlayerSkin(playerid, skinid);
native GivePlayerWeapon(playerid, weaponid, ammo);
native ResetPlayerWeapons(playerid);
native SpawnPlayer(playerid);

// ===============================
// CLASSES
// ===============================
native AddPlayerClass(
    modelid,
    Float:x,
    Float:y,
    Float:z,
    Float:rotation,
    weapon1, ammo1,
    weapon2, ammo2,
    weapon3, ammo3
);

// ===============================
// VEHÍCULOS
// ===============================
native CreateVehicle(
    modelid,
    Float:x,
    Float:y,
    Float:z,
    Float:rotation,
    color1,
    color2,
    respawn_delay
);
native PutPlayerInVehicle(playerid, vehicleid, seatid);

// ===============================
// STRINGS (ESSENCIAL)
// ===============================
native strcmp(const string1[], const string2[], bool:ignorecase = false);
native format(output[], size = sizeof output, const format[], {Float,_}:...);

// ===============================
// CALLBACKS
// ===============================
forward OnGameModeInit();
forward OnGameModeExit();
forward OnPlayerConnect(playerid);
forward OnPlayerDisconnect(playerid, reason);
forward OnPlayerSpawn(playerid);
forward OnPlayerDeath(playerid, killerid, reason);
forward OnPlayerCommandText(playerid, cmdtext[]);
