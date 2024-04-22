FROM python:3.12.2-alpine3.19

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /backend

RUN apk add --update docker openrc
RUN rc-update add docker boot
RUN apk add --no-cache bash

RUN apk add --no-cache python3
RUN apk add --no-cache --virtual .build-deps py-pip python3-dev musl-dev gcc mariadb-dev
RUN pip install mysqlclient

RUN pip install --upgrade pip 
RUN pip install pipenv

COPY Pipfile Pipfile.lock /backend/
COPY *.evn /backend/

RUN pipenv install --system

ENV MYSQL_PASSWORD=pswd
COPY ./backend /backend/


CMD ["pipenv", "run", "python", "manage.py","runserver", "0.0.0.0:8000"]

EXPOSE 8000