FROM node:10.15-jessie

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm i

COPY ./dist/fe-app /usr/src/app/www
COPY ./server.js /usr/src/app/server.js

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/health || exit 1

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "node server.js"]
