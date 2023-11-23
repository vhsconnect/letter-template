DOCNAME=letter

PDFLATEX="pdflatex -interaction=nonstopmode -synctex=1"

.PHONY: $(DOCNAME).pdf all clean

all: $(DOCNAME).pdf

$(DOCNAME).pdf: $(DOCNAME).tex
	latexmk -pdf -pdflatex=$(PDFLATEX) -use-make $(DOCNAME).tex

watch: $(DOCNAME).tex
	latexmk -pvc -pdf -pdflatex=$(PDFLATEX) -use-make $(DOCNAME).tex

preview: $(DOCNAME).tex
	latexmk -pvc -pdf -pdflatex=$(PDFLATEX) -use-make $(DOCNAME).tex & evince my-doc.pdf

f:
	mv letter.pdf $(t).pdf

clean:
	latexmk -CA

install:
	mkdir -pv ${out}/nix-support/
	cp $(DOCNAME).pdf ${out}/
