FROM alpine
MAINTAINER Marcelo Almeida <ms.almeida86@gmail.com>

RUN apk --update add curl

ADD crons/ /crons/
RUN crontab -l | { cat; for i in /crons/*; do cat $i; done; } | crontab -

VOLUME /crons

CMD ["crond", "-f", "-d", "8"]
