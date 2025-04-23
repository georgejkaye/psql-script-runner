FROM alpine:3.21

RUN apk --no-cache add postgresql-client git

COPY run.sh /run.sh

RUN chmod +x /run.sh

RUN useradd -ms /bin/sh postgres
USER postgres

ENTRYPOINT [ "/run.sh" ]