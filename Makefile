DIR=guides/*.md
PDFS=$(patsubst guides/%.md,%.pdf,$(wildcard $(DIR)))

all: $(PDFS)

%.pdf: guides/%.md
	@mkdir -p $(@D)
	@pandoc $< -o $@ \
		-f gfm \
		--pdf-engine=xelatex \
		--highlight-style=tango \
		-V colorlinks \
		-V fontfamily=arimo \
		-V fontfamilyoptions=sfdefault \
		-V geometry:margin=3cm,a4paper

clean:
	@rm -rf $(PDFS)
