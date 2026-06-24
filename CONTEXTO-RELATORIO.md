# Contexto do Relatório

**Tema do relatório:** UFPR Map Composer
**Referência para o conteúdo a ser escrito:** D:\dev\ufpr-map-composer
**Arquivo do relatório:** template/main.typ
**Referências:** template/refs.bib
**Arquivo de referência de forma de escrita (neste mesmo projeto olhe esse arquivo, não use palavras dificeis caso o exemplo não costume usar):** exemplo-escrita-gloria.txt
**Informações adicionais sobre o estilo de escrita:** dissertativo-argumentativo, formal, com conectivos de redação
**Título:** UFPR Map Composer: Plugin QGIS para Geração Automatizada de WebGIS
**Aluna:** Glória Maria Deitos Gomes da Silva
**Orientadora:** Profª. Silvana Philippi Camboim
**Disciplina:** Desenvolvimento de Aplicações Geoespaciais
**Instituição:** Universidade Federal do Paraná — Departamento de Geomática
**Cidade:** Curitiba
**Ano:** 2026
**Idioma:** português

**Adicionar imagens e tabelas ao relatório (da pasta src de acordo com o nome das imagens?):** não
**Adicionar imagens e tabelas ao relatório (da internet com fontes confiáveis):** sim
**Gerar código de lugares recomendáveis pro usuário colocar imagem específicas e deixar ele coloca-las depois?** sim
**Dar preferência pra imagens da internet ou do usuário? (internet/usuario/ambos/nenhum):** internet
**Sempre que encontrar softwares e linguagens conhecidas (VsCode, React...) adicionar imagem no final da seção? :** sim
**Adicionar fontes da internet, extremamente confiáveis, se tiver de acordo com o texto? :** sim

**Seções exigidas:** introdução, objetivo, arquitetura, tecnologias, dados, APIs/serviços utilizados, resultados, limitações, possibilidades futuras
**Tamanho do documento, ignorando capa, contracapa e etc:** 3–5 páginas (sem contar capa e elementos pré-textuais)
**Regras para a IA:**
- não inventar informações nem referências bibliográficas falsas, usar só fontes reais dadas no "Referência para o conteúdo a ser escrito:" e use somente fontes confiáveis da internet se for consulta-las e adiciona-las você
- relatório sempre em português
- não usar travessões no texto escrito

---

## Elementos ABNT

**Como usar:** marque `[X]` nos elementos que quer gerar, deixe `[ ]` nos que não quer.

Instruções para a IA: gere apenas os elementos marcados com `[X]`.

### Pré-textuais obrigatórios
- [X] Capa
- [X] Folha de rosto
- [ ] Resumo
- [X] Sumário automático

### Pré-textuais opcionais
- [ ] Resumo em língua estrangeira (Abstract)
- [ ] Folha de aprovação
- [ ] Ficha catalográfica
- [ ] Errata
- [ ] Dedicatória
- [ ] Agradecimentos
- [ ] Epígrafe
- [ ] Lista de ilustrações
- [ ] Lista de tabelas
- [ ] Lista de abreviaturas
- [ ] Lista de siglas
- [ ] Lista de símbolos
- [ ] Glossário

### Textuais obrigatórios
- [X] Introdução
- [X] Desenvolvimento (seções definidas em "Seções exigidas")
- [X] Conclusão

### Pós-textuais obrigatórios
- [ ] Referências bibliográficas

### Pós-textuais opcionais
- [ ] Apêndices
- [ ] Anexos
- [ ] Índice

---

## Imagens e tabelas

Instrução para a IA: leia `template/figuras.yml` e insira cada entrada ao final da seção indicada em `template/main.typ`, usando:
```typst
#illustration(image("src", width: 90%), caption: [legenda], supplement: "tipo", source: [fonte])
```
Se a entrada usar URL, compilar com `--allow-net`. Para arquivo local, o arquivo deve estar em `template/`.