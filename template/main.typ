#import "@preview/ufpr-unofficial:2022.1.0": *

#show: template.with(
  title: "UFPR Map Composer: Plugin QGIS para Geração Automatizada de WebGIS",
  authors: ("Glória Maria Deitos Gomes da Silva",),
  advisor: "Profª. Silvana Philippi Camboim",
  city: "Curitiba",
  year: 2026,
  description: [
    Relatório técnico apresentado à disciplina de Desenvolvimento de Aplicações
    Geoespaciais, do Departamento de Geomática da Universidade Federal do Paraná,
    como requisito parcial para aprovação na disciplina.
  ],
  references: none, // Referências bibliográficas: bibliography("refs.bib") para gerar, none para não gerar
  has-cover: true, // Capa: true para gerar, false para não gerar
  has-toc: true, // Sumário: true para gerar, false para não gerar
  has-list-of-figures: false, // Lista de Ilustrações: true para gerar, false para não gerar
  has-list-of-tables: false, // Lista de Tabelas: true para gerar, false para não gerar
  has-blank-pages: false, // Páginas em branco entre capa/contracapa/sumário (padrão ABNT): true para gerar, false para não gerar
)

= Introdução

O avanço das tecnologias de informação geográfica tem ampliado as possibilidades de comunicação e disseminação de dados espaciais, tornando cada vez mais relevante o desenvolvimento de ferramentas que integrem o ambiente de análise em SIG com plataformas web interativas. Nesse contexto, a disciplina de Desenvolvimento de Aplicações Geoespaciais propõe que os estudantes não apenas processem e analisem dados espaciais, mas também desenvolvam soluções capazes de publicar esses resultados de forma acessível na web.

Dessa maneira, o presente relatório tem como objetivo descrever o desenvolvimento do UFPR Map Composer, um plugin para o QGIS produzido como trabalho prático desta disciplina. As seções a seguir apresentam o objetivo, a arquitetura, as tecnologias empregadas, o tratamento de dados, os serviços externos utilizados, os resultados obtidos, as limitações identificadas e as possibilidades de desenvolvimento futuro.

= Objetivo

A publicação de mapas interativos na web a partir de projetos QGIS representa, historicamente, uma barreira técnica para profissionais da área de geomática. Embora o QGIS permita a manipulação avançada de dados espaciais, a geração de uma aplicação web interativa a partir dessas camadas exige conhecimentos em desenvolvimento web e infraestrutura de hospedagem que estão fora do domínio tradicional do profissional em SIG. Nesse contexto, o plugin qgis2web oferece uma alternativa para exportar projetos QGIS como mapas web estáticos. Contudo, sua abordagem apresenta fidelidade parcial aos estilos do QGIS, não gera uma aplicação web otimizada para publicação e não oferece personalização de interface além do padrão, como modelos visuais institucionais, galeria de documentos vinculados ou seção de créditos de equipe. Diante dessas limitações, o UFPR Map Composer foi desenvolvido como um plugin QGIS capaz de oferecer uma solução mais completa, permitindo que qualquer usuário publique mapas interativos sem escrever uma linha de código.

O objetivo central do plugin é automatizar a geração de uma aplicação WebGIS estática completa diretamente a partir do projeto QGIS ativo. Para isso, o usuário preenche um formulário gráfico integrado ao próprio QGIS, configurando quais camadas incluir, quais mapas base habilitar, quais atributos exibir nos popups e quais documentos e créditos de equipe adicionar. Ao acionar a geração, o plugin executa todas as etapas de exportação de dados, estruturação do projeto e compilação, entregando uma aplicação web pronta para publicação sem necessidade de interação com o terminal.

= Arquitetura

A arquitetura do UFPR Map Composer é organizada em duas camadas distintas: a camada do plugin Python no QGIS e a camada do WebGIS gerado.

A camada do plugin opera dentro do ecossistema da API Python do QGIS. Sua estrutura é centrada em uma classe principal (`UfprMapComposer`), responsável por registrar o botão na barra de ferramentas e a entrada no menu Web do QGIS, e em um diálogo com múltiplas abas (`UfprMapComposerDialog`) montado por meio do padrão Mixin, em que cada aba do formulário corresponde a um módulo Python dedicado. Essa organização garante que funcionalidades como seleção de camadas, configuração de mapas base, filtragem de atributos e gerenciamento de documentos e equipe sejam mantidas de forma independente. Quando o usuário confirma a configuração, uma classe geradora (`WebGISGenerator`) assume o controle, substituindo os marcadores dinâmicos nos arquivos do template React e escrevendo os arquivos finais no diretório de destino. O processo é concluído com a execução de `npm install` e `npm run build` como subprocessos, compilando o projeto sem que o usuário precise abrir o terminal.

