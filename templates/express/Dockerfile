FROM node:12.22-alpine as dev

WORKDIR /app

COPY package.json ./
COPY /dist ./
COPY .env .env
RUN npm i


EXPOSE 8080
CMD ["node","index.js"]

FROM node:12.22-alpine as prod

WORKDIR /app

COPY package.json ./
COPY /dist ./
COPY .env.production .env
RUN npm i


EXPOSE 8080
CMD ["node","index.js"]