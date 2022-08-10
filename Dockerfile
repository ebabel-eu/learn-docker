FROM node:12.16.2

WORKDIR /code

ENV PORT 80

COPY package.json /code/package.json

RUN npm install

COPY . /code

CMD [ "node", "src/server.js" ]
