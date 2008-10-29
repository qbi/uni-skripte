set terminal fig
set output "grafik1.fig"
set xrange [0:4]
set yrange [0:5]
f(x) = x + 1
plot "grafik1.data", f(x)

