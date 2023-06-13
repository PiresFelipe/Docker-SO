# Configuração de ambiente
FROM node:latest as angular
WORKDIR /app

# Dependências
COPY package.json /app
RUN npm install

# Rodar o pacote
COPY . .
RUN npm run build

# Configuração do pacore de rede NGINX
FROM nginx:latest
VOLUME /var/cache/nginx
COPY --from=angular app/dist/docker-example /usr/share/nginx/html
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf