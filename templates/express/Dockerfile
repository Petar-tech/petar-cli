FROM node:12.22-alpine 

WORKDIR /app

COPY package.json package.json 
RUN npm i

COPY .env .env
COPY ./dist/src /app/src

CMD ["npm","run","start:service"]
