FROM ubuntu

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends


RUN  apt-get install -y mongodb
RUN $pwd
RUN cat /var/jenkins_home/workspace/the-real-devops-challenge/data/restaurant.json
RUN mongoimport --uri "mongodb://appAdmin:secret@127.0.0.1:27017/myNewDatabase"   -c restaurants --file  /var/jenkins_home/workspace/the-real-devops-challenge/data/restaurant.json


