FROM alpine:3.7

VOLUME /var/log/dockergen

ENV DOCKER_HOST unix:///var/run/docker.sock

RUN apk add --no-cache curl iptables bash
RUN mkdir /dockergen
RUN curl -L -o /dockergen/dockergen.tar.gz https://github.com/jwilder/docker-gen/releases/download/0.7.3/docker-gen-linux-amd64-0.7.3.tar.gz
RUN tar xf /dockergen/dockergen.tar.gz -C /dockergen

COPY ./dockergen /dockergen

CMD /dockergen/docker-gen -config /dockergen/dockergen.conf
