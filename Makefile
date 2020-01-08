# Tools
LATEXMK = latexmk
RM = rm -f

# Options
LATEXOPT = -xelatex
DEPOPT = -M -MP -MF
CONTINUOUS = -pvc

# Targets
all: resume.pdf coverletter.pdf
release: all squeeze

# Rules
%.pdf: %.tex
	$(LATEXMK) $(LATEXOPT) $(CONTINUOUS) $(DEPOPT) $*.d $*

clean: squeeze
	$(LATEXMK) -silent -C
	$(RM) *.run.xml *.synctex.gz
	$(RM) *.bbl
	$(RM) *.d

squeeze:
	$(LATEXMK) -silent -c


.PHONY: all clean squeeze

# Include auto-generated dependencies
-include *.d

