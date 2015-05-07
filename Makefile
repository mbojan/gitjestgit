# pliki
files:=gitjestgit
to_clean:=projekt projekt.git fork fork.git

pandoc=pandoc
pandoc_flags=

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

gitjestgit.html: clean

#============================================================================ 
# More tgts

.PHONY: html
html: $(files:=.html)

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
