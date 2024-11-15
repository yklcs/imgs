SRCS := $(wildcard *.tex)
PDFDIR := build
PNGDIR := imgs
PDFS := $(addprefix $(PDFDIR)/, $(SRCS:tex=pdf))
PNGS := $(addprefix $(PNGDIR)/, $(SRCS:tex=png))
CLS := imgs.cls

JUNK := $(PDFS:pdf=*)

all: png
png: $(PNGS)
	
$(PNGS): $(PNGDIR)/%.png: $(PDFDIR)/%.pdf | $(PNGDIR)
	magick -density 600 $< -alpha remove -quality 90 -resize 50% $@

$(PDFS): $(PDFDIR)/%.pdf: %.tex $(CLS) | $(PDFDIR)
	latexmk -pdf -interaction=nonstopmode -jobname=$(PDFDIR)/$* -use-make $<

$(PDFDIR):
	mkdir $@

$(PNGDIR):
	mkdir $@

clean:
	$(RM) $(JUNK) $(PNGS) $(PDFS) *.pdf *.synctex.gz
	rmdir $(PDFDIR) $(PNGDIR)
