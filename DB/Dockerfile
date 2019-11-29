FROM mysql:5.7.28

ADD Dump/DB-Dump.sql /docker-entrypoint-initdb.d

RUN chmod a+x /docker-entrypoint-initdb.d/DB-Dump.sql && chown root:root /docker-entrypoint-initdb.d/DB-Dump.sql

EXPOSE 3306
CMD ["mysqld"]