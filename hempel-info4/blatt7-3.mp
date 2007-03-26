% Creator: Finomaton 0.8
% Creation-Date: Sat Jul 22 08:49:32 PM CEST 2006

input boxes
% Breadth of arrowheads (MetaPost default is 45)
ahangle := 35;
% Length of arrowheads (MetaPost default is 4bp)
ahlength := 4;
beginfig(1);
% for temporary paths (might be unused)
path p[];

% First, define and draw all the states
circleit.s360(btex $Z_0$ etex);
s360.c = (69.5, -62.5);
drawboxed(s360);

circleit.s362(btex $Z^{'}$ etex);
s362.c = (118.0, -61.5);
drawboxed(s362);

circleit.s364(btex $Z^{''}$ etex);
s364.c = (171.0, -61.5);
drawboxed(s364);

circleit.s366("E");
s366.c = (251.5, -61.5);
drawboxed(s366);


% Next, draw the lines
p368 = (s360.c)..controls (90.5, -61.5) and (s362.c)..(s362.c) cutbefore bpath s360 cutafter bpath s362;
drawarrow p368;
label.top(btex $a_1$ etex, point 0.5 of p368);

p372 = (s362.c)..controls (147.5, -60.5) and (s364.c)..(s364.c) cutbefore bpath s362 cutafter bpath s364;
drawarrow p372;
label.top(btex $a_2$ etex, point 0.5 of p372);

p376 = (s364.c)..controls (186.5, -61.0) and (198.5, -61.0)..(198.5, -61.0) cutbefore bpath s364;
drawarrow p376;
label.top(btex $a_3$ etex, point 0.5 of p376);

p380 = (218.5, -61.0)..controls (234.0, -61.0) and (s366.c)..(s366.c) cutafter bpath s366;
drawarrow p380;
label.top(btex $a_n$ etex, point 0.5 of p380);


% Finally, create labels
label(btex $\delta^{*}(a_1 , Z_0)$ etex, (116.5, -88.0));
label(btex $\delta^{*}(a_1 a_2 , Z_0)$ etex, (171.5, -88.0));

endfig;
end
