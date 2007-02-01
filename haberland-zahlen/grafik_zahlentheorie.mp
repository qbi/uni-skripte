%======================================
%input tftools;
%=====================================>
def connector=.. enddef;
vardef funcpath(text functerm)(suffix var)(expr xmin,xmax,xstep)=
  for var:=xmin step xstep until xmax:
    (var,functerm) connector
  endfor
  hide(var:=xmax)
  (var,functerm)
enddef;

vardef hatch(expr p,thickness,distance,angle)=
  save q,pic,a,b,c,d;
  numeric a,b,c,d;
  path q;
  picture pic;
  pic=image(
    q:=p rotated -angle;
    (a,c)=llcorner q;
    (b,d)=urcorner q;
    for i:=c step distance until d:
      draw (a,i)--(b,i) withpen pencircle scaled thickness;
    endfor;
  );
  clip pic to q;
  draw pic rotated angle;
enddef;

def pi = 3.141592 enddef;
%<=====================================

vardef ratiopoint(expr x,p)= point (arctime x*arclength p of p) of p enddef;
vardef ratiostelle(expr x,p)= (arctime x*arclength p of p) enddef;

vardef xpartline(expr A)=
  save p;
  path p;
  p := (xpart A,-infinity)--(xpart A,infinity);
  p
enddef;
vardef ypartline(expr A)=
  save p;
  path p;
  p := (-infinity,ypart A)--(infinity,ypart A);
  p
enddef;

%vardef labelpoint(expr A,p)=
%  save S;
%  pair S;
%  S := unitvector(direction xpart(p intersectiontimes xpartline(A)) of p) rotated 90;
%  S
%enddef;

beginfig(1)
  numeric LE,LEsmall;
  pair A,B,C,D;

  LE:=2cm;
  LEsmall:=0.1LE;
  A:=(0,0) scaled LE;
  B:=(3,0) scaled LE;
  C:=(3,2) scaled LE;
  D:=(0,2) scaled LE;

  draw (A+LEsmall*left) --(B+LEsmall*right);
  draw (B+LEsmall*down) --(C+LEsmall*up);
  draw (C+LEsmall*right)--(D+LEsmall*left);
  draw (D+LEsmall*up)   --(A+LEsmall*down);
  draw (-0.1)[A,C]--(1.1)[A,C];

  label.bot(btex $m+{\textstyle{1\over2}}$ etex,B+LEsmall*down);
  label.lft(btex $n+{\textstyle{1\over2}}$ etex,D+LEsmall*left);
  label.urt(btex $y={\textstyle{l\over p}}x$ etex,(1.1)[A,C]);

endfig;

def TeilI=
  numeric LE;
  pair A[],t[];
  path p[];

  xmax := 4;
  xnull := 1/xmax;%0.25;
  delta := 0.2;
  cuthoehe := 2;

  vardef f(expr x)= 1/x enddef;

  LE := 1cm;
  p1 := funcpath(f(x))(x)(xnull,xmax,0.1) scaled LE;
  p2 := funcpath(-1*f(x))(x)(-xmax,-xnull,0.1) scaled LE;
  p3 := funcpath(f(x))(x)(-xmax,-xnull,0.1) scaled LE;
  p4 := funcpath(-1*f(x))(x)(xnull,xmax,0.1) scaled LE;

  p5 := ((-xmax,cuthoehe)--(xmax,cuthoehe)) scaled LE;
  p6 := ((-xmax,-cuthoehe)--(xmax,-cuthoehe)) scaled LE;

  t1 := p1 intersectiontimes p5;
  t2 := p2 intersectiontimes p5;
  t3 := p3 intersectiontimes p6;
  t4 := p4 intersectiontimes p6;
  for i = 1 upto 4:
    A[i] := point xpart t[i] of p[i];
  endfor;

  drawarrow ((-xmax-delta,0)--(xmax+delta,0)) scaled LE;
  drawarrow ((0,-xmax-delta)--(0,xmax+delta)) scaled LE;
  draw p1;
  draw p2;
  draw p3;
  draw p4;
enddef;

beginfig(2)
  TeilI;
endfig;

