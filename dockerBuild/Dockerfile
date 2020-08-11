FROM ubuntu

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends


RUN apt install apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt update &&   \
    apt-cache policy docker-ce && \
    apt install docker-ce
RUN usermod -aG docker ${USER}

RUN su - ${USER}
RUN  apt-get install -y mongodb
RUN  apt-get install -y wget
RUN wget -P  /tmp/  https://raw.githubusercontent.com/cyrenoc/the-real-devops-challenge/master/data/restaurant.json 
RUN mongoimport --uri "mongodb://appAdmin:secret@localhost:27017/myNewDatabase"   -c restaurant --file  /tmp/restaurant.json


