#!/usr/bin/slsh
%
% Copyright (c)
%       2006       Jörg Sommer <joerg@alea.gnuu.de>
%
% Description:   Using Kasiski test to decrypt a Vigenére encoded text.
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

() = evalfile("kasiski.sl");
() = evalfile("caesar.sl");

variable text = normalize( strjoin(fgetslines(stdin), "") );
variable d = kasiski(text, 3, 15);

message("d = $d"$);

d = 5;
variable sub_texts = split(text, d);

variable words = [""];
foreach ( array_map(Array_Type, &caesar_find_keys(), sub_texts) )
{
    variable words_so_far = words;
    words = String_Type[0];
    foreach $1 ( () )
      words = [words, array_map(String_Type, &strcat(), words_so_far, char($1))];
}

foreach (words)
{
    variable w = ();
    message("Schlüsselwort: " + w);
    variable txt = join(array_map(String_Type, &caesar_decode(),
                                  sub_texts, bstring_to_array(w)),
                        d);

# if (is_defined("DEBUG"))
    variable i, table = Integer_Type[26];
    table[*] = 0;
    foreach i (string(txt))
      ++table[i-'A'];
    message("words: " +
            strjoin(array_map(String_Type, &string(), table), ", ") );
# endif

    message( strtrans(txt, "A-Z", "a-z") );
}
