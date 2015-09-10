FROM webhippie/alpine:latest
MAINTAINER Thomas Boerger <thomas@webhippie.de>



ENV DISCOVERY_TYPE etcd
ENV DISCOVERY_HOST http://127.0.0.1
ENV DISCOVERY_PORT 4001
ENV DISCOVERY_INTERVAL 30
ENV DISCOVERY_PREFIX /



RUN apk add --update \
  build-base \
  python-dev \
  python \
  py-pip \
  py-setuptools \
  libxslt-dev \
  libxml2-dev \
  postfix \
  postfix-mysql \
  postfix-sqlite \
  dovecot \
  dovecot-mysql \
  dovecot-sqlite \
  spamassassin \
  amavisd-new \
  clamav \
  dovecot-pigeonhole-plugin@testing \
  radicale@testing && \
  rm -rf /var/cache/apk/* && \
  pip install -U \
  modoboa \
  modoboa-admin \
  modoboa-amavis \
  modoboa-admin-relaydomains \
  modoboa-stats \
  modoboa-postfix-autoreply \
  modoboa-radicale \
  modoboa-sievefilters \
  modoboa-webmail \
  modoboa-admin-limits

# modoboa-admin.py deploy webhippie --collectstatic --dburl default:sqlite:////var/lib/modoboa/database.sqlite3 --domain mail.webhippie.de --lang en --timezone Europe/Berlin --extensions all

VOLUME ["/var/lib/postfix", "/var/lib/radicale", "/var/lib/modoboa"]

ADD rootfs /
EXPOSE 443

WORKDIR /root
CMD ["/usr/bin/s6-svscan","/etc/s6"]
