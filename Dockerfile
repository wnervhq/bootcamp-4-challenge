FROM ubuntu:18.04

RUN apt update \
&& apt upgrade -y \
&& apt install -y curl \
&& curl -fsSL https://deb.nodesource.com/setup_16.x | bash \
&& apt install nodejs -y

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY index.js ./

RUN apt remove -y curl

EXPOSE 8888

CMD "npm" "start"

#byWnervHQ