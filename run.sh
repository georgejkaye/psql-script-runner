# Set up db credentials in ~/.pgpass file
DB_HOST=$1
DB_PORT=$2
DB_USER=$3
DB_NAME=$4

DATA_DIR=$5
CODE_DIR=$6

for file in $DATA_DIR/*sql; do
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f $file
    rm $file
    git add $file
done

git commit -m "tidy: remove rolled-in data scripts"
git push