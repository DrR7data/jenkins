FROM alpine:latest

WORKDIR /plantilla-docker

COPY . /plantilla-docker/

RUN apk update \
    && apk add git

EXPOSE 5173

CMD [ "0.0.0.0", "3000:3000" ]
