#!/usr/bin/slsh
%
% Copyright (c)
%       2006       Jörg Sommer <joerg@alea.gnuu.de>
%
% Description:  Caesar chiffre.
%
% License: This program is free software; you can redistribute it and/or
%	   modify it under the terms of the GNU General Public License as
%	   published by the Free Software Foundation; either version 2 of
%	   the License, or (at your option) any later version.
%
%          This program is distributed in the hope that it will be
%	   useful, but WITHOUT ANY WARRANTY; without even the implied
%	   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
%	   PURPOSE.  See the GNU General Public License for more details.

define caesar_encode(text, key)
{
    return strtrans(text, "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                    strjoin(array_map(String_Type, &char(), [key:'Z']), "") +
                    strjoin(array_map(String_Type, &char(), ['A':key-1]), "") );
}

define caesar_decode(text, key)
{
    return strtrans(text,
                    strjoin(array_map(String_Type, &char(), [key:'Z']), "") +
                    strjoin(array_map(String_Type, &char(), ['A':key-1]), ""),
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZ");
}

define caesar_find_keys(text)
{
    variable i, table = Integer_Type[26];
    table[*] = 0;
    foreach i (text)
      ++table[i-'A'];

    variable key = where( table == max(table) ) + 'A' - 4;
    key[ where(key < 'A') ] += 26;

#if (is_defined("DEBUG"))
    message("find_key: " +
            strjoin(array_map(String_Type, &string(), table), ", ") );
#endif

    return key;
}

#if (path_basename(__argv[0]) == "tools.sl")
if ( length(__argv) <= 1)
  throw UsageError, "Bitte das Schlüsselwort angeben";

() = evalfile("./tools.sl");

variable key = __argv[1];
variable text = split(normalize( strjoin(fgetslines(stdin), "") ),
                      strlen(key) );

message("Verschlüsselt: " +
        join( array_map(String_Type, &caesar_encode(), text, bstring_to_array(key)), strlen(key)) );

message("Entschlüsselt: " +
        join( array_map(String_Type, &caesar_decode(), text, bstring_to_array(key)), strlen(key)) );
#endif
