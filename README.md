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

#### Installation (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install fish pandoc asciidoctor ruby-asciidoctor-pdf
```

#### Installation (Fedora/RHEL)

```bash
sudo dnf install fish pandoc asciidoctor rubygem-asciidoctor-pdf
```

### Building

Execute the build script to generate all output formats:

```bash
fish runner.sh
```

This will:
1. Convert `gpg.md` → EPUB (dark and light themes) using Pandoc
2. Convert `gpg.md` → intermediate AsciiDoc format using Pandoc
3. Generate HTML1 and HTML2 utputs using AsciiDoctor

4. Generate PDF output using AsciiDoctor PDF

The main file **gpg.md** uses emoji icons :-). EPUB and HTML1 include these icons, while HTML2 and PDF do not.

All generated files are placed in the `builds/` directory.

❗ Individual ADOC files can be manually refined to leverage specific AsciiDoc formatting features or to further enhance the HTML or PDF output. Once updated, execute the relevant production commands in **runner.sh**.

## 📦 Output Formats

| Format | File | Theme | Use Case |
|--------|------|-------|----------|
| **HTML** | `gpg-1.html`, `gpg-2.html` | Default | Web browsers |
| **EPUB** | `gpg-dark.epub` | Dark | E-readers (dark mode) |
| **EPUB** | `gpg-light.epub` | Light | E-readers (light mode) |
| **PDF** | `gpg.pdf` | Default | Print & offline reading |

## 🔧 Build Configuration

### Metadata

EPUB production via **pandoc** uses **common.yaml** for its metadata.

HTML/PDF production via **asciidoctor**/ **asciidoctor-pdf**, use the following ADOC masterfiles with preambles and includes: 

- masterHTML-1.adoc
- masterHTML-2.adoc
- masterPDF.adoc


### Styling

- **EPUB Dark**: Uses `styles/epub-dark.css`
- **EPUB Light**: Uses `styles/epub-light.css`
- **HTML 1 and 2**: Use `styles/asciidoctor-default.css`
- **PDF**: Uses `styles/asciidoctor-default.yml`


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
