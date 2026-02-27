#!/usr/bin/fish

pushd ~/Documents/doc/gpg-doc
mkdir -p builds

# Produksjon av mørk EPUB:
pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-dark.css -o \
   builds/gpg-dark.epub

# Produksjon av lys EPUB:
pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-light.css -o \
   builds/gpg-light.epub

# Konvertering til AsciiDoc:
pandoc gpg.md --metadata-file=./config/common.yaml \
                 --wrap=none -f markdown-smart -o gpg-1.adoc

# Produksjon av HTML 1:
asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri \
            config/masterHTML-1.adoc -o builds/gpg-1.html

# Produksjon av HTML 2:
cp gpg-1.adoc gpg-2.adoc
sd '\p{Extended_Pictographic}\uFE0F? ' '' gpg-2.adoc  # Fjerner emojis
asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri \
            config/masterHTML-2.adoc -o builds/gpg-2.html

# Produksjon av PDF:
cp gpg-2.adoc gpg-3.adoc
sd '\[source,output\]' '[%unbreakable]\n[source,output]' gpg-3.adoc
sd '\[source,bash\]' '[%unbreakable]\n[source,bash]' gpg-3.adoc
asciidoctor-pdf config/masterPDF.adoc --theme=styles/asciidoctor-default.yml \
                -o builds/gpg.pdf

popd