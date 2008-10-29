set terminal fig
set output "grafik2.fig"
set xrange[0:2]
f1(x) = x - 2
f2(x) = 2*x-3
f3(x) = 3*x-4
plot f1(x),f2(x),f3(x)

