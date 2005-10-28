
FIG = sobolev1.fig sobolev2.fig trennsatz1.fig lebesgue-integral.fig \
     riemann-integral.fig satz2-diagramm.fig

LATEXMODE = --interaction batchmode

all: skript.pdf

clean:
	rm -f skript.aux skript.idx skript.ilg skript.ind skript.log skript.out \
	    skript.pdf skript.thm skript.toc

mrproper: clean
	$(FIG:.fig=.pdf) $(FIG:.fig=.pdf_t) 1x.pdf 1x.pdf_t

full: skript.ind
	mkdir tmp 2>/dev/null || rm tmp/*
	while ! [ -e tmp/skript.aux ] || \
	  !(for i in tmp/*; do cmp --quiet $${i#*/} $$i || return 1; done); do \
	    cp skript.* tmp; rm tmp/skript.log tmp/skript.pdf; \
	    rm skript.pdf; $(MAKE) skript.pdf; \
	done; \
	rm -r tmp

.PRECIOUS: $(FIG:.fig=.pdf)

skript.pdf: skript.latex $(FIG:.fig=.pdf_t) 1x.pdf_t
	pdflatex $(LATEXMODE) $<

.PRECIOUS: %.idx

%.idx: %.latex
	pdflatex $(LATEXMODE) $<

%.ind: %.idx
	texindy -q -g -L german-din -M indexstyle $<

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
