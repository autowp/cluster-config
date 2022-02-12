FROM ubuntu:latest

LABEL app_name=tools maintainer=dmitry@pereslegin.ru

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq -y && \
    apt-get dist-upgrade -qq -y && \
    apt-get install -qq -y \
        bash \
        ca-certificates \
        gpg \
        gzip \
        lsb-release \
        mysql-client \
        s3cmd \
        wget \
    && \
    apt-get autoremove -qq -y && \
    echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update -qq -y && \
    apt-get install -qq -y postgresql-client
