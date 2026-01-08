# 
# this is the makefile for generating html files from our markup sources
#
OUTDIR=..
FILES=$(addprefix $(OUTDIR)/,index.html)

# rule to build all html files
all: $(FILES)

# rule to build a html file in the output directory from
# a markup file in the source directory
$(OUTDIR)/%.html: %.md
	@echo -n "generating $@ from $< ... "
	@cat header.txt > $@
	@markdown -G $< >> $@
	@cat footer.txt >> $@
	@echo "done"
