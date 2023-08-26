FROM php:8.0-cli-alpine

RUN apk add --no-cache --upgrade \
    wget \
    bash \
    git \
    yq

RUN wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -O /usr/bin/phpcs
RUN wget https://github.com/phpstan/phpstan/releases/download/1.9.3/phpstan.phar -O /usr/bin/phpstan
RUN wget https://github.com/phpmd/phpmd/releases/download/2.13.0/phpmd.phar -O /usr/bin/phpmd
RUN wget https://phar.phpunit.de/phpcpd.phar -O /usr/bin/phpcpd

COPY all /usr/bin/all
COPY suggest-config /usr/bin/suggest-config
COPY phpcpdrun /usr/bin/phpcpdrun
COPY config /var/config

RUN chmod +x \
    /usr/bin/phpcs \
    /usr/bin/phpstan \
    /usr/bin/phpmd \
    /usr/bin/phpcpd \
    /usr/bin/all \
    /usr/bin/suggest-config \
    /usr/bin/phpcpdrun

RUN git config --global --add safe.directory /app

