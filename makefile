######################################################
# LaTeX Project Makefile
# Create by LeoMao
# Use latexmk, xelatex, asymptote
######################################################
MAINFILE = template
JOBNAME = template

SRCPATH = ./
FIGPATH = ./images

TEX = latexmk
TEXFLAG = -xelatex -synctex=1 -interaction=nonstopmode -use-make

ASY = asy
ASYFLAG = -f pdf

TEXFILES = $(shell find $(SRCPATH) -type f -name '*.tex')
ASYFILES = $(shell find $(FIGPATH) -type f -name '*.asy')

.PHONY: $(JOBNAME).pdf clean

all: $(JOBNAME).pdf

$(MAINFILE).pdf: $(MAINFILE).tex $(TEXFILES) $(ASYFILES)
	$(TEX) $(TEXFLAG) -jobname=$(JOBNAME) $(MAINFILE).tex

$(FIGPATH)%.asy:
	$(ASY) $(ASYFLAG) $@

clean:
	latexmk -CA
