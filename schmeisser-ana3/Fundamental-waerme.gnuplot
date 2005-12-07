set style line 2 linewidth 2

# scale outout to 70%
set size .7, .7
set output "Fundamental-waerme.eps"
set terminal epslatex color

Phi(x,t) = 1/(4*pi*t)**(n/2) * exp(-abs(x)**2/4*t)

n=2

plot [-7:7] Phi(x, 0.6) title "$\\Phi(x, 0.6)$",\
     Phi(x, 1) title "$\\Phi(x, 1)$", \
     Phi(x, 5) title "$\\Phi(x, 5)$"

# splot [-1:1] [0:1] Phi(x,y)
