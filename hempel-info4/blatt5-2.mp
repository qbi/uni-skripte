% Creator: Finomaton 0.8
% Creation-Date: Sat Jul 22 10:30:51 AM CEST 2006

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
s1.c = (100.0, -64.0);
pickup pencircle scaled 1.2bp;
drawboxed(s1);
pickup defaultpen;

circleit.s3(btex $z_1$ etex);
s3.c = (160.0, -64.0);
drawboxed(s3);
draw fullcircle scaled 0.85(ypart s3.n - ypart s3.s) shifted s3.c;

circleit.s5(btex $z_2$ etex);
s5.c = (99.5, -108.0);
drawboxed(s5);


% Next, draw the lines
p7 = (s1.c)..controls (135.0, -63.5) and (s3.c)..(s3.c) cutbefore bpath s1 cutafter bpath s3;
drawarrow p7;
label.top(btex a etex, point 0.5 of p7);

p11 = (s1.c)..controls (99.5, -84.0) and (s5.c)..(s5.c) cutbefore bpath s1 cutafter bpath s5;
drawarrow p11;
label.rt(btex b etex, point 0.5 of p11);

p15 = directionpoint dir 376 of bpath s5..controls (111.5, -132.0) and (85.5, -133.0)..directionpoint dir 331 of bpath s5;
drawarrow p15;
label.bot(btex a,b etex, point 0.5 of p15);

p19 = directionpoint dir 111 of bpath s3..controls (186.0, -52.5) and (187.0, -77.0)..directionpoint dir 419 of bpath s3;
drawarrow p19;
label.rt(btex a,b etex, point 0.5 of p19);


% Finally, create labels

endfig;
end
