FROM alpine:3.21

RUN apk --no-cache add postgresql12-client git

ENTRYPOINT [ "run.sh" ]