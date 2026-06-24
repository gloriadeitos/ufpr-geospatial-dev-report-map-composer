# Relatório Técnico: ufpr-map-composer

Repositório com o relatório técnico do plugin QGIS [**ufpr-map-composer**](https://github.com/gloriadeitos/ufpr-map-composer), escrito em [Typst](https://typst.app/) seguindo as normas da ABNT.

> **Sobre o plugin:** O ufpr-map-composer é um plugin para QGIS que exporta as camadas do projeto para um WebGIS interativo, gerado com React e OpenLayers. Compatível com GitHub Pages e Netlify.

---

## Metadados do relatório (report.env.example)

O arquivo `report.env.example` centraliza os dados do relatório (título, autora, orientadora, disciplina, ano etc.) em um único lugar, facilitando a reutilização deste template em outros projetos.

**Como usar:**
1. Copie o arquivo: `cp report.env.example .env`
2. Preencha os valores no `.env` com os dados do seu projeto
3. Use os valores preenchidos para atualizar o bloco `#show: template.with(...)` no `template/main.typ`

> O Typst não lê o `.env` automaticamente — ele serve só como referência organizada dos metadados.

---

## Pré-requisitos

- [Typst](https://typst.app/) instalado na máquina. Pode rodar em qualquer terminal, não precisa estar na pasta do projeto:

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

### Opção 1: Extensão Tinymist no VS Code *(recomendado)*

1. Instale a extensão [Tinymist](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) no VS Code
2. Abra o arquivo `template/main.typ` no editor
3. Com o `main.typ` aberto e selecionado, use `Ctrl+Shift+P` → **Typst Preview: Preview Opened File in Browser** (em português: **Typst Preview: Visualizar Arquivo Aberto no Navegador**)

O preview abre no navegador com todas as páginas visíveis e atualiza automaticamente a cada salvo.

### Opção 2: Watch mode no terminal

Abra um terminal (PowerShell, CMD ou o terminal integrado do VS Code) na raiz do projeto e rode:

```powershell
typst watch template/main.typ
```

Recompila automaticamente ao salvar. Abra o PDF gerado em `template/main.pdf` com um leitor que recarrega automaticamente, como o [SumatraPDF](https://www.sumatrapdfreader.org/).

---

## Gerar o PDF

Abra um terminal (PowerShell, CMD ou o terminal integrado do VS Code) na raiz do projeto e rode:

```powershell
typst compile template/main.typ
```

O PDF é gerado em `template/main.pdf`.
