FROM webhippie/alpine:latest@sha256:e2c496756f621cb9f09f66c2bf21e6553431f8a6fe05dd428db4a8eeedce3dcd
MAINTAINER Thomas Boerger <thomas@webhippie.de>



ENV DISCOVERY_TYPE etcd
ENV DISCOVERY_HOST http://127.0.0.1
ENV DISCOVERY_PORT 4001
ENV DISCOVERY_INTERVAL 30
ENV DISCOVERY_PREFIX /



RUN apk update && \
  apk add \
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
    modoboa-admin-limits \
  rm -rf /var/cache/apk/*

# modoboa-admin.py deploy webhippie --collectstatic --dburl default:sqlite:////var/lib/modoboa/database.sqlite3 --domain mail.webhippie.de --lang en --timezone Europe/Berlin --extensions all

VOLUME ["/var/lib/postfix", "/var/lib/radicale", "/var/lib/modoboa"]

ADD rootfs /
EXPOSE 443

WORKDIR /root
CMD ["/bin/s6-svscan", "/etc/s6"]
