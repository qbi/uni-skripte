% Creator: Finomaton 0.8
% Creation-Date: Mon Jul 24 10:55:03 AM CEST 2006

input boxes
% Breadth of arrowheads (MetaPost default is 45)
ahangle := 35;
% Length of arrowheads (MetaPost default is 4bp)
ahlength := 4;
beginfig(1);
% for temporary paths (might be unused)
path p[];

% First, define and draw all the states
circleit.s1("X");
s1.c = (83.5, -50.0);
pickup pencircle scaled 1.2bp;
drawboxed(s1);
pickup defaultpen;
draw fullcircle scaled 0.85(ypart s1.n - ypart s1.s) shifted s1.c;

circleit.s3("Y");
s3.c = (153.5, -50.0);
pickup pencircle scaled 1.2bp;
drawboxed(s3);
pickup defaultpen;

circleit.s5("Z");
s5.c = (119.5, -87.5);
drawboxed(s5);
draw fullcircle scaled 0.85(ypart s5.n - ypart s5.s) shifted s5.c;


% Next, draw the lines
p7 = (s5.c)..controls (95.0, -65.0) and (s1.c)..(s1.c) cutbefore bpath s5 cutafter bpath s1;
drawarrow p7;
label.rt(btex 1 etex, point 0.5 of p7);

p11 = directionpoint dir 337 of bpath s5..controls (107.5, -111.5) and (129.5, -111.0)..directionpoint dir 376 of bpath s5;
drawarrow p11;
label.bot(btex 0,1 etex, point 0.5 of p11);

p15 = (s3.c)..controls (147.5, -77.5) and (s5.c)..(s5.c) cutbefore bpath s3 cutafter bpath s5;
drawarrow p15;
label.rt(btex 0,1 etex, point 0.5 of p15);

p19 = directionpoint dir 202 of bpath s1..controls (71.5, -27.0) and (94.0, -26.0)..directionpoint dir 163 of bpath s1;
drawarrow p19;
label.top(btex 0 etex, point 0.5 of p19);

p23 = (s1.c)..controls (120.0, -50.0) and (s3.c)..(s3.c) cutbefore bpath s1 cutafter bpath s3;
drawarrow p23;
label.top(btex 1 etex, point 0.5 of p23);

p52 = (s3.c)..controls (119.0, -14.0) and (s1.c)..(s1.c) cutbefore bpath s3 cutafter bpath s1;
drawarrow p52;
label.top(btex 1 etex, point 0.5 of p52);


% Finally, create labels

endfig;
end
