FROM ubuntu

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends


RUN  apt-get install -y mongodb
RUN  apt-get install -y wget
RUN wget -P  /tmp/  https://github.com/cyrenoc/the-real-devops-challenge/tree/master/data/restaurant.json 
RUN mongoimport --uri "mongodb://appAdmin:secret@127.0.0.1:27017/myNewDatabase"   -c restaurant --file  /tmp/restaurant.json


