FROM ubuntu

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends


RUN  apt-get install -y mongodb
RUN  apt-get install -y wget
#COPY /var/jenkins_home/workspace/the-real-devops-challenge/data/restaurant.json /tmp/restaurant.json 
#RUN /var/jenkins_home/workspace/the-real-devops-challenge/data/restaurant.json
RUN cd /tmp/ 
RUN wget https://github.com/cyrenoc/the-real-devops-challenge/tree/master/data/restaurant.json
RUN ls /tmp/
RUN mongoimport --uri "mongodb://appAdmin:secret@127.0.0.1:27017/myNewDatabase"   -c restaurants --file  /tmp/restaurant.json


