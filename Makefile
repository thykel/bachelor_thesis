# makefile pro preklad LaTeX verze Bc. prace
# (c) 2008 Michal Bidlo
# E-mail: bidlom AT fit vutbr cz
#===========================================
# asi budete chtit prejmenovat:
CO=projekt

all: $(CO).pdf

pdf: $(CO).pdf

$(CO).pdf: clean
	pdflatex -shell-escape $(CO).tex
	bibtex $(CO)
	pdflatex -shell-escape $(CO).tex
	pdflatex -shell-escape $(CO).tex
	bibtex $(CO)

desky:
	pdflatex desky

clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof
	rm -f $(CO).pdf $(CO).run.xml $(CO).synctex.gz $(CO)-blx.bib
	rm -f *~

pack:
	tar czvf bp-xhykel01.tar.gz *.tex *.bib *.bst ./fig/* ./cls/* Makefile Changelog
