
PICTURES = \
	common/logo-penguins.pdf \
	common/logo-square.pdf \
	common/bootlin-logo.pdf \
	booting-without-dt.pdf \
	booting-with-dt.pdf \
	dt-basic-syntax.pdf \
	dt-simple-example.pdf \
	dt-inheritance.pdf \
	tegra20-dt-example.pdf \
	armada-clock-tree.pdf \
	dts-hierarchy.pdf

all: $(PICTURES)
	$(PDFLATEX_ENV) pdflatex -shell-escape petazzoni-device-tree-dummies.tex

%.pdf: %.svg
	inkscape -D -o $@ $<

%.pdf: %.eps
	epstopdf --outfile=$@ $^

%.eps: %.dia
	dia -e $@ -t eps $^

clean:
	$(RM) *.pdf *.pyg *.snm *.toc *.vrb *.aux *.nav *.out *.dia~ *.log common/*.pdf
