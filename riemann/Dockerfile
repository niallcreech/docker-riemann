FROM ubuntu:trusty
MAINTAINER tools@digital.justice.gov.uk
COPY files/confd /etc/confd

RUN apt-get update 
RUN apt-get install -y \
    default-jre \
    curl
RUN curl https://aphyr.com/riemann/riemann_0.2.10_all.deb -o riemann_0.2.10_all.deb
RUN dpkg -i riemann_0.2.10_all.deb

ADD files/bin/confd-0.10.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
COPY files/run.sh $WORKDIR


ADD files/etc/riemann/riemann.config /etc/riemann/riemann.config

# 5555 - Riemann TCP and UDP
# 5556 - Riemann WS
EXPOSE 5555 5555/udp 5556
ENTRYPOINT ["sh", "./run.sh"]
