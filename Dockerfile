FROM node:8-alpine

ENV MOUNTEBANK_VERSION=1.14.0

RUN apk add --no-cache bash gawk sed grep bc coreutils

# npm commands to build or serve UI
RUN npm install -g grunt
RUN npm install -g bower
RUN npm install -g http-server
RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production
RUN npm install

EXPOSE 2525 2424 9000

ADD imposters /mb/
ADD ui /ui/
ADD *.sh /scripts/

ENTRYPOINT ["/scripts/entryPoint.sh"]
