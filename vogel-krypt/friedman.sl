#!/usr/bin/slsh
%
% Copyright (c)
%       2006       Jörg Sommer <joerg@alea.gnuu.de>
%
% Description:   Implementation of the Kasiski test to determine the key
%          length of a text with polyalphabetical encryption.
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

() = evalfile("./tools.sl");

define friedman(c)
{
    variable hist = double( histogram(c) ), l = double( strlen(c) );

    variable Ic = 1/(l - 1) * (1 / l * sum(hist*hist) - 1);
#if (is_defined("DEBUG"))
    message("I(c) = " + string(Ic));
#endif

    variable Id = 0.0762, Iz = 0.0385;

    return l * (Id - Iz) / (Id - l * Iz + (l - 1) * Ic);
}

#if (path_basename(__argv[0]) == "friedman.sl")
variable text = normalize( strjoin(fgetslines(stdin), "") );
message("d = " + string( friedman(text) ) );
#endif
