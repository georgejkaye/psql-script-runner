#!/bin/sh

DB_HOST=$1
DB_PORT=$2
DB_USER=$3
DB_NAME=$4

DB_PASSWORD=$5

DATA_DIR=$6
CODE_DIR=$7

printenv
echo "$DB_HOST:$DB_PORT:$DB_NAME:$DB_USER:$DB_PASSWORD" > $PGPASSFILE

pwd
cd $GITHUB_WORKSPACE
ls ./$DATA_DIR
ls ./$DATA_DIR/*sql

for file in $DATA_DIR/*sql; do
    echo $file
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f $file -w
    rm $file
    git add $file
done

git commit -m "tidy: remove rolled-in data scripts"
git push