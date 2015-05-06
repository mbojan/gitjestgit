# pliki
files:=howtogit

pandoc=pandoc
pandoc_flags=-s

# Jak kompilować?
# 1 = rmarkdown::render()
# 0 = knitr::knit() + pandoc
use_rmarkdown=1


.PHONY: default
default: html


#============================================================================ 
# Recipes

define run-pandoc
$(pandoc) $(pandoc_flags) $< -o $@
endef

define run-rmarkdown
Rscript -e 'rmarkdown::render("$<")'
endef


#============================================================================ 
# Rules

# Jak kompilować
ifeq ($(use_rmarkdown),1) 
%.html: %.Rmd
	$(run-rmarkdown)
else
%.html: %.md
	$(run-pandoc)
endif

%.md: %.Rmd
	Rscript -e "knitr::knit('$<', output='$@')"

#============================================================================ 
# More tgts

.PHONY: html
html: $(files:=.html)

.PHONY: pdf
pdf: $(files:=.pdf)

.PHONY: editall
editall:
	vim -p $(files:=.Rmd) Makefile

.PHONY: clean
clean:
	rm -rf $(files:=.html) $(files:=.pdf) projekt projekt.git

# IMPORTANT!
# Do puszczenia po wygenerowaniu HTMLi z opcją w 'self_contained: false' w
# pliku '_output.yaml'!
.PHONY: proof
proof:
	htmlproof . --verbose --ext .html --alt-ignore /figure-html/