beginfig(3)
  TeilI;

  p7 := (reverse(p1 cutafter p5))
      --(reverse(p2 cutbefore p5))
      --(p3 cutbefore p6)
      --(p4 cutafter p6)
      --cycle;
  p8 :=(xpart A1,f(xnull)*LE)--(xpart A4,-LE*f(xnull));
  p9 :=(xpart A2,f(xnull)*LE)--(xpart A3,-LE*f(xnull));
%  draw p7;
  draw p8;
  draw p9;
  hatch(p7,0.4pt,1pt,45);
endfig;

beginfig(4)
  draw unitsquare xscaled 2 scaled 2LE withpen pencircle scaled 20pt withcolor 0.7white;
  draw unitsquare xscaled 2 scaled 2LE;
endfig;

beginfig(5)
  numeric r[];
  path p[];
  pair A[];

  vardef f(expr x)= sind((180/pi)*x) enddef;

  LE := 3mm;
  xmin := -2*pi;
  xmax :=  2*pi;
  delta := 0.02;

  p1 := funcpath(1.4*f(0.667*x-0.5*pi))(x)(xmin,xmax,delta) scaled LE;
  r1 := 0.15;
  p2 := subpath (ratiostelle(r1,p1),ratiostelle(1-r1,p1)) of p1;
  A1 := ratiopoint(0  ,p2);
  A2 := ratiopoint(1  ,p2);
  A3 := p2 intersectionpoint xpartline(0.5[A1,A2]);
  r2  := 0.2;
  A4 := ratiopoint(r2,p2);
  A5 := ratiopoint(1-r2,p2);
  A6 := 4*unitvector(direction ratiostelle(r2,p2) of p2) rotated 90;
  A7 := 4*unitvector(direction ratiostelle(1-r2,p2) of p2) rotated 90;
  A8 := 10*unitvector(direction xpart(p2 intersectiontimes xpartline(A3)) of p2) rotated 90;

  p3 := fullcircle scaled (abs(A1-A2)) shifted A3;

  draw p1;% dashed evenly;
  pickup pencircle scaled 1.5pt
  draw (A4+A6)--(A4-A6);
  draw (A5+A7)--(A5-A7);
  draw p2 cutafter p3 cutbefore p3;
  draw p3;

%  draw A3--(A3+A8);
  label(btex $p_1$ etex,A3+A8);
%  dotlabel(btex ~ etex,A3);
  fill fullcircle scaled 5 shifted A3;
endfig;

def Hyperbelbild =
  numeric r[];
  path xachse,yachse,p[];
  pair A[];

  delta := 0.02;
  myeps := 2;

  xachse := ((xmin,0)--(xmax,0)) scaled LE;
  yachse := ((0,ymin)--(0,ymax)) scaled LE;

  p1 := funcpath(1/x)(x)(1/xmax,xmax,delta) scaled LE;
  p2 := funcpath(x)(x)(0,xmax,delta) scaled LE;
  p3 := funcpath(x/(myeps*myeps))(x)(0,xmax,delta) scaled LE;
  p4 := funcpath(-1/x)(x)(1/xmax,xmax,delta) scaled LE;
  p5 := funcpath(-x)(x)(0,xmax,delta) scaled LE;
  p6 := funcpath(-x/(myeps*myeps))(x)(0,xmax,delta) scaled LE;
  A1 := p1 intersectionpoint p2;
  A2 := p1 intersectionpoint p3;
  A3 := p2 intersectionpoint p3;
  A4 := p4 intersectionpoint p5;
  A5 := p4 intersectionpoint p6;
  A6 := p5 intersectionpoint p6;
  A7 := ((xmax+1)*LE,0);
  p7 :=         subpath (xpart (p2 intersectiontimes p3),xpart (p2 intersectiontimes p1)) of p2;
  p8 :=         subpath (xpart (p1 intersectiontimes p2),xpart (p1 intersectiontimes p3)) of p1;
  p9 := reverse subpath (xpart (p3 intersectiontimes p2),xpart (p3 intersectiontimes p1)) of p3;
  p10:= p7--p8--p9--cycle;
  p11:= (reverse p2)--p3--cycle;
  p12:=         subpath (xpart (p5 intersectiontimes p6),xpart (p5 intersectiontimes p4)) of p5;
  p13:=         subpath (xpart (p4 intersectiontimes p5),xpart (p4 intersectiontimes p6)) of p4;
  p14:= reverse subpath (xpart (p6 intersectiontimes p5),xpart (p6 intersectiontimes p4)) of p6;
  p15:= p12--p13--p14--cycle;
  p16:= (reverse p5)--p6--cycle;
