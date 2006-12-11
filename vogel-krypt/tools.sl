#!/usr/bin/slsh
%
% Copyright (c)
%       2006       Jörg Sommer <joerg@alea.gnuu.de>
%
% Description:  Some tools for handling texts.
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

define normalize(text)
{
    return str_delete_chars(strup(text), "^A-Z");
}

define split(text, d)
{
    variable ret = String_Type[0], len = strlen(text)-1, i;
    _for i (0, d-1, 1)
      ret = [ ret, text[ [i:len:d] ] ];

    return ret;
}

define join(sub_texts, d)
{
    variable len = 0;
    foreach (sub_texts)
      len += strlen( () );

    variable nachricht = UChar_Type[len], i;

    _for i (0, d-1, 1)
      nachricht[ [i:len-1:d] ] = bstring_to_array(sub_texts[i]);

    return array_to_bstring(nachricht);
}
#iffalse
define hist_decode(text)
{
    variable i, table = Integer_Type[26];
    table[*] = 0;
    foreach i (text)
      ++table[i-'A'];

    return strtrans(text, array_to_bstring(array_sort(table) + 'A'),
                    "QXYJVPZKFWBOMGCLUHDTARSINE");
}
#endif

define histogram(text)
{
    variable i, table = Integer_Type[26];
    table[*] = 0;
    foreach i (text)
      ++table[i-'A'];

    return table;
}
