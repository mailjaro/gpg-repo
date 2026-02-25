# 📘 GPG

> Et kort, lite og praktisk hefte om GPG på Linux.  
> Skrevet av Jan R Sandbakken.

---

## ❗ Viktig info

✅ Husk: Start enhver editering med

- `git fetch origin`
- `git pull`

✅ Husk: Avslutt enhver editering med

- Lagre alle ulagrede filer
- `./runner.sh`
- `git add -A`
- `git commit -m "Beskrivelse"`
- `git push`

(Eller gjør det ekvivalente fra **VS Code**.)

---

## 📌 Om prosjektet

Dette prosjektet inneholder kildematerialet (**gpg.md**) til heftet **"Litt om GPG"**.

## 🗂️ Struktur

Her ser vi den fulle strukturen når alt er konvertert mog produsert (hvilket kan oppnås ved å kjøre skriptet `runner.sh`):

```text
.
├── builds
│   ├── gpg-1.html
│   ├── gpg-2.html
│   ├── gpg-dark.epub
│   ├── gpg-light.epub
│   └── gpg.pdf
├── config
│   ├── common.yaml
│   ├── masterHTML-1.adoc
│   ├── masterHTML-2.adoc
│   └── masterPDF.adoc
├── images
│   └── cover.png
├── Makefile
├── README.md
├── runner.sh
├── styles
│   ├── asciidoctor-default.css
│   ├── asciidoctor-default.yml
│   ├── epub-dark.css
│   └── epub-light.css
├── gpg-1.adoc
├── gpg-2.adoc
├── gpg-3.adoc
└── gpg.md     ← HOVEDFIL (KILDEFIL)
```

## 📌 Eksport til EPUB

EPUB kan med hell produseres direkte fra MD med `pandoc`. En CSS for mørk og lys stil er laget, samt en **common.yaml** for metadata.

Her er `pandoc`-kommandoene for hver av stilene:

```bash
pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-dark.css -o \
   builds/gpg-dark.epub
```

```bash
pandoc gpg.md  \
   --metadata-file=config/common.yaml \
   --css=styles/epub-light.css -o \
   builds/gpg-light.epub
```

Her er metadataene i **common.yaml**:

```text
title: "Litt om VS Code"
author: "Jan Roger Sandbakken"
version: "1.0"
date: "2026-02-19"
language: "nb"
rights: © 2026 Jan Roger Sandbakken
```

## 📌 Konvertering til ADOC

Følgende kommando konverterer **gpg.md** til **gpg-1.adoc** (første av tre ADOC-versjoner). Denne inneholder bl.a. MD-ikoner:

```bash
pandoc gpg.md --metadata-file=./config/common.yaml \
                 --wrap=none -f markdown-smart \
                 -o gpg-1.adoc
```

## 📌 Uredigert eksport til HTML

For produksjon av formater ved `asciidoctor` er det laget masterfiler med *preambles* og nødvendig *includes*. Her er **masterHTML-1.adoc**:

```text
= Litt om GPG
Jan R Sandbakken <mailjaro@gmail.com>
v1.0 2026-02-19
:description: Dette heftet forsøker å hjelpe til med å få oversikt over GPG
:doctype: book
:icons: font
:toc: left
:toc-title: Innholdsfortegnelse
:toclevels: 4
:sectanchors:
:source-highlighter: rouge
:rouge-style: github
image::../images/cover.png[role=cover,align=center]

include::../gpg-1.adoc[]
```
I tillegg er default CSS for `asciidoctor` hentet inn og inkluderes i følgende produksjonskommando:

```bash
asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri -a linkcss=false \
            config/masterHTML-1.adoc \
            -o builds/gpg-1.html
```

Opsjonene

```bash
-a linkcss=false
-a data-uri
```
sørger for at en produsert CCS og bilde (forsidebilde) inkluderes direkte i HTML-filen (så den enkelt kan flyttes rundt).

## 📌 Redigering av ADOC

Man starter med å kopiere `gpg-1.adoc` til `gpg-2.adoc` (alle endringer gjøres så på sistnevnte):

```bash
cp gpg-1.adoc gpg-2.adoc
```

Deretter sørger man for at `source`-objekter ikke blir linjedelt (viktig for PDF):

