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

% variable DEBUG;

private define string_list(list)
{
    variable i, ret = "";
    foreach i (list)
      ret = strcat(ret, string(i), " ");
    return ret;
}

typedef struct { dist, cnt, weight } dist_t;

private define dist_cmp_reverse(d1, d2)
{
    if (d1.weight < d2.weight)
      return 1;
    if (d1.weight > d2.weight)
      return -1;

    return 0;
}

define kasiski(text, min_block_len, max_block_len)
{
    variable i;

    % Create a dictionary of strings (with min_block_len <= length <=
    % max_block_len) and as values a list of positions where they appear.
    variable table = Assoc_Type[List_Type];
    _for i (1, strlen(text) - min_block_len + 1, 1)
    {
        variable block = substr(text, i, max_block_len);
        while (strlen(block) >= min_block_len)
        {
            !if ( assoc_key_exists(table, block) )
              table[block] = list_new();

            list_append(table[block], i);
            block = substr(block, 1, strlen(block)-1);
        }
    }

#if (is_defined("DEBUG"))
    variable val_len = array_map(Integer_Type, &length(), assoc_get_values(table));
    foreach i ( assoc_get_keys(table)[ where(1 < val_len) ] )
        message(i + ":\t" + strjoin(array_map(String_Type, &string_list(), table[i]), ", ") );
#endif

    % Now count the number of different distances between the positions of a
    % string in table and create a weight how important this distance is.
    %
    % The weight is simply the sum of the length of the strings they have this
    % distance.
    variable dist = Assoc_Type[dist_t], key;
    foreach key, i (table) using ("keys", "values")
    {
        variable weight = strlen(key);

        while (length(i) > 0)
        {
            variable k = list_pop(i), j;
            foreach j (i)
            {
                variable tmp = string(j-k);
                if ( assoc_key_exists(dist, tmp) )
                {
                    ++dist[tmp].cnt;
                    dist[tmp].weight += weight;
                }
                else
                {
                    dist[tmp] = @dist_t;
                    dist[tmp].dist = tmp;
                    dist[tmp].cnt = 1;
                    dist[tmp].weight = weight;
                }
            }
        }
    }
#if (is_defined("DEBUG"))
    message("");
    foreach i (dist) using ("values")
      message(i.dist + ":\t" + string(i.cnt) + " ++ " + string(i.weight));
#endif

    if (length(dist) < 3)
      throw ApplicationError, "Too few repetitions. Text too short";

    tmp = assoc_get_values(dist);
    variable important_dists = tmp[ array_sort(tmp, &dist_cmp_reverse())[[0:(length(tmp)-2)/2]] ];
#if (is_defined("DEBUG"))
    message("");
    foreach i (important_dists)
      message(i.dist + ":\t" + string(i.cnt) + " ++ " + string(i.weight));
#endif

#iffalse
    variable gcd_so_far = important_dists[-1];
    foreach i ( important_dists[[0:-2]] )
      gcd_so_far = gcd(gcd_so_far, i);
    return gcd_so_far;
#endif
    return 0;
}

#if (path_basename(__argv[0]) == "kasiski.sl")
() = evalfile("./tools.sl");

variable text = normalize( strjoin(fgetslines(stdin), "") );
variable d = kasiski(text, 3, 15);

message("d = $d"$);
#endif
