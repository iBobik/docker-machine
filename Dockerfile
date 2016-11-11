FROM alpine:edge

RUN apk -q update && apk add docker curl openssh-client py2-pip

RUN pip install docker-compose
RUN docker-compose --version

RUN curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m` > /usr/bin/docker-machine && chmod +x /usr/bin/docker-machine
RUN docker-machine --version

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
