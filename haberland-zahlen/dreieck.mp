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
end.
