FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
# Isso significa copiar algo de outra fase (build), tem que especificar a pasta que quer copiar (/app/build)