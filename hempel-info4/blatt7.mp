% Creator: Finomaton 0.8
% Creation-Date: Sat Jul 22 11:43:39 AM CEST 2006

input boxes
% Breadth of arrowheads (MetaPost default is 45)
ahangle := 35;
% Length of arrowheads (MetaPost default is 4bp)
ahlength := 4;
beginfig(1);
% for temporary paths (might be unused)
path p[];

% First, define and draw all the states
circleit.s99("A");
s99.c = (99.5, -74.0);
drawboxed(s99);

circleit.s101("F");
s101.c = (124.5, -109.5);
drawboxed(s101);
draw fullcircle scaled 0.85(ypart s101.n - ypart s101.s) shifted s101.c;

circleit.s103("C");
s103.c = (141.5, -72.5);
drawboxed(s103);

circleit.s105("B");
s105.c = (140.0, -39.5);
drawboxed(s105);


% Next, draw the lines
p107 = (s99.c)..controls (106.5, -43.0) and (s105.c)..(s105.c) cutbefore bpath s99 cutafter bpath s105;
drawarrow p107;
label.lft(btex a etex, point 0.5 of p107);

p111 = (108.986294669, -74.5233725075)..controls (121.0, -77.5) and (131.074539249, -71.281300331)..(131.074539249, -71.281300331);
drawarrow p111;
label.top(btex a etex, point 0.5 of p111);

p115 = (s99.c)..controls (104.0, -98.0) and (s101.c)..(s101.c) cutbefore bpath s99 cutafter bpath s101;
drawarrow p115;
label.lft(btex a etex, point 0.5 of p115);


% Finally, create labels

endfig;
end
