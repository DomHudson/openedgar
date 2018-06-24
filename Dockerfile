FROM python:3.6.5-slim

WORKDIR /usr/src/app

COPY . .

RUN cp lexpredict_openedgar/docker.env lexpredict_openedgar/.env

RUN add-apt-repository ppa:webupd8team/java \
    && apt update \
    && apt install -y \
    build-essential \
    python3-dev \
    oracle-java8-installer \
    oracle-java8-set-default \
    oracle-java8-unlimited-jce-policy

RUN pip install -r lexpredict_openedgar/requirements/full.txt

CMD python /usr/src/app/kernel-api/manage.py runserver