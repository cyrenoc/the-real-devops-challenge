#!/bin/bash
# https://www.stuartellis.name/articles/shell-scripting/#enabling-better-error-handling-with-set
#set -Eeuo pipefail
 
# Based on mongo/docker-entrypoint.sh
# https://github.com/docker-library/mongo/blob/master/docker-entrypoint.sh#L303

#if [ "$MONGO_INITDB_USERNAME" ] && [ "$MONGO_INITDB_PASSWORD" ]; then
#    "${mongo[@]}" -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase "$rootAuthDatabase" "$MONGO_INITDB_DATABASE" <<-EOJS
#        db.createUser({
#            user: $(_js_escape "$MONGO_INITDB_USERNAME"),
#            pwd: $(_js_escape "$MONGO_INITDB_PASSWORD"),
#            roles: [ { role: 'readWrite', db: $(_js_escape "$MONGO_INITDB_DATABASE") } ]
#        })
#    EOJS
#fi
#echo 'db.createUser( { user: "appAdmin", pwd: "secret", mechanisms:["SCRAM-SHA-1"] , roles: [ { role: "clusterAdmin", db: "admin" },  { role: "readAnyDatabase", db: "admin" }, { role: "readWrite",db:"myNewDatabase"} ] } );'  | mongo  "mongodb://mongoadmin:secret@127.0.0.1:27017/?authSource=admin" 



mongo -- "$MONGO_INITDB_DATABASE" <<EOF
    var rootUser = '$MONGO_INITDB_ROOT_USERNAME';
    var rootPassword = '$MONGO_INITDB_ROOT_PASSWORD';
    var admin = db.getSiblingDB('admin');
    admin.auth(rootUser, rootPassword);

    var user = '$MONGO_INITDB_USERNAME';
    var passwd = '$MONGO_INITDB_PASSWORD';
    db.createUser({user: user, pwd: passwd, roles: ["readWrite"]});
EOF
