#if defined _core_included
    #endinput
#endif
#define _core_included

// Tipos básicos
#define true 1
#define false 0

// Operadores essenciais
native printf(const format[], {Float,_}:...);
native print(const string[]);

// Strings
native strlen(const string[]);
native strcat(dest[], const source[], size = sizeof dest);
native strcpy(dest[], const source[], size = sizeof dest);

// Memória
native memset(dest[], value, size);
native memcpy(dest[], const source[], size);

// Math básico
native abs(value);
native random(max);
