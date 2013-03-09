######################################################
# LaTeX Project Makefile
# Create by LeoMao
# Use latexmk, xelatex, asymptote
######################################################
MAINFILE = template

SRCPATH = ./
FIGPATH = ./images

TEX = latexmk
TEXFLAG = -xelatex -synctex=1 -interaction=nonstopmode

ASY = asy
ASYFLAG = -f pdf

TEXFILES = $(shell find $(SRCPATH) -type f -name '*.tex')
ASYFILES = $(shell find $(FIGPATH) -type f -name '*.asy')

all: $(MAINFILE).pdf

$(MAINFILE).pdf: $(TEXFILES) $(ASYFILES)
	$(TEX) $(TEXFLAG) $(MAINFILE).tex

$(FIGPATH)%.asy:
	$(ASY) $(ASYFLAG) $@
	
.PHONY: clean

clean:
	rm $(MAINFILE).pdf
