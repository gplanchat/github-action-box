FROM php:7.4-cli-alpine

LABEL maintainer="Grégory Planchat <gregory@kiboko.fr>"

RUN set -ex\
#    && apk update \
#    && apk upgrade \
#    && apk add \
#        wget \
#        ca-certificates \
#        git \
#        nodejs \
#        npm \
#        docker \
#        openssh \
#    && update-ca-certificates \
#    && apk add --virtual .build-deps \
#        autoconf \
#        bash \
#        binutils \
#        expat \
#        file \
#        g++ \
#        gcc \
#        m4 \
#        make \
#    && docker-php-ext-install opcache \
#    && apk add --update icu-dev icu \
#    && docker-php-ext-configure intl \
#    && docker-php-ext-install intl \
#    && docker-php-ext-configure pcntl \
#    && docker-php-ext-install pcntl \
#    && docker-php-source extract \
#    && pecl install xdebug-2.9.0 \
#    && docker-php-ext-enable xdebug \
#    && docker-php-source delete \
#    && apk del icu-dev \
#    && apk add gnu-libiconv --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted \
#    && apk del \
#        .build-deps \
#        gdbm \
#        gmp \
#        isl \
#        libatomic \
#        libbz2 \
#        libc-dev \
#        libffi \
#        libgomp \
#        libltdl \
#        libtool \
#        mpc1 \
#        musl-dev \
#        perl \
#        pkgconf \
#        pkgconfig \
#        python3 \
#        re2c \
#        readline \
#        sqlite-libs \
#    && rm -rf /tmp/* /var/cache/apk/* \
    && curl -LSs https://box-project.github.io/box2/installer.php | php \
    && mv box.phar /usr/local/bin/box \
    && chmod +x /usr/local/bin/box

#ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

#COPY config/memory.ini /usr/local/etc/php/conf.d/memory.ini
#COPY config/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY box.json /box.json

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
