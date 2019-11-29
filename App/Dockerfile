FROM node:latest

ENV NODE_ENV production
WORKDIR /usr/src/app

COPY package*.json ./

CMD ls -l
RUN npm install

COPY . .

EXPOSE 8080
CMD [ "node", "-r", "esm", "server.js"]
