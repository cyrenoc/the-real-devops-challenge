#!/bin/bash

sudo apt-get install -y mongodb

echo 'db.createUser({ user: "appAdmin", pwd: "secret",  mechanisms:["SCRAM-SHA-1"] ,roles: [ { role: "clusterAdmin", db: "admin" }, { role: "readAnyDatabase", db: "admin" }, "readWrite" ]});' | mongo  "mongodb://mongoadmin:secret@127.0.0.1:27017/?authSource=admin"

