# Tools
LATEXMK = latexmk
RM = rm -f

# Project-specific settings
DOCNAME = resume

# Targets
all: doc
doc: pdf
pdf: $(DOCNAME).pdf
force: allclean all
allclean: bibclean clean

# Rules
%.pdf: %.tex
	$(LATEXMK) -xelatex -M -MP -MF $*.d $*

bibclean:
	$(RM) *.bbl *.bib

clean: mostlyclean
	$(LATEXMK) -silent -C

mostlyclean:
	$(LATEXMK) -silent -c
	$(RM) *.run.xml *.synctex.gz
	$(RM) *.d
	$(RM) .fdb_latexmk

.PHONY: all clean doc force bibclean mostlyclean allclean pdf

# Include auto-generated dependencies
-include *.d