# FROM nginx:1.21.3-alpine AS primeiro-estagio
# WORKDIR /site

# COPY config.toml config.toml
# COPY index.html /site/layouts/index.html
# COPY _index.md /site/content/_index.md

# RUN apk add hugo
# RUN hugo --minify --gc
# RUN mv /site/public/* usr/share/nginx/html

# ENTRYPOINT ["nginx", "-g", "daemon off;"]

# Obtendo uma imagem Docker apenas com o nginx e as páginas geradas pelo Hugo:
  # Criando imagens intermediárias com apenas um arquivo Dockerfile:

# Primeiro estágio:
FROM alpine:3.14 AS primeiro-estagio
WORKDIR /site

COPY config.toml config.toml
COPY index.html /site/layouts/index.html
COPY _index.md /site/content/_index.md

RUN apk add hugo
RUN hugo --minify --gc

# segundo estágio

FROM nginx:1.21.3-alpine AS segundo-estagio
COPY --from=primeiro-estagio /site/public/ /usr/chare/nginx/html
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

# Diferenças:
  # - Duas linhas de FROM onde cada linha significa um novo estágio;
  # - Considerando cada estágio como uma imagem Docker intermediária;
  # - A última referÊncia de FROM sempre será a imagem final;
  # - No segundo estágio, a linha COPY possui uma flag extra --from=primeiro-estagio:
  # - Esse é o segredo principal de construção de múltiplos estágios;
  # - O COPY possui a capacidade de copiar arquivos entre os estágios;
  # - A flag --from indica que devemos copiar o seguinte arquivo ou pasta de um estágio para o estágio atual;
  # - Neste caso acima, estamos copiando as páginas HTML resultantes do Hugo diretamente para uma imagem Docker limpa de nginx!
  # - Após isso, iniciamos um novo estágio, agora com a imagem base nginx:1.21.3-alpine. Nesse caso, as únicas ações foram copiar as páginas HTML prontas do estágio anterior e deixá-las no caminho que o nginx espera que estejam presentes: /usr/share/nginx/html.
  # - No terminal: docker build -t multi-stage-site-hugo .