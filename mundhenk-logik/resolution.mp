%%  Resolutionsgraphen und mehr

verbatimtex
%&latex
%% Die letzte Zeile ist um Metapost zu erklären, welches System es zum
%% übersetzen des TeX-Teils verwenden soll
\documentclass{article}
\usepackage{latexsym,ngerman,amssymb}
%%\usepackage{times,mathpazo}
\RequirePackage{amssymb}
\newcommand{\leqs}{\leqslant}
\newcommand{\geqs}{\geqslant}
\renewcommand{\leq}{\leqs}
\begin{document}
etex ;

% input TFtools ;
% input MMgraphtools ;
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
p[1] := p[0] + (-20,10) *le ;
p[2] := p[0] + (20,10) *le ;

draw p[0] -- p[1] ;
draw p[0] -- p[2] ;

label(btex $R$ etex, p[0]-(0,3)*le) ;
label(btex $C_1$ etex, p[1]+(0,3)*le) ;
label(btex $C_2$ etex, p[2]+(0,3)*le) ;

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


label(btex $\{A,B\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{\neg A\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{B\}$ etex, p[2]+(0,3)*le) ;

label(btex $\{\neg B\}$ etex, p[3]-(0,3)*le) ;
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

label(btex $\{A,B\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{\neg A,B\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{A,\neg B\}$ etex, p[2]+(0,3)*le) ;
label(btex $\{\neg A,\neg B\}$ etex, p[3]+(0,3)*le) ;

label(btex $\{B\}$ etex, p[4]-(0,3)*le) ;
label(btex $\{\neg B\}$ etex, p[5]-(0,3)*le) ;
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


label(btex $\{B, \neg D\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{B,D \}$ etex, p[1]+(0,3)*le) ;
label(btex $\{\neg B\}$ etex, p[2]+(0,3)*le) ;

label(btex $\{B \}$ etex, p[3]-(0,3)*le) ;
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

label(btex $\{B,\neg C,D\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{B,C,D\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{B,\neg D\}$ etex, p[2]+(0,3)*le) ;
label(btex $\{\neg B\}$ etex, p[3]+(0,3)*le) ;

label(btex $\{B,D\}$ etex, p[4]-(0,3)*le) ;
label(btex $\{B\}$ etex, p[5]-(0,3)*le) ;
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


label(btex $\{B, \neg D\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{B,D\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{\neg B\}$ etex, p[2]+(0,3)*le) ;

label(btex $\{B \}$ etex, p[3]-(0,3)*le) ;
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

label(btex $\{B,\neg C,D\}$ etex, p[10]+(0,3)*le) ;
label(btex $\{B,C,D\}$ etex, p[11]+(0,3)*le) ;
label(btex $\{B,\neg D\}$ etex, p[12]+(0,3)*le) ;
label(btex $\{\neg B\}$ etex, p[13]+(0,3)*le) ;

label(btex $\{B,D\}$ etex, p[14]-(0,3)*le) ;
label(btex $\{B\}$ etex, p[15]-(0,3)*le) ;
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


label(btex $\{B, \neg D\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{B,D,\fbox{$\neg A$} \}$ etex, p[1]+(0,3)*le) ;
label(btex $\{\neg B,\fbox{$\neg A$}\}$ etex, p[2]+(0,3)*le) ;

label(btex $\{B,\fbox{$\neg A$} \}$ etex, p[3]-(0,3)*le) ;
label(btex $\{\fbox{$\neg A$}\}$ etex, p[4]-(0,3)*le) ;


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

label(btex $\{B,\neg C,D,\fbox{$A$}\}$ etex, p[10]+(0,3)*le) ;
label(btex $\{B,C,D,\fbox{$A$}\}$ etex, p[11]+(0,3)*le) ;
label(btex $\{B,\neg D\}$ etex, p[12]+(0,3)*le) ;
label(btex $\{\neg B,\fbox{$A$}\}$ etex, p[13]+(0,3)*le) ;

label(btex $\{B,D,\fbox{$A$}\}$ etex, p[14]-(0,3)*le) ;
label(btex $\{B,\fbox{$A$}\}$ etex, p[15]-(0,3)*le) ;
label(btex $\{\fbox{$A$}\}$ etex, p[16]-(0,3)*le) ;

p[17] := 0.5[p[4],p[16]] + (0,-20)*le ;

draw p[4]+(0,-6)*le -- p[17] ;
draw p[16]+(0,-6)*le -- p[17] ;

label(btex $\Box$ etex, p[17]-(0,3)*le) ;


endfig ;

%%%%%%%%%%%%%%%%%%%%%%%%
% Noch ein Resolutionsbeispiel

beginfig(8) ;

breite := 20 ;
hoehe := 12 ;

p[0] := null ;
p[1] := p[0] + (breite,0)*le ;
p[2] := p[1] + (1.5*breite,0)*le ;
p[3] := p[2] + (breite,0)*le ;
p[4] := p[3] + (breite,0)*le ;
p[5] := p[4] + (breite,0)*le ;

p[6] := p[1] + (0.5*breite,-hoehe)*le ;

p[7] := p[2] + (-0.5*breite,-2*hoehe)*le ;

p[8] := p[1] + (0,-3*hoehe)*le ;

p[9] := p[8] + (breite,-hoehe)*le ;
p[10] := p[9] +(3*breite,0) *le ;

p[11] := 0.25[p[9],p[10]] + (0,-hoehe)*le;
p[12] := 0.75[p[9],p[10]] + (0,-hoehe)*le;

p[13] := 0.5[p[11],p[12]] + (0,-hoehe)*le;


draw p[4] -- p[6] ;
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



% label(btex $\{\neg A, B\}$ etex, p[0]+(0,3)*le) ;
label(btex $\{\neg B, C\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{A, B, C\}$ etex, p[2]+(0,3)*le) ;
label(btex $\{A,\neg C\}$ etex, p[3]+(0,3)*le) ;
label(btex $\{\neg A, B\}$ etex, p[4]+(0,3)*le) ;
label(btex $\{\neg A, \neg B, \neg C\}$ etex, p[5]+(0,3)*le) ;

label(btex $\{\neg A, C\}$ etex, p[6]+(0,-3)*le) ;

label(btex $\{B, C\}$ etex, p[7]+(0,-3)*le) ;

label(btex $\{C\}$ etex, p[8]+(0,-3)*le) ;

label(btex $\{A\}$ etex, p[9]+(0,-3)*le) ;
label(btex $\{\neg A, \neg B\}$ etex, p[10]+(0,-3)*le) ;

label(btex $\{B\}$ etex, p[11]+(0,-3)*le) ;
label(btex $\{\neg B\}$ etex, p[12]+(0,-3)*le) ;

label(btex $\Box$ etex, p[13]+(0,-3)*le) ;

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%

% Noch ein Resolutionsbeispiel (Aufgabenblatt 4, Aufg 1)

beginfig(9) ;

breite := 20 ;
hoehe := 12 ;

p[1] := null ;
p[2] := p[1] + (breite,0)*le ;
p[3] := p[2] + (breite,0)*le ;
p[4] := p[3] + (breite,0)*le ;
p[5] := p[4] + (breite,0)*le ;
p[6] := p[5] + (breite,0)*le ;
p[7] := p[6] + (breite,0)*le ;
p[8] := p[7] + (breite,0)*le ;


p[10] := 0.5[p[1],p[2]] + (0,-hoehe)*le ;
p[11] := 0.5[p[3],p[4]] + (0,-hoehe)*le ;
p[12] := 0.5[p[5],p[6]] + (0,-hoehe)*le ;
p[13] := 0.5[p[7],p[8]] + (0,-hoehe)*le ;

p[20] := 0.5[p[10],p[11]] + (0,-hoehe)*le ;
p[21] := 0.5[p[12],p[13]] + (0,-hoehe)*le ;

p[30] := 0.5[p[20],p[21]] + (0,-hoehe)*le ;


draw p[1] -- p[10] ;
draw p[2] -- p[10] ;
draw p[3] -- p[11] ;
draw p[4] -- p[11] ;
draw p[5] -- p[12] ;
draw p[6] -- p[12] ;
draw p[7] -- p[13] ;
draw p[8] -- p[13] ;


draw p[10]+(0,-5)*le -- p[20] ;
draw p[11]+(0,-5)*le -- p[20] ;
draw p[12]+(0,-5)*le -- p[21] ;
draw p[13]+(0,-5)*le -- p[21] ;

draw p[20]+(0,-5)*le -- p[30] ;
draw p[21]+(0,-5)*le -- p[30] ;


label(btex $\{\neg A, \neg B, \neg C\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{\neg A, \neg B,      C\}$ etex, p[2]+(0,3)*le) ;
label(btex $\{\neg A,      B, \neg C\}$ etex, p[3]+(0,3)*le) ;
label(btex $\{\neg A,      B,      C\}$ etex, p[4]+(0,3)*le) ;
label(btex $\{     A, \neg B, \neg C\}$ etex, p[5]+(0,3)*le) ;
label(btex $\{     A, \neg B,      C\}$ etex, p[6]+(0,3)*le) ;
label(btex $\{     A,      B, \neg C\}$ etex, p[7]+(0,3)*le) ;
label(btex $\{     A,      B,      C\}$ etex, p[8]+(0,3)*le) ;

label(btex $\{\neg A, \neg B \}$ etex, p[10]+(0,-3)*le) ;
label(btex $\{\neg A,      B \}$ etex, p[11]+(0,-3)*le) ;
label(btex $\{     A, \neg B \}$ etex, p[12]+(0,-3)*le) ;
label(btex $\{     A,      B \}$ etex, p[13]+(0,-3)*le) ;

label(btex $\{\neg A \}$ etex, p[20]+(0,-3)*le) ;
label(btex $\{     A \}$ etex, p[21]+(0,-3)*le) ;

label(btex $\Box$ etex, p[30]+(0,-3)*le) ;



endfig;

%%%%%%%%%%%%%%%%%%%%%%%%

% Noch ein Resolutionsbeispiel (Aufgabenblatt 4, Aufg 2)

beginfig(10) ;

breite := 20 ;
hoehe := 12 ;

p[1] := null ;
p[2] := p[1] + (breite,0)*le ;
p[3] := p[2] + (breite,0)*le ;
p[4] := p[3] + (breite,0)*le ;
p[5] := p[4] + (breite,0)*le ;
p[6] := p[5] + (breite,0)*le ;
p[7] := p[6] + (breite,0)*le ;
p[8] := p[7] + (breite,0)*le ;


p[10] := 0.5[p[1],p[2]] + (0,-hoehe)*le ;
p[11] := p[3] + (0,-hoehe)*le ;

p[20] := 0.5[p[11],p[12]] + (0,-hoehe)*le ;


p[30] := 0.5[p[20],p[21]] + (0,-hoehe)*le ;


draw p[3] -- p[11] ;
draw p[4] -- p[11] ;
draw p[3] -- p[12] ;
draw p[5] -- p[12] ;



draw p[12]+(0,-5)*le -- p[20] ;
draw p[11]+(0,-5)*le -- p[20] ;


draw p[20]+(0,-5)*le -- p[30] ;
draw p[7] -- p[30] ;


label(btex $\{A, B, \neg C\}$ etex, p[1]+(0,3)*le) ;
label(btex $\{\neg A, B, D\}$ etex, p[2]+(0,3)*le) ;
label(btex $\{C, D \}$ etex, p[3]+(0,3)*le) ;
label(btex $\{\neg A, \neg D \}$ etex, p[4]+(0,3)*le) ;
label(btex $\{     A, C, \neg D\}$ etex, p[5]+(0,3)*le) ;
label(btex $\{ \neg B\}$ etex, p[6]+(0,3)*le) ;
label(btex $\{ \neg C\}$ etex, p[7]+(0,3)*le) ;


label(btex $\{\neg A,      C \}$ etex, p[11]+(0,-3)*le) ;
label(btex $\{     A,      C \}$ etex, p[12]+(0,-3)*le) ;

label(btex $\{ C \}$ etex, p[20]+(0,-3)*le) ;


label(btex $\Box$ etex, p[30]+(0,-3)*le) ;

endfig;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Illustration zu konsistenten Erweiterungen von Theorien
%

beginfig(11) ;

breite := 40 ;
hoehe  := 20 ;

pair zz[];

zz[0] := null+(-breite,0)*le ;
zz[2] := null+(breite,0)*le ;
zz[1] := null+(0,hoehe)*le ;
zz[3] := -zz[1] ;

path aussenkreis ;
aussenkreis := zz0 .. zz1 .. zz2 .. zz3 .. cycle ;
fill aussenkreis withcolor 0.9white ;

path mittelachse ;
mittelachse := zz1--zz3 ;

path abpp ;
abpp := buildcycle(aussenkreis, mittelachse) ;
fill abpp withcolor white ;
draw aussenkreis ;

pair formeln[] ;

formeln0 := null +(-(5*breite)/8, 10)*le ;
formeln1 := null +((5*breite)/8, 10)*le ;
thbreite := 9;
thhoehe := 10 ;

path formelkreis ;
formelkreis :=  formeln0+(0,3)*le .. formeln0+(thbreite,-thhoehe)*le ..
     formeln0+(0,-2*thhoehe)*le .. formeln0+(-thbreite,-thhoehe)*le .. cycle ;
fill formelkreis withcolor 0.7white ;


%% Die Formeln und Theoreme der abgeschlossenen Erweiterung von K

formeln2 := null +(-(2*breite)/8, hoehe/2)*le ;
formeln3 := null +((2*breite)/8+2, hoehe/2)*le ;

abbreite := 12 ;
abhoehe := 20 ;

label(btex $\neg\alpha_6$ etex, formeln2) ;
label(btex $\neg\alpha_{13}$ etex, formeln2+(2,-9)*le) ;
label(btex $\alpha_{23}$ etex, formeln2+(4,-18)*le) ;
label(btex $\neg\alpha_{45}$ etex, formeln2+(0,-24)*le) ; 

label(btex $\alpha_6$ etex, formeln3) ;
label(btex $\alpha_{13}$ etex, formeln3+(-2,-9)*le) ;
label(btex $\neg\alpha_{23}$ etex, formeln3+(-4,-18)*le) ;
label(btex $\alpha_{45}$ etex, formeln3+(0,-24)*le) ; 



%% Die Formeln und Theoreme der (untersten) Theorie K


draw formelkreis ;

label(btex $\alpha_4$ etex, formeln0) ;
label(btex $\neg\alpha_{12}$ etex, formeln0+(-4,-6)*le) ;
label(btex $\alpha_{42}$ etex, formeln0+(6,-9)*le) ;
label(btex $\neg\alpha_{52}$ etex, formeln0+(0,-14)*le) ; 

label(btex $\neg\alpha_4$ etex, formeln1) ;
label(btex $\alpha_{12}$ etex, formeln1+(-4,-6)*le) ;
label(btex $\neg\alpha_{42}$ etex, formeln1+(6,-9)*le) ;
label(btex $\alpha_{52}$ etex, formeln1+(0,-14)*le) ; 


endfig ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Illustration zu konsistenten und T-produktiven Erweiterungen von Theorien
%

beginfig(12) ;

breite := 40 ;
hoehe  := 20 ;

pair zz[];

zz[0] := null+(-breite,0)*le ;
zz[2] := null+(breite,0)*le ;
zz[1] := null+(0,hoehe)*le ;
zz[3] := -zz[1] ;

path aussenkreis ;
aussenkreis := zz0 .. zz1 .. zz2 .. zz3 .. cycle ;

path aussenrechteck ;
aussenrechteck := null+(-1.2*breite, 1.2*hoehe)*le --
                  null+(1.2*breite,  1.2*hoehe)*le --
                  null+(1.2*breite, -1.2*hoehe)*le --
                  null+(-1.2*breite, -1.2*hoehe)*le -- cycle ;
fill aussenrechteck withcolor 0.9white ;

path mittelachse ;
mittelachse := null+(0,1.5*hoehe)*le--null+(0,-1.5*hoehe)*le ;

path abpp ;
abpp := buildcycle(aussenrechteck, mittelachse) ;
fill abpp withcolor white ;
draw aussenkreis ;
draw aussenrechteck ;

pair formeln[] ;

formeln0 := null +(-(5*breite)/8, 10)*le ;
formeln1 := null +((5*breite)/8, 10)*le ;
thbreite := 9;
thhoehe := 10 ;

path formelkreis ;
formelkreis :=  formeln0+(0,3)*le .. formeln0+(thbreite,-thhoehe)*le ..
     formeln0+(0,-2*thhoehe)*le .. formeln0+(-thbreite,-thhoehe)*le .. cycle ;
fill formelkreis withcolor 0.7white ;

%% Die Formeln, die durch die neuen Konstantensymbole hinzukommen

formeln4:=null+(-1*breite,1*hoehe)*le ;
formeln5:=null+(1*breite,1*hoehe)*le ;

label(btex $\neg\alpha_1$ etex, formeln4) ;
label(btex $\alpha_5$ etex, formeln4+(-1,-6)*le ) ;
label(btex $\alpha_{17}$ etex, formeln4+(12,0)*le ) ;
label(btex $\neg \alpha_{4711}$ etex, formeln4+(6,-2*hoehe)*le ) ;

label(btex $\alpha_1$ etex, formeln5) ;
label(btex $\neg\alpha_5$ etex, formeln5+(1,-6)*le ) ;
label(btex $\neg\alpha_{17}$ etex, formeln5+(-12,0)*le ) ;
label(btex $\alpha_{4711}$ etex, formeln5+(-6,-2*hoehe)*le ) ;


%% Die Formeln und Theoreme der abgeschlossenen Erweiterung von K

formeln2 := null +(-(2*breite)/8, hoehe/2)*le ;
formeln3 := null +((2*breite)/8+2, hoehe/2)*le ;

abbreite := 12 ;
abhoehe := 20 ;

label(btex $\neg\alpha_6$ etex, formeln2) ;
label(btex $\neg\alpha_{13}$ etex, formeln2+(2,-9)*le) ;
label(btex $\alpha_{23}$ etex, formeln2+(4,-18)*le) ;
label(btex $\neg\alpha_{45}$ etex, formeln2+(0,-24)*le) ; 

label(btex $\alpha_6$ etex, formeln3) ;
label(btex $\alpha_{13}$ etex, formeln3+(-2,-9)*le) ;
label(btex $\neg\alpha_{23}$ etex, formeln3+(-4,-18)*le) ;
label(btex $\alpha_{45}$ etex, formeln3+(0,-24)*le) ; 



%% Die Formeln und Theoreme der (untersten) Theorie K


%draw formelkreis ;

label(btex $\alpha_4$ etex, formeln0) ;
label(btex $\neg\alpha_{12}$ etex, formeln0+(-4,-6)*le) ;
label(btex $\alpha_{42}$ etex, formeln0+(6,-9)*le) ;
label(btex $\neg\alpha_{52}$ etex, formeln0+(0,-14)*le) ; 

label(btex $\neg\alpha_4$ etex, formeln1) ;
label(btex $\alpha_{12}$ etex, formeln1+(-4,-6)*le) ;
label(btex $\neg\alpha_{42}$ etex, formeln1+(6,-9)*le) ;
label(btex $\alpha_{52}$ etex, formeln1+(0,-14)*le) ; 


endfig ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Das "nette Bildchen" von der Zerlegung der al.Formeln
%  in gültige, unerfüllbare und alle anderen
%

beginfig(13) ;

breite := 60 ;
hoehe  := 30 ;

pair zz[];

zz[0] := null+(-breite,0)*le ;
zz[2] := null+(breite,0)*le ;
zz[1] := null+(0,hoehe)*le ;
zz[3] := -zz[1] ;

path aussenkreis ;
aussenkreis := zz0 .. zz1 .. zz2 .. zz3 .. cycle ;
draw aussenkreis ;

path grenze[] ;
grenze[1] := aussenkreis intersectionpoint (null -- null+(-0.5*breite,hoehe)*le)
            ... null +(-0.3*breite,0)*le ...
             aussenkreis intersectionpoint (null -- null+(-0.5*breite,-hoehe)*le) ;
draw grenze[1] ;

grenze[2] := aussenkreis intersectionpoint (null -- null+(0.5*breite,hoehe)*le)
            ... null +(0.3*breite,0)*le ...
             aussenkreis intersectionpoint (null -- null+(0.5*breite,-hoehe)*le) ;
draw grenze[2] ;

label(btex $A\rightarrow(B\rightarrow A)$ etex, null+(-0.6*breite,10)*le) ;
label(btex $\neg(A\vee \neg B)\rightarrow \neg A$ etex, null+(-0.7*breite,0)*le) ;
label(btex Tautologien etex, null+(-0.6*breite,-14)*le) ;

label(btex $A \wedge \neg A$ etex, null+(0.6*breite,10)*le) ;
label(btex $\neg(A \rightarrow (\neg A \rightarrow B))$ etex, null+(0.7*breite,0)*le) ;
label(btex unerf\"ullbare Formeln etex, null+(0.63*breite,-14)*le) ;

label(btex $A \wedge (B \vee \neg A)$ etex, null+(0,10)*le) ;
label(btex $(A \rightarrow B) \vee (\neg A \wedge B)$ etex, null) ;
label(btex erf\"ullbare Formeln, die etex, null+(0,-14)*le) ;
label(btex keine Tautologien sind etex, null+(0,-19)*le) ;
endfig ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Der Aufbau einer Formel

beginfig(14) ;

def unter(expr pp) =
pp+(0,-3)*le 
enddef ;

def ueber(expr pp)=
pp+(0,3)*le 
enddef ;

def punter(expr pp)=
pp+(0,-6)*le
enddef ;


breite := 20 ;

hoehe := 12; 

pair p[] ;

p[0] := null ;
p[1] := null + (breite,0)*le ;
p[2] := p[1] + (breite,0)*le ;

label(btex $A$ etex, unter(p[0])) ;
label(btex $B$ etex, unter(p[2])) ;


p[3] := p[1] + (0,-hoehe*le) ;
label(btex $\neg A$ etex, unter(p[3])) ;

draw punter(p[0])--p[3] ;

p[4]:=p[3]+(breite/2,-hoehe)*le ;
label(btex $\neg A\rightarrow B$ etex, unter(p[4])) ;

draw punter(p[3]) -- p[4] ;
draw punter(p[2]) -- p[4] ;

p[5]:=p[4]+(0,-hoehe)*le ;
label(btex $\neg(\neg A\rightarrow B)$ etex, unter(p[5])) ;
draw punter(p[4]) -- p[5] ;

p[6]:=p[5]+(-breite/2,-hoehe)*le ;
label(btex $A\rightarrow \neg(\neg A\rightarrow B)$ etex, unter(p[6])) ;
draw punter(p[5]) -- p[6] ;
draw punter(p[0]) -- p[6] ;



endfig ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Der Aufbau einer Formel

beginfig(15) ;

def unter(expr pp) =
pp+(0,-3)*le 
enddef ;

def ueber(expr pp)=
pp+(0,3)*le 
enddef ;

def punter(expr pp)=
pp+(0,-6)*le
enddef ;


breite := 20 ;

hoehe := 12; 

pair p[] ;

p[0] := null ;
p[1] := null + (breite,0)*le ;
p[2] := p[1] + (breite,0)*le ;

label(btex $\mathcal{A} \vdash A$ etex, unter(p[0])) ;
label(btex $\mathcal{A} \vdash \neg B$ etex, unter(p[2])) ;


p[3] := p[1] + (0,-hoehe*le) ;
label(btex $\mathcal{A} \vdash \neg\neg A$ etex, unter(p[3])) ;

draw punter(p[0])--p[3] ;

p[4]:=p[3]+(breite/2,-hoehe)*le ;
label(btex $\mathcal{A} \vdash \neg A\rightarrow B$ etex, unter(p[4])) ;

draw punter(p[3]) -- p[4] ;
draw punter(p[2]) -- p[4] ;

p[5]:=p[4]+(0,-hoehe)*le ;
label(btex $\mathcal{A} \vdash \neg\neg(\neg A\rightarrow B)$ etex, unter(p[5])) ;
draw punter(p[4]) -- p[5] ;

p[6]:=p[5]+(-breite/2,-hoehe)*le ;
label(btex $\mathcal{A} \vdash \neg(A\rightarrow \neg(\neg A\rightarrow B)$ etex, unter(p[6]))) ;
draw punter(p[5]) -- p[6] ;
draw punter(p[0]) -- p[6] ;



endfig ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Der Aufbau eines Beweises fuer eine Formel

beginfig(16) ;

def unter(expr pp) =
pp+(0,-3)*le 
enddef ;

def ueber(expr pp)=
pp+(0,3)*le 
enddef ;

def punter(expr pp)=
pp+(0,-6)*le
enddef ;


breite := 30 ;

hoehe := 12; 

pair p[] ;

p[0] := null ;
p[1] := null + (breite,0)*le ;
p[2] := p[1] + (breite,0)*le ;

label(btex \begin{array}[t]{llr}
      (1) & A & \mbox{Hypothese}
    \end{array}
     etex, unter(p[0])) ;

label(btex     \begin{array}[t]{llr}
      (2) & \neg B &\mbox{Hypothese}
    \end{array}
 etex, unter(p[2])) ;


p[3] := p[1] + (0,-hoehe*le) ;
label(btex  
    \begin{array}[t]{llr}
      (3) & A \rightarrow \neg\neg A &\mbox{Lemma}\\
      (4) & \neg\neg A &\mbox{MP 1,3}
    \end{array}
 etex, unter(unter(p[3]))) ;

draw punter(p[0])--p[3] ;

p[4]:=p[3]+(breite/2,-1.5*hoehe)*le ;
label(btex
    \begin{array}[t]{llr}
      (5) & \neg\neg A \rightarrow (\neg A\rightarrow B)
         &\mbox{Lemma}\\
      (6) & \neg A\rightarrow B &\mbox{MP 4,5}
    \end{array}
       etex, unter(unter(p[4]))) ;

draw punter(punter(p[3])) -- p[4] ;
draw punter(p[2]) -- p[4] ;

p[5]:=p[4]+(0,-1.5*hoehe)*le ;
label(btex
    \begin{array}[t]{llr}
      (7)& (\neg A\rightarrow B) \rightarrow \neg\neg (\neg
         A\rightarrow B) &\mbox{Lemma}\\
      (8) & \neg\neg(\neg A\rightarrow B) &\mbox{MP 6,7}
    \end{array}
    etex, unter(unter(p[5]))+(4,0)*le) ;
draw punter(punter(p[4])) -- p[5] ;

p[6]:=p[5]+(-breite,-1.5*hoehe)*le ;
label(btex       
      \begin{array}[t]{llr}
      (9) & A\rightarrow(\neg\neg (\neg A\rightarrow B)\rightarrow
         \neg(A \rightarrow \neg(\neg A\rightarrow B)))
         &\mbox{Lemma}\\
      (10) & \neg\neg (\neg A\rightarrow B)\rightarrow
         \neg(A \rightarrow \neg(\neg A\rightarrow B))
         &\mbox{MP 1,3}\\
      (11) &  \neg(A \rightarrow \neg(\neg A\rightarrow B))
         &\mbox{MP 2,4}
      \end{array}
  etex, unter(unter(unter(p[6]))) +(19,0)*le) ;
draw punter(punter(p[5])) -- p[6] ;
draw punter(p[0]) -- p[6] ;



endfig ;

end.
