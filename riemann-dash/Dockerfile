FROM ubuntu:trusty
MAINTAINER tools@digital.justice.gov.uk
COPY files/confd /etc/confd

RUN apt-get update 
RUN apt-get install -y \
    ruby-dev \
    build-essential \
    zlib1g-dev \
    curl
RUN gem install --no-ri --no-rdoc riemann-client riemann-tools riemann-dash

ADD files/bin/confd-0.10.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
ADD files/etc/riemann/riemann-dash.config /etc/riemann/riemann-dash.config
COPY files/run.sh $WORKDIR

# 5555 - Riemann TCP and UDP
# 5556 - Riemann WS
EXPOSE 4567
ENTRYPOINT ["sh", "./run.sh"]
