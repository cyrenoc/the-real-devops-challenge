#!/bin/bash

sudo apt-get install -y mongodb

mongoimport --uri "mongodb://appAdmin:secret@127.0.0.1:27017/myNewDatabase"   -c restaurants --file  /home/ubuntu/jenkins/the-real-devops-challenge/data/restaurant.json

