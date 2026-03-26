<div align="center">
  <h1>UFPR Academic Work Template</h1>
  <h2>(Unofficial)</h2>
  <p>🇺🇸 English | <a href="https://github.com/chrispdobb/blob/main/README.pt.md">🇧🇷 Português</a></p>
</div>

## Note
All code documentation of this package is in Brazilian Portuguese considering it is targeted at UFPR students, 
a Brazilian university.

## Quick Start
```typst
#import "@preview/ufpr-unofficial:2022.0.0": *

#show template.with(
  // Obligatory parameters
  title: "Aplicação de Machine Learning para Classificação de Imagens de Satélite na Agricultura de Precisão",
  authors: ("Marina Silva Santos",),
  advisor: "Prof. Dr. Roberto Pereira Costa",
  city: "Curitiba",
  year: 2024,
  description: [
    Relatório técnico apresentado à disciplina de Metodologia Científica 
    do curso de Engenharia de Computação da Universidade Federal do Paraná, 
    como requisito parcial para aprovação na disciplina.
  ],
  references: bibliography("refs.bib"),
  // Optional parameters
  has-cover: true,
  glossary: (
    "Agricultura de Precisão", [Metodologia de produção agrícola que utiliza tecnologia para otimizar recursos e aumentar produtividade.],
    "Machine Learning", [Subárea da inteligência artificial que permite computadores aprenderem com dados sem serem explicitamente programados.],
    "Imagem de Satélite", [Representação digital de uma área da superfície terrestre capturada por sensores orbitais.],
  )
)

= Introdução
// ...
```

## Description
An unofficial Typst template for academic work following ABNT standards, designed for students of the Federal University of Paraná (UFPR). Supports comprehensive academic document structures including theses, reports, and dissertations with automatic formatting, illustrations, tables, appendices, and bibliography management.

## Standards & Versioning
This template is based on the **ABNT Manual of Scientific Document Normalization** (Manual de Normalização de Documentos Científicos de Acordo com As Normas da ABNT).

**Versioning Scheme:**
Version numbers follow the pattern `[manual-year].[major].[minor]`:
- First number: Year of the ABNT manual edition
- Second number: Major version (breaking changes)
- Third number: Minor version (features, bug fixes)

For example, `2022.0.0` indicates compatibility with the 2022 ABNT manual edition.

## Additional Functions

### `illustration(body, supplement: "figura", caption: "", source: _default-source)`
Renders illustrations, figures, graphics, or annexes with captions and source attribution.

**Parameters:**
- `body`: The content to display (typically an image)
- `supplement`: Type of element: `"figura"`, `"gráfico"`, `"mapa"`, `"fotografia"`, or `"anexo"`
- `caption`: Title/description of the element (required)
- `source`: Source attribution (defaults to "Autor (current-year)")

When `supplement` is `"anexo"`, the element is deferred and rendered at the end of the document in the appendices section instead of inline.

### `sheet(columns: 1, caption: "", source: _default-source, note: none, legend: none, ..children)`
Renders tables with captions, source attribution, optional notes, and legends.

**Parameters:**
- `columns`: Number of columns in the table
- `caption`: Table title (required)
- `source`: Source attribution (defaults to "Autor (current-year)")
- `note`: Optional note displayed below the table
- `legend`: Optional legend displayed below the table
- `..children`: Table cells content