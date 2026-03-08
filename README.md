# "Litt om GPG" – Comprehensive Documentation

A comprehensive guide to GNU Privacy Guard (GPG) in Norwegian, covering everything from basic installation to advanced cryptographic operations. This project automatically converts source documentation into multiple formats including HTML, EPUB, and PDF.

## 📋 Overview

This documentation project provides an in-depth introduction to GPG, including:

- **Installation** instructions for Linux systems
- **Basic concepts** and cryptographic principles
- **Common commands** and practical usage
- **Advanced features** and extended capabilities
- Real-world examples and use cases

The documentation is available in Norwegian and supports dark/light theme variants.

## 📊 Project Structure

```
.
├── gpg.md                          # MAIN FILE
├── gpg-1.adoc                      # Generated AsciiDoc (HTML1)
├── gpg-2.adoc                      # Processed AsciiDoc (HTML2)
├── gpg-3.adoc                      # Processed AsciiDoc (PDF)
├── runner.sh                       # Build script (Fish shell)
├── config/                         # Configuration files
│   ├── common.yaml                 # EPUB metadata
│   ├── masterHTML-1.adoc           # HTML master (version 1)
│   ├── masterHTML-1.adoc           # HTML master (version 1)
│   └── masterPDF.adoc              # PDF master
├── styles/                         # CSS and styling
│   ├── asciidoctor-default.css     # AsciiDoctor CSS stylesheet
│   ├── asciidoctor-default.yml     # PDF theme configuration
│   ├── epub-dark.css               # Dark theme for EPUB
│   └── epub-light.css              # Light theme for EPUB
├── builds/                         # Generated output files
│   ├── gpg-1.html                  # HTML version 1
│   ├── gpg-2.html                  # HTML version 2
│   ├── gpg.pdf                     # PDF version
│   ├── gpg-dark.epub               # EPUB with dark styling
│   └── gpg-light.epub              # EPUB with light styling
└── images/                         # Images directory
    └── cover.png                   # Front cover             
```

## 🚀 Build Instructions

### Prerequisites

Ensure you have the following tools installed:

- **Fish shell** (the build script uses Fish syntax)
- **Pandoc** – Document conversion tool
- **AsciiDoctor** – AsciiDoc processor
- **AsciiDoctor PDF** – PDF generation plugin
- **sd** – command‑line string‑replacer (used instead of **sed** when stripping emojis and tweaking AsciiDoc)

#### Installation (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install fish pandoc asciidoctor ruby-asciidoctor-pdf sd
```
#### Installation (Fedora/RHEL)

```bash
sudo dnf install fish pandoc asciidoctor rubygem-asciidoctor-pdf
```

### Building

Two build mechanisms are provided: a Fish script and a GNU Make pipeline.

#### Using the script

Execute the build script to generate all output formats (Fish shell required):

```bash
fish runner.sh
```

#### Using Make

A `Makefile` replicates these steps and adds dependency tracking. From the project root you can run:

```bash
make epub1     # builds both dark & light EPUBs with pandoc
make epub2     # builds both dark & light EPUBs with asciidoctor
make html1     # generate HTML version with emojis
make html2     # generate HTML version without emojis
make pdf       # produce the PDF
make all       # run epub1, epub2, html1, html2 and pdf
```

Both mechanisms perform the following stages:
1. Convert `gpg.md` → EPUB (dark and light themes) using Pandoc
2. Convert `gpg.md` → intermediate AsciiDoc format using Pandoc
3. Generate EPUB (dark and light themes) using Asciidoctor
4. Generate HTML1 and HTML2 outputs using AsciiDoctor
5. Generate PDF output using AsciiDoctor PDF

The main file **gpg.md** uses emoji icons :-). EPUB1 and HTML1 include these icons, while EPUB2, HTML2 and PDF do not.

All generated files are placed in the `builds/` directory.

❗ Individual ADOC files can be manually refined to leverage specific AsciiDoc formatting features or to further enhance the HTML or PDF output. Once updated, execute the relevant production commands in **runner.sh** or invoke the corresponding `make` target.


## 🎯 Key Features

- **Multiple Output Formats** and **Professional Styling**: Consistent appearance across all formats
- **Clean Build Pipeline**: Automated multi-stage conversion process
- **Professional Styling**: Consistent appearance across all formats

- **GPG installation** on Linux systems
- **Symmetric encryption** with passphrases
- **Asymmetric encryption** with key pairs
- **Key generatio**n and management
- **File signing** and verification
- Advanced cryptographic use cases

## 👤 Author

**Jan Roger Sandbakken**

© 2026 – All rights reserved

## 📄 License

Please refer to the project for license information.

---

For more information about GPG, visit the [GnuPG official documentation](https://www.gnupg.org/).
