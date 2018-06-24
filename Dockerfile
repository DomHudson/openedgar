FROM python:3.6.5-slim
#FROM openjdk:8

WORKDIR /usr/src/app

COPY . .

RUN cp lexpredict_openedgar/docker.env lexpredict_openedgar/.env

RUN apt update \
    && apt install -y \
    build-essential \
    python3-dev \
    python3-pip \
    wget

RUN bash tika/download_tika.sh

RUN pip3 install -r lexpredict_openedgar/requirements/full.txt

CMD bash docker-entrypoint.sh