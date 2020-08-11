# Use root/example as user/password credentials
FROM mongo

RUN apt-get update
RUN apt-get install nano
#CMD echo 'db.createUser({ user: "appAdmin", pwd: "secret",  mechanisms:["SCRAM-SHA-1"] ,roles: [ { role: "clusterAdmin", db: "admin" }, { role: "readAnyDatabase", db: "admin" }, "readWrite" ]});' | mongo  "mongodb://mongoadmin:secret@jenkinsgui.checamed.network:27017/?authSource=admin"
#CMD ["mongod", "-f", "/etc/mongod.conf"]

