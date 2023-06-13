#FROM python:3.7 
# W. Vincent
FROM --platform=linux/amd64 python:3.10.4-slim-bullseye as base
# FROM python:3.8.3-slim 
#--------------------------------------------------------

# create the appropriate directories
##
ENV APP_HOME=/code
RUN mkdir $APP_HOME
RUN mkdir $APP_HOME/staticfiles
# worker directory
WORKDIR $APP_HOME
#crearte user django
RUN addgroup --system django && adduser --system --no-create-home --group django
#--------------------------------------------------------

# Set environment variables
# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
#Removing intermediate container 
RUN set -eux
RUN set -ex;
FROM base AS python-deps

#--------------------------------------------------------
# update 
RUN apt update && apt -y upgrade && apt autoclean
RUN apt install -y gcc wget curl python3-dev python3-pip musl-dev
RUN apt install -y bash vim nano tree
# install postgresql client
RUN apt install -y postgresql-client
# install sqlite3
RUN apt-get install sqlite3 libsqlite3-dev
# install openssh
RUN apt install -y openssh-server

#--------------------------------------------------------
# virtualenv pipenv
# COPY Pipfile  ${APP_HOME}
#RUN apt install pipenv -y 
#RUN pip install --user pipenv
#RUN pipenv --python 3.9.2 install --system 
#RUN PIPENV_VENV_IN_PROJECT=1 pipenv --python 3.9.2  install --deploy
# activate pipenv

#--------------------------------------------------------
# clean
RUN apt clean

#--------------------------------------------------------
# changer mot de pass root
RUN echo 'django:grutil001' | chpasswd
# 
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# start ssh process
RUN ["/etc/init.d/ssh", "start"]
## Expose port 22
## EXPOSE 22

# change mode owner
RUN chown -R django:django ${APP_HOME} && chmod -R 755 ${APP_HOME}

# unlock password root
#RUN passwd -u root
# Delete root password (set as empty)
#RUN passwd -d root

#--------------------------------------------------------
# install dependies
# copie projet 
RUN pip install --upgrade pip
COPY ./requirements.txt $APP_HOME/
COPY ./entrypoint.sh $APP_HOME/

COPY *.* $APP_HOME/
COPY . .

# add bash to django user
RUN chsh -s /bin/bash django 
# install django ...
RUN pip install -r $APP_HOME/requirements.txt
## install dbshell
#
# user django
#USER django
ENTRYPOINT [ "/code/entrypoint.sh" ]


