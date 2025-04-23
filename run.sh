#!/bin/sh

DB_HOST=$1
DB_PORT=$2
DB_USER=$3
DB_NAME=$4

DB_PASSWORD=$5

DATA_DIR=$6
CODE_DIR=$7

touch "~/.pgpass"
chmod 0600 ~/.pgpass"
echo "$DB_HOST:$DB_PORT:$DB_NAME:$DB_USER:$DB_PASSWORD" > "~/.pgpass"

for file in $DATA_DIR/*sql; do
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f $file
    rm $file
    git add $file
done

git commit -m "tidy: remove rolled-in data scripts"
git push