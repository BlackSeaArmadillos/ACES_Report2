all: report.pdf

SHELL=/bin/bash
TEX_FILES = $(shell find src/ -name "*.tex")
MAIN = report

TEX_SOURCES = Makefile $(MAIN).tex $(TEX_FILES) references.bib mystyle.sty


report.pdf: $(TEX_SOURCES)
		pdflatex $(MAIN)
		biber $(MAIN)
		pdflatex $(MAIN)
		pdflatex $(MAIN)


view:
	wslview *.pdf

clean:
	-rm -f $(MAIN).{pdf,log,blg,bbl,aux,out,toc,idx,bcf,run.xml,ind,ilg,fls,fdb_latexmk} final.pdf



.PHONY: clean all