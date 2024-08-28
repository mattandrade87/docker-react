FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# expose -> pro programador ver e entender que esse conteiner provavelmente precisara mapear uma porta para a porta 80
# nao faz nada mais
COPY --from=builder /app/build /usr/share/nginx/html