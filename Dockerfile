FROM alpine:3.21

RUN apk --no-cache add postgresql-client git

COPY run.sh /run.sh

RUN chmod +x /run.sh

ENV PGPASSFILE=/home/.pgpass
RUN touch /home/.pgpass
RUN chmod 600 /home/.pgpass

ENTRYPOINT [ "/run.sh" ]