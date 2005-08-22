
FIG = $(wildcard *.fig)

LATEXMODE = --interaction batchmode

all: skript.pdf

clean:
	rm -f missfont.log skript.aux skript.idx skript.ilg skript.ind \
            skript.log skript.out skript.pdf skript.toc skript.thm

mrproper: clean
	$(FIG:.fig=.pdf) $(FIG:.fig=.pdf_t)

full: skript.ind
	while grep -q Rerun skript.log; do \
	    rm skript.pdf; $(MAKE) skript.pdf; \
	done

.PRECIOUS: $(FIG:.fig=.pdf)

skript.pdf: skript.latex $(FIG:.fig=.pdf_t)
	pdflatex $(LATEXMODE) $<

.PRECIOUS: %.idx

%.idx: %.latex
	pdflatex $(LATEXMODE) $<

%.ind: %.idx
	texindy -q -g -L german-din -M indexstyle $<

%.pdf_t: %.fig %.pdf
	fig2dev -L pdftex_t $< > $@

%.pdf: %.fig
	fig2dev -L pdftex $< > $@

.PHONY: all full clean