A camada do WebGIS gerado, por sua vez, é um template de aplicação React pré-construído que é copiado, configurado e compilado no momento da geração. Ele é composto por uma hierarquia de componentes TypeScript, um arquivo de configuração (`config.ts`) que recebe o centro do mapa, o nível de zoom, as definições de mapas base e os descritores de camadas, e um arquivo de dados (`geodata.ts`) que incorpora todas as feições vetoriais diretamente no código. Dessa forma, a aplicação gerada é totalmente independente de servidor e pode ser publicada em serviços de hospedagem estática sem configuração adicional.

// IMAGEM SUGERIDA: diagrama ou fluxograma da arquitetura do plugin (ex.: fluxo do formulário até o site gerado)
// Para inserir: #illustration(image("sua-imagem.png"), caption: [Fluxo de geração do WebGIS pelo plugin UFPR Map Composer.], supplement: "figura")

= Tecnologias

Para a realização do plugin, foram empregadas tecnologias distribuídas em dois ambientes de execução. No lado QGIS/Python, utilizou-se: o *QGIS 3.16 ou superior* e a *API PyQGIS* para leitura das camadas, captura do estado do canvas e transformação de coordenadas; a biblioteca *GDAL* por meio de bindings Python (`osgeo.gdal`) para reprojeção de rasters e por meio de subprocesso (`gdal2tiles`) para geração de tiles XYZ; e o *PyQt5* para a construção do diálogo com múltiplas abas, indicadores de progresso e seletores de cor.

O projeto WebGIS gerado é estruturado a partir de um template que incorpora as seguintes ferramentas: *React 19* para a construção da interface em componentes; *OpenLayers 10* para a renderização interativa do mapa, com suporte a camadas XYZ, vetores GeoJSON, estilos e popups; *TypeScript 5.7* para tipagem estática dos componentes e arquivos de configuração; *Tailwind CSS 4* para estilização responsiva; *Vite 6* como ferramenta de build; e *FontAwesome 6* para os ícones da interface.

= Dados

O tratamento de dados no UFPR Map Composer é realizado por dois processos distintos, um para cada tipo de dado espacial suportado pelo QGIS. As camadas vetoriais do projeto ativo são exportadas como GeoJSON no sistema de coordenadas WGS 84 (EPSG:4326) por meio da API `QgsVectorFileWriter`. Para isso, a rotina de exportação sempre fornece um objeto `QgsCoordinateTransform` explícito, mesmo quando a camada de origem já está em EPSG:4326, a fim de evitar um erro introduzido no QGIS 3.38 quando uma transformação nula é passada ao escritor. As feições GeoJSON resultantes são então incorporadas diretamente no arquivo `geodata.ts`, tornando todos os dados vetoriais disponíveis ao mapa sem requisições de rede.

As camadas raster, por outro lado, seguem um processo mais intensivo. Inicialmente, cada raster é reprojetado para EPSG:3857 (Web Mercator) utilizando a função `Warp` do GDAL com compressão LZW, produzindo um GeoTIFF intermediário em um diretório temporário. Em seguida, o `gdal2tiles` é executado para gerar uma pirâmide de tiles XYZ armazenada na pasta `public/` do projeto de saída. Os níveis de zoom são configuráveis por camada na interface do plugin, permitindo equilibrar o tamanho dos arquivos gerados com o nível de detalhe do mapa. Dessa forma, dados raster como ortofotos, modelos digitais de elevação e imagens classificadas são servidos como tiles padrão ao lado das camadas vetoriais.

= APIs e Serviços Utilizados

Diversos serviços externos de tiles e bibliotecas são utilizados no WebGIS gerado. No lado do plugin, a API Python do QGIS é utilizada para leitura do projeto e das camadas, a biblioteca GDAL para o processamento raster e o Node.js para a etapa de compilação com Vite. Os serviços disponíveis na camada da aplicação gerada são os seguintes:

- *OpenStreetMap Tile API:* mapa base padrão, serviço XYZ gratuito.
- *CartoDB Positron:* alternativa de mapa base claro e minimalista.
- *CartoDB Dark Matter:* mapa base escuro para contraste visual.
- *Esri World Imagery:* imagem de satélite via serviço REST do ArcGIS.
- *Esri World Topo Map:* mapa topográfico via serviço REST do ArcGIS.
- *OpenStreetMap Humanitário (HOT):* variante humanitária do OpenStreetMap.
- *QRCode.react (biblioteca npm):* geração de QR code para o menu de compartilhamento.

= Resultados

O plugin desenvolvido atinge com êxito o objetivo proposto. O processo completo de geração, desde a configuração no formulário até um site estático pronto para publicação, opera inteiramente dentro do QGIS, sem que o usuário precise escrever código ou interagir com o terminal. A aplicação gerada oferece as seguintes funcionalidades: mapa interativo com controles de zoom e navegação; barra lateral para ativar e desativar camadas individualmente; galeria de mapas base para troca entre seis opções disponíveis; modo de comparação com swipe entre dois mapas base; popups e tabela de atributos ao clicar em feições; botões de download do GeoJSON por camada; menu de documentos PDF linkados na barra de navegação; seção de créditos da equipe no rodapé; e layout responsivo para desktop e mobile.

