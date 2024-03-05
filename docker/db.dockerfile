FROM mariadb:latest

ADD ./data/db/conf.d /etc/mysql/conf.d

ADD ./data/db/initdb.d /docker-entrypoint-initdb.d

RUN ["chmod", "755", "-R", "/etc/mysql/conf.d"]
RUN ["chmod", "755", "-R", "/docker-entrypoint-initdb.d"]