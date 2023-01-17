FROM php:8.2-cli-alpine

RUN apk add --no-cache --upgrade \
    wget \
    bash \
    git

RUN wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -O /usr/bin/phpcs
RUN wget https://github.com/phpstan/phpstan/releases/download/1.9.3/phpstan.phar -O /usr/bin/phpstan
RUN wget https://github.com/phpmd/phpmd/releases/download/2.13.0/phpmd.phar -O /usr/bin/phpmd

COPY all /usr/bin/all
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN chmod +x /usr/bin/phpcs /usr/bin/phpstan /usr/bin/phpmd /usr/bin/all

ENV COMPOSER_ALLOW_SUPERUSER=1

