#!/usr/bin/fish
pushd ~/Documents/doc/gpg-doc

pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-dark.css -o \
   builds/gpg-dark.epub

pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-light.css -o \
   builds/gpg-light.epub

pandoc gpg.md --metadata-file=./config/common.yaml \
                 --wrap=none -f markdown-smart -o gpg-1.adoc

asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri \
            config/masterHTML-1.adoc -o builds/gpg-1.html

cp gpg-1.adoc gpg-2.adoc
sd '\[source,text\]' '[%unbreakable]\n[source,text]' gpg-2.adoc
sd '\[source,json\]' '[%unbreakable]\n[source,json]' gpg-2.adoc
sd '📚 ' '' gpg-2.adoc
sd '💻 ' '' gpg-2.adoc
sd '🔒 ' '' gpg-2.adoc
sd '🔑 ' '' gpg-2.adoc
sd '✔️ ' '' gpg-2.adoc
sd '📘 ' '' gpg-2.adoc
sd '❗' 'MERK:' gpg-2.adoc
sd '🚩 ' '' gpg-2.adoc
sd '➕ ' '' gpg-2.adoc
sd '📘 ' '' gpg-2.adoc


asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri \
            config/masterHTML-2.adoc -o builds/gpg-2.html

cp gpg-2.adoc gpg-3.adoc

asciidoctor-pdf config/masterPDF.adoc --theme=styles/asciidoctor-default.yml \
                -o builds/gpg.pdf

popd