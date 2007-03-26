% Creator: Finomaton 0.8
% Creation-Date: Sat Jul 22 11:22:30 PM CEST 2006

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
s1.c = (89.0, -35.0);
pickup pencircle scaled 1.2bp;
drawboxed(s1);
pickup defaultpen;

circleit.s3(btex $z_1$ etex);
s3.c = (137.5, -35.0);
pickup pencircle scaled 1.2bp;
drawboxed(s3);
pickup defaultpen;

circleit.s5(btex $z_2$ etex);
s5.c = (186.0, -35.0);
pickup pencircle scaled 1.2bp;
drawboxed(s5);
pickup defaultpen;
draw fullcircle scaled 0.85(ypart s5.n - ypart s5.s) shifted s5.c;


% Next, draw the lines
p7 = (s1.c)..controls (112.5, -35.5) and (s3.c)..(s3.c) cutbefore bpath s1 cutafter bpath s3;
drawarrow p7;
label.top(btex 0 etex, point 0.5 of p7);

p11 = (s3.c)..controls (159.0, -35.0) and (s5.c)..(s5.c) cutbefore bpath s3 cutafter bpath s5;
drawarrow p11;
label.top(btex 0 etex, point 0.5 of p11);

p15 = directionpoint dir 351 of bpath s5..controls (177.0, -59.0) and (198.0, -58.5)..directionpoint dir 381 of bpath s5;
drawarrow p15;
label.bot(btex 1 etex, point 0.5 of p15);


% Finally, create labels

endfig;
end