Além disso, a aplicação gerada é totalmente independente de servidor: todos os dados vetoriais são incorporados no momento do build e todos os dados raster são servidos como tiles locais. Com isso, o resultado pode ser publicado no GitHub Pages, Netlify ou qualquer servidor de arquivos estáticos sem configuração adicional. Do ponto de vista institucional, o estilo glassmorphism adotado, com painéis translúcidos e a paleta de cores da UFPR-CTM, garante uma aparência profissional e coerente para portais de mapas acadêmicos e institucionais.

// IMAGEM SUGERIDA: captura de tela do WebGIS gerado aberto no navegador, mostrando o mapa, a barra lateral de camadas e os controles
// Para inserir: #illustration(image("sua-imagem.png"), caption: [Interface do WebGIS gerado pelo plugin UFPR Map Composer.], supplement: "figura")

= Limitações

Apesar de sua eficácia, o plugin apresenta algumas limitações que merecem ser mencionadas. Em primeiro lugar, a etapa de compilação exige que o Node.js esteja instalado na mesma máquina que o QGIS, o que pode não ser o caso em estações de trabalho institucionais compartilhadas, gerando dificuldades para usuários menos técnicos. Em segundo lugar, a geração de tiles raster pode ser demorada para dados de grande extensão ou alta resolução, produzindo um número elevado de arquivos que pode exceder os limites de hospedagem gratuita, como o GitHub Pages.

Em terceiro lugar, o WebGIS gerado é estático: os dados são fixados no momento da geração e a aplicação não oferece mecanismo para consultas espaciais ao servidor, feeds de dados em tempo real ou filtragem dinâmica de atributos. Usuários que necessitam dessas capacidades precisariam de infraestrutura de backend adicional. Por fim, a cadeia de ferramentas foi desenvolvida primariamente para Windows, visto que o instalador é baseado em PowerShell e algumas etapas dependem da configuração do ambiente QGIS nesse sistema operacional, o que significa que o uso em Linux e macOS não foi validado na versão atual.

= Possibilidades Futuras

Diversas melhorias apresentam potencial relevante para versões futuras do plugin. A mais impactante seria a integração de serviços remotos de camadas, como WMS (Web Map Service) e WFS (Web Feature Service), ao WebGIS gerado, permitindo que os usuários incluam dados institucionais ao vivo junto às camadas exportadas localmente. Além disso, a implementação de publicação direta no GitHub Pages, acionada de dentro do próprio plugin, eliminaria a etapa manual de implantação e tornaria a ferramenta mais acessível para usuários sem experiência em linha de comando.

O suporte a Linux e macOS representa outro caminho de desenvolvimento importante, ampliando a base de usuários, especialmente em ambientes acadêmicos onde o QGIS é comumente utilizado em Linux. Adicionalmente, a exportação incremental, em que apenas as camadas modificadas desde a última geração são re-exportadas e re-processadas, reduziria consideravelmente o tempo de geração em projetos grandes e atualizados com frequência. Por fim, o desenvolvimento de outros templates visuais além do estilo UFPR-CTM atual ampliaria a aplicabilidade do plugin para diferentes contextos institucionais e profissionais.

= Conclusão

O desenvolvimento do UFPR Map Composer demonstra que é possível integrar o ambiente de análise espacial do QGIS com a geração automática de aplicações WebGIS interativas, eliminando a necessidade de conhecimentos em desenvolvimento web por parte do usuário. A metodologia adotada, baseada na exportação de camadas vetoriais como GeoJSON, na geração de tiles XYZ para rasters e na compilação automática de um projeto React com OpenLayers, mostrou-se eficiente para atender ao objetivo proposto.

Portanto, com base nos resultados obtidos, o plugin cumpre sua função de tornar a publicação de mapas interativos na web acessível a profissionais e estudantes de geomática, sem exigir infraestrutura de servidor. As limitações identificadas, em especial a dependência do Node.js e o foco no sistema operacional Windows, indicam caminhos claros para o aprimoramento do plugin em versões futuras.

O código-fonte do plugin está disponível publicamente em #link("https://github.com/gloriadeitos/ufpr-map-composer"). Para facilitar a instalação, a página de lançamentos do repositório disponibiliza dois formatos: um instalador executável que copia automaticamente os arquivos do plugin para a pasta correta do QGIS, e um arquivo compactado no formato ZIP para quem preferir instalar o plugin pelo gerenciador de plugins do próprio QGIS. Ambos podem ser obtidos em #link("https://github.com/gloriadeitos/ufpr-map-composer/releases").
