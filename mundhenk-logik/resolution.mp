%%  Ver- und Entschlüsselung

verbatimtex
\documentclass{article}
\usepackage{latexsym,ngerman,amssymb}
%%\usepackage{times,mathpazo}
\RequirePackage{amssymb}
\newcommand{\leqs}{\leqslant}
\newcommand{\geqs}{\geqslant}
\renewcommand{\leq}{\leqs}
\begin{document}
etex ;

input TFtools ;
input MMgraphtools ;
input TEX;

le:=1mm ;            %% Festlegung der Längeneinheit
abstand := 12 ;

duenn := 1pt ;       %% Strichdicken
dick  := 3pt ;

pair null ;
null := (0,0)*le ;


def mviereck(expr nullpunkt)=
begingroup
vbreite := 20 ;
vhoehe := 15 ;

pair viereck[] ;

viereck[0] := nullpunkt ;
viereck[1] := viereck[0] +(0, vhoehe)*le ;
viereck[2] := viereck[0] +(vbreite, vhoehe)*le ;
viereck[3] := viereck[0] +(vbreite, 0)*le ;

pickup pencircle scaled dick ;

viereck[0] -- viereck[1] -- viereck[2] -- viereck[3] -- viereck[0] 
endgroup ;

enddef ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Resolvent
beginfig(1) ;

pair p[] ;

p[0] := null ;
p[1] := p[0] + (-20,-10) *le ;
p[2] := p[0] + (20,-10) *le ;

draw p[0] -- p[1] ;
draw p[0] -- p[2] ;

label(btex $C$ etex, p[0]+(0,3)*le) ;
label(btex $C_1$ etex, p[1]-(0,3)*le) ;
label(btex $C_2$ etex, p[2]-(0,3)*le) ;

endfig ;

%%%%%%%%%%%%%%%%%%%%%%
% Beispiel-Resolution

beginfig(2) ;

p[0] := null ;
p[1] := p[0] + (20,0) *le ;
p[2] := p[0] + (40,0) *le ;

p[3] := 0.5[p[0],p[1]] + (0,-12)*le ;

p[4] := 0.5[p[1],p[2]] + (0,-24)*le ;

draw p[0] -- p[3] ;
draw p[1] -- p[3] ;

draw p[3]+(0,-6)*le -- p[4] ;
draw p[2] -- p[4] ;


