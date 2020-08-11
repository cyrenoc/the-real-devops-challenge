FROM ubuntu

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends
 
 
RUN apt install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt update 
RUN apt-cache policy docker-ce 
RUN apt install -y docker-ce
#RUN usermod -aG docker 

#RUN su - ${USER}
#RUN  apt-get install -y mongodb
#RUN  apt-get install -y wget
#RUN wget -P  /tmp/  https://raw.githubusercontent.com/cyrenoc/the-real-devops-challenge/master/data/restaurant.json 
RUN apt-get install -y inetutils-ping

RUN apt-get install -y git
RUN cd /var/opt && git clone https://github.com/cyrenoc/the-real-devops-challenge.git
RUN apt-get install -y python3.4
RUN apt-get install -y virtualenv

RUN apt-get install -y  python3-setuptools
#RUN easy_install pip3
#RUN source .venv/bin/activate
RUN apt install -y python3-pip
#CMD pip3 install -r /var/opt/the-real-devops-challenge/requirements.txt
#CMD source .venv/bin/activate
#RUN mongoimport --uri "mongodb://appAdmin:secret@localhost:27017/myNewDatabase"   -c restaurant --file  /tmp/restaurant.json


