#! /bin/sh
if [ " $ DATABASE " = "postgres" ]
    then
        echo "En attente de postgres ..."
        while ! nc -z $ SQL_HOST $ SQL_PORT ; do
            sleep 0 .1
        done
    echo
    "PostgreSQL a démarré"
fi
#python3 manage.py flush --no-input
python3 manage.py migrate
python3 manage.py makemigrations accounts
python3 manage.py migrate
#rm -r staticfiles/*
chmod 766 * -R
chmod a+x static staticfiles app/static -R
python3 manage.py collectstatic --noinput
## creation du superuser abdel et admin
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(username='admin', password='grutil001', email='admin@atlass.fr')" | python3 manage.py shell
#
exec "$@"