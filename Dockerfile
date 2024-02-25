FROM node:20-alpine

WORKDIR /usr/src/api

COPY . .

COPY ./.env ./.env

COPY package*.json ./

RUN npm install --quiet --no-optional --no-fund --loglevel=error

RUN npm run build

CMD [ "npm", "run", "start:dev" ]