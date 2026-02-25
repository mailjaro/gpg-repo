epub: gpg.md config/common.yaml
	$(info Building EPUB:)
	@pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-dark.css -o \
   builds/gpg-dark.epub

open-epub:
	@xdg-open "builds/gpg-dark.epub"

preview: open-epub

spellcheck:
	@hunspell -d nb_NO -p .hunspell_ignore -l gpg.md | sort | uniq

add-word:
ifndef word
	$(error Usage: make add-word word=someword)
endif
	@echo "$(word)" >> .hunspell_ignore
	@sort -u .hunspell_ignore -o .hunspell_ignore

