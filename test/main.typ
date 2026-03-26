#import "../src/lib.typ" as ufpr

#show: ufpr.template.with(
  title: "Título",
  authors: ("Autor Um", "Autor Dois"),
  advisor: "Prof. Dr. Orientador",
  city: "Cidade",
  year: 2000,
  description: lorem(30),
  references: bibliography("refs.bib"),

  has-cover: true,
  co-advisor: "Profª. Drª. Coorientadora",
  dedication: [
    #lorem(30)

    #lorem(30)
  ],
  acknowledgement: [
    #lorem(30)

    #lorem(30)
  ],
  epigraph: (
    quote(attribution: lorem(3), lorem(20)),
  ),
  abstract: [
    #lorem(200)
    \ \
    Palavras-chave: teste, formatação
  ],
  abstract-foreign: ("ABSTRACT", [
    #lorem(200)
    \ \
    Key words: test, format
  ]),
  abbreviations: (
    "etc.", [_et cetera_]
  ),
  acronyms: (
    "LID", lorem(3)
  ),
  glossary: (
    "lorem", lorem(20)
  )
)

= Título Principal

== Título Secundário

=== Título Terciário

#lorem(100)

#ufpr.illustration(
  image("cat.jpg", height: 5cm),
  caption: lorem(14),
  source: [@obra],
  supplement: "fotografia"
)

#lorem(10)
$
  A=B
$<equation>
#lorem(10)@equation

#lorem(50)@obra

#ufpr.illustration(
  image("cat.jpg"),
  caption: lorem(14),
  supplement: "anexo"
)

#lorem(50)#footnote[#lorem(20)]

#ufpr.sheet(
  caption: lorem(10),
  columns: 2,
  note: lorem(20),
  legend: lorem(20),
  "Chave",  "Valor",
  "A",      "1",
  "B",      "2",
  "C",      "3"
)