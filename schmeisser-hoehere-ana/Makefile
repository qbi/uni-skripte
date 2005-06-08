
FIG = sobolev1.fig sobolev2.fig trennsatz1.fig lebesgue-integral.fig \
     riemann-integral.fig satz2-diagramm.fig

PDFMODE = --interaction batchmode

all: skript.pdf

clean:
	rm -f skript.aux skript.idx skript.ilg skript.ind skript.log skript.out \
	    skript.pdf skript.thm skript.toc 1x.pdf 1x.pdf_t \
	    $(FIG:.fig=.pdf) $(FIG:.fig=.pdf_t)

full: skript.ind
	pdflatex $(PDFMODE) skript.latex
	pdflatex $(PDFMODE) skript.latex

.PRECIOUS: $(FIG:.fig=.pdf)

skript.pdf: skript.latex $(FIG:.fig=.pdf_t) 1x.pdf_t
	pdflatex $(PDFMODE) $<

.PRECIOUS: %.idx

%.idx: %.pdf
	mv $@ $@2
	sed 's/\\"/"/' $@2 > $@
	rm $@2

%.ind: %.idx
	makeindex $<

%.pdf_t: %.gplot
	gnuplot $<
	epstopdf $(patsubst %.gplot, %.eps, $<)
	rm $(patsubst %.gplot, %.eps, $<)
	mv $(patsubst %.gplot, %.tex, $<) $(patsubst %.gplot, %.pdf_t, $<)

%.pdf_t: %.fig %.pdf
	fig2dev -L pdftex_t $< > $@

%.pdf: %.fig
	fig2dev -L pdftex $< > $@

.PHONY: all full clean
