% Creator: Finomaton 0.8
% Creation-Date: Fri Jul 21 02:36:32 PM CEST 2006

input boxes
% Breadth of arrowheads (MetaPost default is 45)
ahangle := 35;
% Length of arrowheads (MetaPost default is 4bp)
ahlength := 4;
beginfig(1);
% for temporary paths (might be unused)
path p[];

% First, define and draw all the states
circleit.s1(btex $z_0$ etex);
s1.c = (184.8, -87.5);
pickup pencircle scaled 1.2bp;
drawboxed(s1);
pickup defaultpen;

circleit.s3(btex $z_2$ etex);
s3.c = (184.1, -147.0);
drawboxed(s3);

circleit.s5(btex $z_3$ etex);
s5.c = (271.6, -144.9);
drawboxed(s5);
draw fullcircle scaled 0.85(ypart s5.n - ypart s5.s) shifted s5.c;

circleit.s8(btex $z_1$ etex);
s8.c = (270.9, -88.2);
drawboxed(s8);


% Next, draw the lines
p10 = (s1.c)..controls (225.4, -65.1) and (s8.c)..(s8.c) cutbefore bpath s1 cutafter bpath s8;
drawarrow p10;
label.top(btex a etex, point 0.5 of p10);

p14 = (s3.c)..controls (226.1, -182.7) and (s5.c)..(s5.c) cutbefore bpath s3 cutafter bpath s5;
drawarrow p14;
label.bot(btex a etex, point 0.5 of p14);

p18 = (s3.c)..controls (184.8, -119.7) and (s1.c)..(s1.c) cutbefore bpath s3 cutafter bpath s1;
drawarrow p18;
label.rt(btex b etex, point 0.5 of p18);

p22 = (s8.c)..controls (230.3, -120.4) and (s3.c)..(s3.c) cutbefore bpath s8 cutafter bpath s3;
drawarrow p22;
label.lft(btex a etex, point 0.5 of p22);

p26 = (s8.c)..controls (271.6, -116.9) and (s5.c)..(s5.c) cutbefore bpath s8 cutafter bpath s5;
drawarrow p26;
label.rt(btex b etex, point 0.5 of p26);

p30 = (118.3, -87.5)..controls (139.3, -87.5) and (s1.c)..(s1.c) cutafter bpath s1;
drawarrow p30;
label.top(btex Anfangszustand etex, point 0.11 of p30);

p34 = directionpoint dir 126 of bpath s5..controls (300.3, -131.6) and (302.4, -158.2)..directionpoint dir 409 of bpath s5;
drawarrow p34;
label.top(btex a,b etex, point 0.5 of p34);

p38 = (271.6, -191.8)..controls (271.6, -179.2) and (s5.c)..(s5.c) cutafter bpath s5;
drawarrow p38;
label.rt(btex Endzustand etex, point 0.5 of p38);


% Finally, create labels

endfig;
end
