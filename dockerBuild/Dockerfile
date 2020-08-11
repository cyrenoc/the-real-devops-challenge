FROM ubuntu

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends


RUN  apt-get install -y mongodb
RUN  apt-get install -y wget
RUN wget -P  /tmp/  https://raw.githubusercontent.com/cyrenoc/the-real-devops-challenge/master/data/restaurant.json 
RUN mongoimport --uri "mongodb://appAdmin:secret@jenkinsgui.checamed.network:27017/myNewDatabase"   -c restaurant --file  /tmp/restaurant.json