label(btex $\{x,y\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{\neg x\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{y\}$ etex, p[2]+(0,3)*le) ;

label(btex $\{\neg y\}$ etex, p[3]-(0,3)*le) ;
label(btex $\Box$ etex, p[4]-(0,3)*le) ;

endfig ;

%%%%%%%%%%%%%%%%%%%%%%
% Beispiel-Resolution

beginfig(3) ;

p[0] := null ;
p[1] := p[0] + (20,0) *le ;
p[2] := p[0] + (40,0) *le ;
p[3] := p[0] + (60,0) *le ;

p[4] := 0.5[p[0],p[1]] + (0,-12)*le ;
p[5] := 0.5[p[2],p[3]] + (0,-12)*le ;

p[6] := 0.5[p[4],p[5]] + (0,-12)*le ;

draw p[0] -- p[4] ;
draw p[1] -- p[4] ;
draw p[2] -- p[5] ;
draw p[3] -- p[5] ;

draw p[4]+(0,-6)*le -- p[6] ;
draw p[5]+(0,-6)*le -- p[6] ;

label(btex $\{x,y\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{\neg x,y\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{x,\neg y\}$ etex, p[2]+(0,3)*le) ;
label(btex $\{\neg x,\neg y\}$ etex, p[3]+(0,3)*le) ;

label(btex $\{y\}$ etex, p[4]-(0,3)*le) ;
label(btex $\{\neg y\}$ etex, p[5]-(0,3)*le) ;
label(btex $\Box$ etex, p[6]-(0,3)*le) ;

endfig ;

%%%%%%%%%%%%%%%%%%%%%%
% Beispiel-Resolution: Widerlegung von S^x

beginfig(4) ;

p[0] := null ;
p[1] := p[0] + (20,0) *le ;
p[2] := p[0] + (40,0) *le ;

p[3] := 0.5[p[0],p[1]] + (0,-12)*le ;

p[4] := 0.5[p[1],p[2]] + (0,-24)*le ;

draw p[0] -- p[3] ;
draw p[1] -- p[3] ;

draw p[3]+(0,-6)*le -- p[4] ;
draw p[2] -- p[4] ;


label(btex $\{u, \neg w\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{u,w \}$ etex, p[1]+(0,3)*le) ;
label(btex $\{\neg u\}$ etex, p[2]+(0,3)*le) ;

label(btex $\{u \}$ etex, p[3]-(0,3)*le) ;
label(btex $\Box$ etex, p[4]-(0,3)*le) ;

endfig ;

%%%%%%%%%%%%%%%%%%%%%%
% Beispiel-Resolution: Widerlegung von S^{\neg x}

beginfig(5) ;

p[0] := null ;
p[1] := p[0] + (20,0) *le ;
p[2] := p[0] + (40,0) *le ;
p[3] := p[0] + (60,0) *le ;

p[4] := 0.5[p[0],p[1]] + (0,-12)*le ;
p[5] := p[1] + (0,-24)*le ;

p[6] := 0.5[p[0],p[3]] + (0,-36)*le ;

draw p[0] -- p[4] ;
draw p[1] -- p[4] ;

draw p[2] -- p[5] ;
draw p[4]+(0,-6)*le -- p[5] ;

draw p[3] -- p[6] ;
draw p[5]+(0,-6)*le -- p[6] ;

label(btex $\{u,\neg v,w\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{u,v,w\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{u,\neg w\}$ etex, p[2]+(0,3)*le) ;
label(btex $\{\neg u\}$ etex, p[3]+(0,3)*le) ;

label(btex $\{u,w\}$ etex, p[4]-(0,3)*le) ;
label(btex $\{u\}$ etex, p[5]-(0,3)*le) ;
label(btex $\Box$ etex, p[6]-(0,3)*le) ;

endfig ;


%%%%%%%%%%%%%%%%%%%%%%
% Beispiel-Resolution: Widerlegung von S^x und S^{\neg x}

beginfig(6) ;

p[0] := null ;
p[1] := p[0] + (25,0) *le ;
p[2] := p[0] + (50,0) *le ;

p[3] := 0.5[p[0],p[1]] + (0,-12)*le ;

p[4] := 0.5[p[1],p[2]] + (0,-24)*le ;

draw p[0] -- p[3] ;
draw p[1] -- p[3] ;

draw p[3]+(0,-6)*le -- p[4] ;
draw p[2] -- p[4] ;


label(btex $\{u, \neg w\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{u,w\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{\neg u\}$ etex, p[2]+(0,3)*le) ;

label(btex $\{u \}$ etex, p[3]-(0,3)*le) ;
label(btex $\Box$ etex, p[4]-(0,3)*le) ;


p[10] := p[0] + (80,0)*le ; 
p[11] := p[10] + (25,0) *le ;
p[12] := p[10] + (45,0) *le ;
p[13] := p[10] + (65,0) *le ;

p[14] := 0.5[p[10],p[11]] + (0,-12)*le ;
p[15] := p[11] + (0,-24)*le ;

p[16] := 0.5[p[10],p[13]] + (0,-36)*le ;

draw p[10] -- p[14] ;
draw p[11] -- p[14] ;

draw p[12] -- p[15] ;
draw p[14]+(0,-6)*le -- p[15] ;

draw p[13] -- p[16] ;
draw p[15]+(0,-6)*le -- p[16] ;

label(btex $\{u,\neg v,w\}$ etex, p[10]+(0,3)*le) ;
label(btex $\{u,v,w\}$ etex, p[11]+(0,3)*le) ;
label(btex $\{u,\neg w\}$ etex, p[12]+(0,3)*le) ;
label(btex $\{\neg u\}$ etex, p[13]+(0,3)*le) ;

label(btex $\{u,w\}$ etex, p[14]-(0,3)*le) ;
label(btex $\{u\}$ etex, p[15]-(0,3)*le) ;
label(btex $\Box$ etex, p[16]-(0,3)*le) ;

endfig ;

%%%%%%%%%%%%%%%%%%%%%%
% Beispiel-Resolution: Widerlegung von S

beginfig(7) ;

p[0] := null ;
p[1] := p[0] + (25,0) *le ;
p[2] := p[0] + (50,0) *le ;

p[3] := 0.5[p[0],p[1]] + (0,-12)*le ;

p[4] := 0.5[p[1],p[2]] + (0,-24)*le ;

draw p[0] -- p[3] ;
draw p[1] -- p[3] ;

draw p[3]+(0,-6)*le -- p[4] ;
draw p[2] -- p[4] ;


label(btex $\{u, \neg w\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{u,w,\fbox{$\neg x$} \}$ etex, p[1]+(0,3)*le) ;
label(btex $\{\neg u,\fbox{$\neg x$}\}$ etex, p[2]+(0,3)*le) ;

label(btex $\{u,\fbox{$\neg x$} \}$ etex, p[3]-(0,3)*le) ;
label(btex $\{\fbox{$\neg x$}\}$ etex, p[4]-(0,3)*le) ;


p[10] := p[0] + (80,0)*le ; 
p[11] := p[10] + (25,0) *le ;
p[12] := p[10] + (45,0) *le ;
p[13] := p[10] + (65,0) *le ;

p[14] := 0.5[p[10],p[11]] + (0,-12)*le ;
p[15] := p[11] + (0,-24)*le ;

p[16] := 0.5[p[10],p[13]] + (0,-36)*le ;

draw p[10] -- p[14] ;
draw p[11] -- p[14] ;

draw p[12] -- p[15] ;
draw p[14]+(0,-6)*le -- p[15] ;

draw p[13] -- p[16] ;
draw p[15]+(0,-6)*le -- p[16] ;

label(btex $\{u,\neg v,w,\fbox{$x$}\}$ etex, p[10]+(0,3)*le) ;
label(btex $\{u,v,w,\fbox{$x$}\}$ etex, p[11]+(0,3)*le) ;
label(btex $\{u,\neg w\}$ etex, p[12]+(0,3)*le) ;
label(btex $\{\neg u,\fbox{$x$}\}$ etex, p[13]+(0,3)*le) ;

label(btex $\{u,w,\fbox{$x$}\}$ etex, p[14]-(0,3)*le) ;
label(btex $\{u,\fbox{$x$}\}$ etex, p[15]-(0,3)*le) ;
label(btex $\{\fbox{$x$}\}$ etex, p[16]-(0,3)*le) ;

p[17] := 0.5[p[4],p[16]] + (0,-20)*le ;

draw p[4]+(0,-6)*le -- p[17] ;
draw p[16]+(0,-6)*le -- p[17] ;

label(btex $\Box$ etex, p[17]-(0,3)*le) ;


endfig ;

%%%%%%%%%%%%%%%%%%%%%%%%
% Noch ein Resoltuionsbeispiel

beginfig(8) ;

breite := 20 ;
hoehe := 12 ;

p[0] := null ;
p[1] := p[0] + (breite,0)*le ;
p[2] := p[1] + (1.5*breite,0)*le ;
p[3] := p[2] + (breite,0)*le ;
p[4] := p[3] + (breite,0)*le ;
p[5] := p[4] + (breite,0)*le ;

p[6] := p[0] + (breite/3,-hoehe)*le ;

p[7] := p[6] + (breite/3,-hoehe)*le ;

p[8] := p[7] + (breite/3,-hoehe)*le ;

p[9] := p[8] + (breite,-hoehe)*le ;
p[10] := p[9] +(3*breite,0) *le ;

p[11] := 0.25[p[9],p[10]] + (0,-hoehe)*le;
p[12] := 0.75[p[9],p[10]] + (0,-hoehe)*le;

p[13] := 0.5[p[11],p[12]] + (0,-hoehe)*le;


draw p[0] -- p[6] ;
draw p[1] -- p[6] ;

draw p[2] -- p[7] ;
draw p[6]+(0,-6)*le -- p[7] ;

draw p[1] -- p[8] ;
draw p[7]+(0,-6)*le -- p[8] ;

draw p[3] -- p[9] ;
draw p[8]+(0,-6)*le -- p[9] ;
draw p[8]+(0,-6)*le -- p[10] ;
draw p[5] -- p[10] ;

draw p[9]+(0,-6)*le -- p[11] ;
draw p[4] -- p[11] ;

draw p[9]+(0,-6)*le -- p[12] ;
draw p[10]+(0,-6)*le -- p[12] ;

draw p[11]+(0,-6)*le -- p[13] ;
draw p[12]+(0,-6)*le -- p[13] ;



label(btex $\{\neg x, y\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{\neg y, z\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{x, y, z\}$ etex, p[2]+(0,3)*le) ;
label(btex $\{x,\neg z\}$ etex, p[3]+(0,3)*le) ;
label(btex $\{\neg x, y\}$ etex, p[4]+(0,3)*le) ;
label(btex $\{\neg x, \neg y, \neg z\}$ etex, p[5]+(0,3)*le) ;

label(btex $\{\neg x, z\}$ etex, p[6]+(0,-3)*le) ;

label(btex $\{y, z\}$ etex, p[7]+(0,-3)*le) ;

label(btex $\{z\}$ etex, p[8]+(0,-3)*le) ;

label(btex $\{x\}$ etex, p[9]+(0,-3)*le) ;
label(btex $\{\neg x, \neg y\}$ etex, p[10]+(0,-3)*le) ;

label(btex $\{y\}$ etex, p[11]+(0,-3)*le) ;
label(btex $\{\neg y\}$ etex, p[12]+(0,-3)*le) ;

label(btex $\Box$ etex, p[13]+(0,-3)*le) ;



endfig;


end.
