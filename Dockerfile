FROM arangodb/arangodb:3.7.12


ENV ARANGO_NO_AUTH true

RUN mkdir /opt/arangodb && \
    mkdir /opt/arangodb/data && \
    mkdir /opt/arangodb/logs && \
    touch /opt/arangodb/logs/arangodb.log && \
    apk add curl

COPY ./conf/arangod.conf /etc/arangodb3/arangod.conf
COPY ./conf/schema.js /opt/app/conf/schema.js
COPY ./bin/* /opt/app/bin/

ENTRYPOINT /opt/app/bin/start-arangodb.sh
