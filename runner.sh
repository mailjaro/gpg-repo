#!/usr/bin/fish
pushd ~/Documents/doc/gpg-doc
mkdir -p builds

pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-dark.css \
   --metadata cover-image=images/cover.png \
   -o builds/gpg-pan-dark.epub

pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-light.css \
   --metadata cover-image=images/cover.png \
   -o builds/gpg-pan-light.epub

pandoc gpg.md --metadata-file=./config/common.yaml \
                 --wrap=none -f markdown-smart -o gpg-1.adoc

echo "✅ Pandoc EPUB LIGHT and DARK successfully built."

asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri \
            config/masterHTML-1.adoc -o builds/gpg-1.html

cp gpg-1.adoc gpg-2.adoc
sd '\[source,output\]' '[%unbreakable]\n[source,output]' gpg-2.adoc
sd '\[source,bash\]' '[%unbreakable]\n[source,bash]' gpg-2.adoc
sd '❗' 'NOTE:' gpg-2.adoc
sd '‼️' 'CAUTION:' gpg-2.adoc
sd '🚩' 'WARNING:' gpg-2.adoc
sd '\p{Extended_Pictographic}\uFE0F? ' '' gpg-2.adoc  # Fjerner emojis
sd ' 1️⃣' '' gpg-2.adoc
sd ' 2️⃣' '' gpg-2.adoc
sd ' 3️⃣' '' gpg-2.adoc
sd ' 4️⃣' '' gpg-2.adoc
sd ' 5️⃣' '' gpg-2.adoc
sd ' 6️⃣' '' gpg-2.adoc
sd ' 7️⃣' '' gpg-2.adoc


asciidoctor-epub3 config/masterEPUB-light.adoc \
                  -o builds/gpg-asc-light.epub
asciidoctor-epub3 config/masterEPUB-dark.adoc \
                  -o builds/gpg-asc-dark.epub

echo "✅ Asciidoctor EPUB LIGHT and DARK successfully built."

asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri \
            config/masterHTML-2.adoc -o builds/gpg-2.html

echo "✅ HTML1 and HTML2 successfully built."

cp gpg-2.adoc gpg-3.adoc

asciidoctor-pdf config/masterPDF.adoc --theme=styles/asciidoctor-default.yml \
                -o builds/gpg.pdf

echo "✅ PDF successfully built."

popd