
# ------------------------------------------------------------------------------
# Top-level makefile for memo LaTeX files
# ------------------------------------------------------------------------------
# $Id: makefile,v 1.2 2005/07/12 14:42:00 bahren Exp $
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Definitions

TEXSOURCES=`ls *.tex | grep -v common | grep -v filename | grep -v table | sed s/".tex"//`
DOTSOURCES=`cd figures && ls *.dot | sed s/".dot"//`

TEXFILES=.aux .bbl .blg .dvi .log .toc .pdf .ps .ps1 .rel .out

# ------------------------------------------------------------------------------
# Generation of documents

default: ICD-001 ICD-002 ICD-003 ICD-004 ICD-005 ICD-006 ICD-007 ICD-008 ICD-SUBBAND

ICD-001: LOFAR-USG-ICD-001.tex packages
	latex LOFAR-USG-ICD-001
	bibtex LOFAR-USG-ICD-001.aux
	latex LOFAR-USG-ICD-001
	latex LOFAR-USG-ICD-001
	latex LOFAR-USG-ICD-001
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-001
	dvips LOFAR-USG-ICD-001.dvi
	ps2pdf LOFAR-USG-ICD-001.ps LOFAR-USG-ICD-001.pdf

ICD-002: LOFAR-USG-ICD-002.tex packages
	latex LOFAR-USG-ICD-002
	bibtex LOFAR-USG-ICD-002.aux
	latex LOFAR-USG-ICD-002
	latex LOFAR-USG-ICD-002
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-002
	dvips LOFAR-USG-ICD-002.dvi
	ps2pdf LOFAR-USG-ICD-002.ps LOFAR-USG-ICD-002.pdf

ICD-003: LOFAR-USG-ICD-003.tex packages
	latex LOFAR-USG-ICD-003
	bibtex LOFAR-USG-ICD-003.aux
	latex LOFAR-USG-ICD-003
	latex LOFAR-USG-ICD-003
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-003
	dvips LOFAR-USG-ICD-003.dvi
	ps2pdf LOFAR-USG-ICD-003.ps LOFAR-USG-ICD-003.pdf


ICD-004: LOFAR-USG-ICD-004.tex packages
	latex LOFAR-USG-ICD-004
	bibtex LOFAR-USG-ICD-004.aux
	latex LOFAR-USG-ICD-004
	latex LOFAR-USG-ICD-004
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-004
	dvips LOFAR-USG-ICD-004.dvi
	ps2pdf LOFAR-USG-ICD-004.ps LOFAR-USG-ICD-004.pdf

ICD-005: LOFAR-USG-ICD-005.tex packages
	latex LOFAR-USG-ICD-005
	bibtex LOFAR-USG-ICD-005.aux
	latex LOFAR-USG-ICD-005
	latex LOFAR-USG-ICD-005
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-005
	dvips LOFAR-USG-ICD-005.dvi
	ps2pdf LOFAR-USG-ICD-005.ps LOFAR-USG-ICD-005.pdf

ICD-006: LOFAR-USG-ICD-006.tex packages
	latex LOFAR-USG-ICD-006
	bibtex LOFAR-USG-ICD-006.aux
	latex LOFAR-USG-ICD-006
	latex LOFAR-USG-ICD-006
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-006
	dvips LOFAR-USG-ICD-006.dvi
	ps2pdf LOFAR-USG-ICD-006.ps LOFAR-USG-ICD-006.pdf

ICD-007: LOFAR-USG-ICD-007.tex packages
	latex LOFAR-USG-ICD-007
	bibtex LOFAR-USG-ICD-007.aux
	latex LOFAR-USG-ICD-007
	latex LOFAR-USG-ICD-007
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-007
	dvips LOFAR-USG-ICD-007.dvi
	ps2pdf LOFAR-USG-ICD-007.ps LOFAR-USG-ICD-007.pdf

ICD-008: LOFAR-USG-ICD-008.tex packages
	latex LOFAR-USG-ICD-008
	bibtex LOFAR-USG-ICD-008.aux
	latex LOFAR-USG-ICD-008
	latex LOFAR-USG-ICD-008
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-008
	dvips LOFAR-USG-ICD-008.dvi
	ps2pdf LOFAR-USG-ICD-008.ps LOFAR-USG-ICD-008.pdf

ICD-SUBBAND: LOFAR-USG-ICD-SUBBAND.tex packages
	latex LOFAR-USG-ICD-SUBBAND
	bibtex LOFAR-USG-ICD-SUBBAND.aux
	latex LOFAR-USG-ICD-SUBBAND
	latex LOFAR-USG-ICD-SUBBAND
#	dvipdfmx -q -O 1 LOFAR-USG-ICD-SUBBAND
	dvips LOFAR-USG-ICD-SUBBAND.dvi
	ps2pdf LOFAR-USG-ICD-SUBBAND.ps LOFAR-USG-ICD-SUBBAND.pdf

# ------------------------------------------------------------------------------
# Symbolic links to LaTeX style files

usg.sty: ../usg.sty
	ln -s ../usg.sty

svninfo.sty: ../svninfo.sty
	ln -s ../svninfo.sty

packages: usg.sty svninfo.sty

# ------------------------------------------------------------------------------
# Create postscript figures from dot graphics

graphics:
	for SOURCE in $(DOTSOURCES) ; do \
		dot -Tps figures/$$SOURCE.dot -o figures/$$SOURCE.ps ;\
	done


# ------------------------------------------------------------------------------
# Cleaning up

clean:
	rm -f *~
	rm -f *.log *.aux *.ps1 *.sty
	rm -f figures/*~
	for SOURCE in $(TEXSOURCES) ; do \
		for FILE in $(TEXFILES) ; do \
			echo "Removing $$SOURCE$$FILE" ; \
			rm -f $$SOURCE$$FILE ; \
		done; \
	done

# ------------------------------------------------------------------------------
# Feedback

files:
	-@ echo "Dot graphics = $(DOTSOURCES)"
	-@ echo "LaTeX files  = $(TEXSOURCES)"