enddef;

beginfig(6)
  LE := 10mm;
  xmin := -1;
  xmax :=  4;
  ymin := -4;
  ymax :=  4;

  Hyperbelbild;

  draw xachse; draw yachse;
  for i := 1 upto 6: draw p[i]; endfor;

  hatch(p10,0.4pt,2pt,45);
  hatch(p11,0.4pt,2pt,135);
  hatch(p15,0.4pt,2pt,-45);
  hatch(p16,0.4pt,2pt,-135);

  dotlabel(btex ~ etex,A1);
  dotlabel(btex ~ etex,A2);
  dotlabel(btex ~ etex,A3);
  dotlabel(btex ~ etex,A4);
  dotlabel(btex ~ etex,A5);
  dotlabel(btex ~ etex,A6);
  label.rt(btex $xy=1$ etex,(1/3*LE,3*LE));
  label.rt(btex $xy=-1$ etex,(1/3*LE,-3*LE));
  dotlabel.lrt(btex $\varepsilon_K$ etex,(myeps*LE,0));

  vardef f(expr x)= (x + x/(myeps*myeps))/2 enddef;
  drawarrow A7--((xmax-0.5, f(xmax-0.5)) scaled LE);
  drawarrow A7--((xmax-0.5,-f(xmax-0.5)) scaled LE);
  label.rt(btex $D$ etex,A7);
endfig;

beginfig(7)
  LE := 20mm;
  xmin := 0;
  xmax := 3;
  ymin := 0;
  ymax := 2;

  Hyperbelbild;

  draw xachse; draw yachse;
  for i := 1 upto 3: draw p[i]; endfor;

  hatch(p10,0.4pt,2pt,45);
  hatch(p10,0.4pt,2pt,135);

  clip currentpicture to bbox (((xmin,ymin)--(xmax,ymax)) scaled LE);

  draw ((    1,      1)--(    1,0)) scaled LE;
  draw ((myeps,1/myeps)--(myeps,0)) scaled LE;

  label.bot(btex \strut$\varepsilon$ etex,(myeps*LE,0));
  label.bot(btex \strut$1$           etex,(    1*LE,0));
endfig;

beginfig(8)
  path xachse,yachse;
  pair A,B;

  LE := 10mm;
  xmin := -2;
  xmax :=  2;
  ymin := -1.5;
  ymax :=  1.5;
  xachse := ((xmin,0)--(xmax,0)) scaled LE;
  yachse := ((0,ymin)--(0,ymax)) scaled LE;
  A := ((-1+xmin)/2,-0.1) scaled LE;
  B := ((-1+xmin)/2,-0.5) scaled LE;

  draw xachse; draw yachse;
  draw ((xmin,0)--(0,0)) scaled LE withpen pencircle scaled 2pt;
  drawarrow halfcircle scaled 2LE;
  drawarrow halfcircle reflectedabout(left,right) scaled 2LE;

  drawarrow B--A;
  label.bot(btex Sprung um $2\pi i$ etex scaled 0.8,B+0.5*LE*left);
  dotlabel(btex ~ etex,(1LE,0));
endfig;

beginfig(9)
  path xachse,yachse;

  LE := 10mm;
  xmin := -1;
  xmax :=  4;
  ymin := -2;
  ymax :=  2;
  xachse := ((xmin,0)--(xmax,0)) scaled LE;
  yachse := ((0,ymin)--(0,ymax)) scaled LE;

  draw xachse; draw yachse;
  draw fullcircle scaled 2LE shifted (LE*right);

  dotlabel.llft(btex $0$ etex scaled 0.8,LE*(0,0));
  dotlabel.bot (btex $1$ etex scaled 0.8,LE*(1,0));
  dotlabel.lrt (btex $2$ etex scaled 0.8,LE*(2,0));
endfig;

end.
