FROM alpine:3.21

RUN apk --no-cache add postgresql-client git

COPY run.sh ./run.sh

ENTRYPOINT [ "./run.sh" ]