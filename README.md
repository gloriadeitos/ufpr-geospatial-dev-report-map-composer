# Relatório Técnico — ufpr-map-composer

Repositório com o relatório técnico do plugin QGIS [**ufpr-map-composer**](https://github.com/gloriadeitos/ufpr-map-composer), escrito em [Typst](https://typst.app/) seguindo as normas da ABNT.

> **Sobre o plugin:** O ufpr-map-composer é um plugin para QGIS que exporta as camadas do projeto para um WebGIS interativo, gerado com React e OpenLayers. Compatível com GitHub Pages e Netlify.

---

## Pré-requisitos

- [Typst](https://typst.app/) instalado na máquina

  ```powershell
  winget install --id Typst.Typst
  ```

- *(Opcional, recomendado)* Extensão **Tinymist** no VS Code para preview ao vivo

---

## Editar o relatório

O arquivo principal do relatório é:

```
template/main.typ
```

---

## Visualizar enquanto edita

### Opção 1 — Extensão Tinymist no VS Code *(recomendado)*

1. Instale a extensão [Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) no VS Code
2. Abra `template/main.typ`
3. Use `Ctrl+Shift+P` → **Typst Preview** (ou clique no ícone de preview)

O preview atualiza automaticamente a cada salvo.

### Opção 2 — Watch mode no terminal

```powershell
typst watch template/main.typ
```

Recompila automaticamente ao salvar. Abra o PDF gerado em `template/main.pdf` com um leitor que recarrega automaticamente, como o [SumatraPDF](https://www.sumatrapdfreader.org/).

---

## Gerar o PDF

```powershell
typst compile template/main.typ
```

O PDF é gerado em `template/main.pdf`.
