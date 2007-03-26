% Creator: Finomaton 0.8
% Creation-Date: Sat Jul 22 11:32:49 AM CEST 2006

input boxes
% Breadth of arrowheads (MetaPost default is 45)
ahangle := 35;
% Length of arrowheads (MetaPost default is 4bp)
ahlength := 4;
beginfig(1);
% for temporary paths (might be unused)
path p[];

% First, define and draw all the states
circleit.s40(btex $z_0$ etex);
s40.c = (82.0, -61.5);
pickup pencircle scaled 1.2bp;
drawboxed(s40);
pickup defaultpen;
draw fullcircle scaled 0.85(ypart s40.n - ypart s40.s) shifted s40.c;

circleit.s42(btex $z_2$ etex);
s42.c = (142.5, -62.5);
drawboxed(s42);

circleit.s44(btex $z_1$ etex);
s44.c = (110.5, -100.5);
drawboxed(s44);

circleit.s62(btex $z_3$ etex);
s62.c = (179.5, -99.5);
pickup pencircle scaled 1.2bp;
drawboxed(s62);
pickup defaultpen;

circleit.s64(btex $z_5$ etex);
s64.c = (229.5, -99.0);
drawboxed(s64);

circleit.s66(btex $z_4$ etex);
s66.c = (205.5, -61.5);
drawboxed(s66);

circleit.s86(btex $z_6$ etex);
s86.c = (275.5, -77.5);
pickup pencircle scaled 1.2bp;
drawboxed(s86);
pickup defaultpen;
draw fullcircle scaled 0.85(ypart s86.n - ypart s86.s) shifted s86.c;


% Next, draw the lines
p46 = (s40.c)..controls (83.5, -89.5) and (s44.c)..(s44.c) cutbefore bpath s40 cutafter bpath s44;
drawarrow p46;
label.lft(btex 1 etex, point 0.5 of p46);

p50 = (s40.c)..controls (113.0, -43.5) and (s42.c)..(s42.c) cutbefore bpath s40 cutafter bpath s42;
drawarrow p50;
label.top(btex 1 etex, point 0.5 of p50);

p54 = (s42.c)..controls (129.5, -82.5) and (s44.c)..(s44.c) cutbefore bpath s42 cutafter bpath s44;
drawarrow p54;
label.lrt(btex 1 etex, point 0.5 of p54);

p70 = (s64.c)..controls (203.5, -100.0) and (s62.c)..(s62.c) cutbefore bpath s64 cutafter bpath s62;
drawarrow p70;
label.top(btex 0 etex, point 0.5 of p70);

p74 = (s62.c)..controls (174.5, -69.5) and (s66.c)..(s66.c) cutbefore bpath s62 cutafter bpath s66;
drawarrow p74;
label.lft(btex 0 etex, point 0.5 of p74);

p78 = (s66.c)..controls (233.0, -66.0) and (s64.c)..(s64.c) cutbefore bpath s66 cutafter bpath s64;
drawarrow p78;
label.rt(btex 0 etex, point 0.5 of p78);

p82 = directionpoint dir 341 of bpath s86..controls (265.5, -102.5) and (286.0, -102.5)..directionpoint dir 382 of bpath s86;
drawarrow p82;
label.bot(btex 0,1 etex, point 0.5 of p82);


% Finally, create labels

endfig;
end
