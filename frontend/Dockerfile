FROM node:14

RUN npm install -g @angular/cli 

WORKDIR /frontend

COPY package.json .

RUN npm install

COPY . .

EXPOSE ${FRONT_PORT}

CMD ng serve --host 0.0.0.0 --port ${FRONT_PORT}