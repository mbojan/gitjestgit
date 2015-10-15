# pliki
files:=gitjestgit
to_clean:=projekt projekt.git fork-pracownik1.git pracownik1 szef pracownik2

.PHONY: default
default: $(files:=.html)

output_format=NULL
$(files:=.html): output_format="html_document"
$(files:=.pdf): output_format="pdf_document"

%.md: %.Rmd clean
	Rscript -e 'library(knitr, lib="lib"); knit("$<")'

%.html %.pdf: %.md
	Rscript -e 'rmarkdown::render("$<", output_format=$(output_format))'



.PHONY: edit
edit:
	vim -p $(files:=.Rmd) Makefile

.PHONY: clean
clean:
	rm -rf $(to_clean)


# IMPORTANT!
# Do puszczenia po wygenerowaniu HTMLi z opcją w 'self_contained: false' w
# pliku '_output.yaml'!
.PHONY: proof
proof:
	htmlproof . --verbose --ext .html --alt-ignore /figure-html/


# Instalacja pakietów
.PHONY: pkgs
pkgs:
	mkdir -p lib
	Rscript -e 'library(devtools); with_lib("lib", install("src/knitr"))'
