FROM httpd:2.4.54
COPY index.html /usr/local/apache2/htdocs/
EXPOSE 80
CMD [ "httpd-foreground" ]

# docker run --rm -d -p 1234:80 --name meu-container meu-servidor-web
# Ao usar o comando docker run, uma nova flag foi utilizada: -p 1234:80
# No navegador não foi usada a porta 80 como exposto no Dockerfile, e sim a porta 1234
# No arquivo de anotações day 2, tem mais informações | linha 47