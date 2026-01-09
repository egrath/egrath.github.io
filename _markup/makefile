# 
# this is the makefile for generating html files from our markup sources
#
OUTDIR=..
FILES=$(addprefix $(OUTDIR)/,index.html tests/test.html pages/pages.html pages/books/books.html)

# rule to build all html files
all: $(FILES)

# rule to build a html file in the output directory from
# a markup file in the source directory
$(OUTDIR)/%.html: %.md
	@echo -n "generating $@ from $< ... "
	@if [ ! -d $$(dirname $@) ]; then mkdir -p $$(dirname $@); fi
	@cat header.txt > $@
	@markdown -G $< >> $@
	@cat footer.txt >> $@
	@echo "done"