```bash
sd '\[source,text\]' '[%unbreakable]\n[source,text]' gpg-2.adoc
sd '\[source,json\]' '[%unbreakable]\n[source,json]' gpg-2.adoc
```

Så fjernes ikoner (håndteres ikke av PDF). For dette konkrete heftet er det nødvendig og tilstrekkelig å gjøre:

```bash
sd '📘 ' '' gpg-2.adoc
sd '⚙️ ' '' gpg-2.adoc
sd '🧩 ' '' gpg-2.adoc
sd '📄 ' '' gpg-2.adoc
sd '📁 ' '' gpg-2.adoc
sd '📂 ' '' gpg-2.adoc
sd '🔑 ' '' gpg-2.adoc
sd '1️⃣ ' '1. ' gpg-2.adoc
sd '2️⃣ ' '2. ' gpg-2.adoc
sd '3️⃣ ' '3. ' gpg-2.adoc
sd '4️⃣ ' '4. ' gpg-2.adoc
sd '5️⃣ ' '5. ' gpg-2.adoc
sd '6️⃣ ' '6. ' gpg-2.adoc
sd '7️⃣ ' '7. ' gpg-2.adoc
```

## 📌 Redigert eksport til HTML

Følgende kommando produserer HTML fra den nyredigerte `gpg-2.adoc` (inkludert i HTML-masterfil 2):

```bash
asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri -a linkcss=false \ 
            config/masterHTML-2.adoc -o builds/gpg-2.html
```

## 📌 Redigert eksport til PDF

Tanken er nå at man har behov for å redigerer ytterligere for PDF, kanskje legge inn nødvendig legge sideskift (`<<<`) enkelte steder o.l. Det forutsettes her at man derfor først kopiere  `gpg-2.adoc` til `gpg-3.adoc` og redigerer denne videre.

Masterfilen for PDF ser nemlig slik ut:

```text
= Litt GPG
Jan R Sandbakken <mailjaro@gmail.com>
v1.0 2026-02-12
:description: Dette heftet forsøker å hjelpe til med å få oversikt over GPG
:doctype: book
:front-cover-image: image:../images/cover.png[]
:title-page:
:icons: font
:toc: left
:toc-title: Innholdsfortegnelse
:toclevels: 4
:sectanchors:
:source-highlighter: rouge
:rouge-style: base16.dark

include::../gpg-3.adoc[]
```

Følgende kommando produserer da PDF-versjon av boken:

```bash
asciidoctor-pdf config/masterPDF.adoc \
                --theme=styles/asciidoctor-default.yml \
                -o builds/gpg.pdf
```

## 🐚 Kommandoer samlet i et shell

Her er alt av kommandoer samlet i et fish-shell `runner.sh`:

```bash
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
sd '📘 ' '' gpg-2.adoc
sd '⚙️ ' '' gpg-2.adoc
sd '🧩 ' '' gpg-2.adoc
sd '📄 ' '' gpg-2.adoc
sd '📁 ' '' gpg-2.adoc
sd '📂 ' '' gpg-2.adoc
sd '🔑 ' '' gpg-2.adoc
sd '1️⃣ ' '1. ' gpg-2.adoc
sd '2️⃣ ' '2. ' gpg-2.adoc
sd '3️⃣ ' '3. ' gpg-2.adoc
sd '4️⃣ ' '4. ' gpg-2.adoc
sd '5️⃣ ' '5. ' gpg-2.adoc
sd '6️⃣ ' '6. ' gpg-2.adoc
sd '7️⃣ ' '7. ' gpg-2.adoc

asciidoctor -a stylesheet=../styles/asciidoctor-default.css \
            -a data-uri -a \
            config/masterHTML-2.adoc -o builds/gpg-2.html

cp gpg-2.adoc gpg-3.adoc
asciidoctor-pdf config/masterPDF.adoc --theme=styles/asciidoctor-default.yml \
                -o builds/gpg.pdf

popd
```

## 📌 Makefile

Det er laget en midlertidig Makefile som hjelper både med produksjon og lesing, foreløpig bare

```bash
make epub
```

som produserer (den mørke) EPUB-filen, mens kommandoen

```bash
make open-epub
```

åpner denne for lesing.

Dette vil bli utvidet senere.

## 📚 Andre hefter i serien

📘 Linux: Det neste steget

📘 Litt om Git

📘 Litt om VS Code

📘 Litt om CSS