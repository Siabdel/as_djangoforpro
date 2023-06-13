#!/bin/sh
export PGPASSWORD='postgres' 
export DATABASE='postgres' 
export SQL_HOST='localhost' 
export SQL_PORT=5432

#! /bin/sh
# sleep 1 .2
if [ $DATABASE != "postgres" ]
    then
        echo "En attente de postgres ..."
        while ! nc -z $SQL_HOST $SQL_PORT ; do
            sleep 0 .1
            echo "tentative de connection to PostgreSQL host"
        done
    echo "PostgreSQL a démarré"
fi
# psql -h 'server name' -U 'user name' -d 'base name' -c 'command'
# su - postgres -c "export PGPASSWORD='postgres'; psql -h db -U postgres -p 5432 -d postgres -f /src/sql/dbcreate.sql --no-password ;"  
## su - postgres -c "pg_restore -d wagtailmonsitedb /src/wagtailmonsitedump.db --no-password ;";  bash-5.0# 
## su - postgres -c "psql -d postgres -f ./sql/dbcreate.sql --no-password ;"  
# su - postgres  -c "pg_ctl -D /usr/local/var/postgres start"
# su - postgres  -c "pg_ctl -D /usr/local/var/postgres start"
# dropdb  djangoblogdb
# createdb  djangoblogdb
pwd
#./create_db.sh
ls -l 
#sudo docker exec -it blog_db su - postgres -c "psql -d postgres -f /src/sql/dbcreate.sql"
#su - postgres -c "psql -d postgres -f /src/sql/dbcreate.sql"
#su - postgres -c "psql -d postgres -f /src/sql/dbcreate.sql --no-password ;"  

