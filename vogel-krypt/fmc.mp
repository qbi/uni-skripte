%%%
%
% Das Freimaurer-Alphabet
%
%%%

breite := 6pt;

def quadrat(expr punkt, oben, rechts, unten, links)=
begingroup
    pair ul, ur, ol, or;
    ul := breite * (0, 0);
    ur := breite * (1, 0);
    ol := breite * (0, 1);
    or := breite * (1, 1);

    if unten:   draw ul -- ur; fi
    if rechts:  draw ur -- or; fi
    if oben:    draw or -- ol; fi
    if links:   draw ol -- ul; fi

    if punkt:
        pickup pencircle scaled 2pt;
        draw .5 * breite * (1, 1);
    fi;
endgroup;
enddef;

def dreieck(expr punkt, wo)=
begingroup
    pair p[];

    if wo = "oben": p[0] := (0, 1); p[1] := (.5, 0); p[2] := (1, 1);
    elseif wo = "rechts": p[0] := (1, 0); p[1] := (0, .5); p[2] := (1, 1);
    elseif wo = "unten": p[0] := (0, 0); p[1] := (.5, 1); p[2] := (1, 0);
    else: p[0] := (0, 0); p[1] := (1, .5); p[2] := (0, 1); fi

    draw breite * p[0] -- breite * p[1] -- breite * p[2];

    if punkt:
        pickup pencircle scaled 2pt;
        draw .5 * (breite, breite);
    fi;
endgroup;
enddef;

pickup pencircle scaled 2pt;

%% A--I
% obere Zeile von links nach rechts
beginfig(1); quadrat(false, false,  true,  true, false); endfig;
beginfig(2); quadrat(false, false,  true,  true,  true); endfig;
beginfig(3); quadrat(false, false, false,  true,  true); endfig;

% mittlere Zeile von links nach rechts
beginfig(4); quadrat(false,  true,  true,  true, false); endfig;
beginfig(5); quadrat(false,  true,  true,  true,  true); endfig;
beginfig(6); quadrat(false,  true, false,  true,  true); endfig;

% untere Zeile von links nach rechts
beginfig(7); quadrat(false,  true,  true, false, false); endfig;
beginfig(8); quadrat(false,  true,  true, false,  true); endfig;
beginfig(9); quadrat(false,  true, false, false,  true); endfig;

%% J--M
beginfig(10); dreieck(false,   "oben"); endfig;
beginfig(11); dreieck(false, "links"); endfig;
beginfig(12); dreieck(false,  "rechts"); endfig;
beginfig(13); dreieck(false,  "unten"); endfig;

%% N--V
% obere Zeile von links nach rechts
beginfig(14); quadrat( true, false,  true,  true, false); endfig;
beginfig(15); quadrat( true, false,  true,  true,  true); endfig;
beginfig(16); quadrat( true, false, false,  true,  true); endfig;

% mittlere Zeile von links nach rechts
beginfig(17); quadrat( true,  true,  true,  true, false); endfig;
beginfig(18); quadrat( true,  true,  true,  true,  true); endfig;
beginfig(19); quadrat( true,  true, false,  true,  true); endfig;

% untere Zeile von links nach rechts
beginfig(20); quadrat( true,  true,  true, false, false); endfig;
beginfig(21); quadrat( true,  true,  true, false,  true); endfig;
beginfig(22); quadrat( true,  true, false, false,  true); endfig;

%% W--Z
beginfig(23); dreieck( true,   "oben"); endfig;
beginfig(24); dreieck( true, "links"); endfig;
beginfig(25); dreieck( true,  "rechts"); endfig;
beginfig(26); dreieck( true,  "unten"); endfig;

end.
