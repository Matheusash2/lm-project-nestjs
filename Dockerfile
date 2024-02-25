FROM node:20-alpine

WORKDIR /api

COPY . .

COPY package*.json ./

RUN npm install

RUN npm run build

EXPOSE 3001

CMD [ "npm", "run", "start:dev" ]