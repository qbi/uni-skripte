% Creator: Finomaton 0.8
% Creation-Date: Sat Jul 22 08:33:31 PM CEST 2006

input boxes
% Breadth of arrowheads (MetaPost default is 45)
ahangle := 35;
% Length of arrowheads (MetaPost default is 4bp)
ahlength := 4;
beginfig(1);
% for temporary paths (might be unused)
path p[];

% First, define and draw all the states
circleit.s99(btex $z_1$ etex);
s99.c = (64.5, -50.0);
drawboxed(s99);

circleit.s101("s");
s101.c = (105.5, -49.5);
drawboxed(s101);

circleit.s103("s");
s103.c = (106.5, -22.0);
drawboxed(s103);

circleit.s105("s");
s105.c = (105.5, -76.0);
drawboxed(s105);

circleit.s183(btex s etex);
s183.c = (105.0, -103.0);
drawboxed(s183);

circleit.s185("s");
s185.c = (106.5, -127.5);
drawboxed(s185);

circleit.s187(btex $z_2$ etex);
s187.c = (66.0, -117.5);
drawboxed(s187);


% Next, draw the lines
p160 = (s99.c)..controls (75.0, -23.5) and (s103.c)..(s103.c) cutbefore bpath s99 cutafter bpath s103;
drawarrow p160;
label.top(btex 0,1 etex, point 0.5 of p160);

p164 = (s99.c)..controls (84.0, -37.5) and (s101.c)..(s101.c) cutbefore bpath s99 cutafter bpath s101;
drawarrow p164;
label.top(btex 0,1 etex, point 0.5 of p164);

p168 = (s99.c)..controls (73.5, -73.0) and (s105.c)..(s105.c) cutbefore bpath s99 cutafter bpath s105;
drawarrow p168;
label.bot(btex 0,1 etex, point 0.5 of p168);

p172 = (s103.c)..controls (130.5, -9.0) and (147.5, -17.5)..(147.5, -17.5) cutbefore bpath s103;
drawarrow p172;
label.top(btex 0,1 etex, point 0.5 of p172);

p176 = (s103.c)..controls (129.0, -30.5) and (146.5, -41.5)..(146.5, -41.5) cutbefore bpath s103;
drawarrow p176;
label.top(btex 0,1 etex, point 0.5 of p176);

p189 = (s101.c)..controls (133.5, -50.5) and (151.5, -55.5)..(151.5, -55.5) cutbefore bpath s101;
drawarrow p189;
label.top(btex 0,1 etex, point 0.5 of p189);

p193 = (s101.c)..controls (123.5, -67.0) and (145.5, -66.5)..(145.5, -66.5) cutbefore bpath s101;
drawarrow p193;
label.bot(btex 0,1 etex, point 0.5 of p193);

p197 = (s105.c)..controls (130.5, -86.5) and (154.0, -83.0)..(154.0, -83.0) cutbefore bpath s105;
drawarrow p197;
label.bot(btex 0,1 etex, point 0.5 of p197);

p201 = (s187.c)..controls (80.0, -97.5) and (s183.c)..(s183.c) cutbefore bpath s187 cutafter bpath s183;
drawarrow p201;
label.top(btex 0,1 etex, point 0.5 of p201);

p206 = (72.571059724, -124.5710759)..controls (80.5, -136.0) and (s185.c)..(s185.c) cutafter bpath s185;
drawarrow p206;
label.bot(btex 0,1 etex, point 0.5 of p206);

drawarrow (s183.c)..controls (133.0, -102.5) and (151.5, -102.5)..(151.5, -102.5) cutbefore bpath s183;

p214 = (s183.c)..controls (134.5, -117.5) and (159.0, -115.5)..(159.0, -115.5) cutbefore bpath s183;
drawarrow p214;
label.bot(btex 0,1 etex, point 0.5 of p214);

p218 = (s183.c)..controls (134.0, -128.5) and (161.0, -131.0)..(161.0, -131.0) cutbefore bpath s183;
drawarrow p218;
label.bot(btex 0,1 etex, point 0.7 of p218);


% Finally, create labels
label(btex $Z_0$ etex, (66.5, -153.0));
label(btex $\delta^{*}(a_1,Z_0)$ etex, (106.0, -153.0));
label(btex $\delta^{*}(a_1 a_2 , Z_0)$ etex, (159.5, -152.5));

endfig;
end
