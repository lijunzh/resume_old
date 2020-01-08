# Tools
LATEXMK = latexmk
RM = rm -f

# Project-specific settings
DOCNAME = resume

# Targets
all: $(DOCNAME).pdf

# Rules
%.pdf: %.tex
	$(LATEXMK) -xelatex -M -MP -MF $*.d $*

clean: mostlyclean
	$(LATEXMK) -silent -C
	$(RM) *.d
	$(RM) *.run.xml *.synctex.gz
	$(RM) *.bbl

mostlyclean:
	$(LATEXMK) -silent -c

.PHONY: all clean mostlyclean

# Include auto-generated dependencies
-include *.d