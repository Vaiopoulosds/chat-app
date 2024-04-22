FROM mysql:8.3.0

ENV MYSQL_DATABASE=chat_app
ENV MYSQL_ROOT_PASSWORD=pswd

COPY chat_app.sql /docker-entrypoint-initdb.d/
