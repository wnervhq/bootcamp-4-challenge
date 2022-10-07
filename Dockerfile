FROM ubuntu:18.04

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y curl \
&& curl -fsSL https://deb.nodesource.com/setup_16.x | bash \
&& apt-get install nodejs -y

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY index.js ./
COPY program.sh ./

RUN apt-get remove -y curl

RUN  chmod +x ./program.sh

EXPOSE 8888

ENTRYPOINT ["./program.sh"]

#byWnervHQ