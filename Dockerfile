FROM php:8.3-cli-alpine

RUN apk add --no-cache --upgrade \
    wget \
    bash \
    git \
    yq

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -O /usr/bin/phpcs
RUN wget https://github.com/phpstan/phpstan/releases/download/1.9.3/phpstan.phar -O /usr/bin/phpstan
RUN wget https://github.com/phpmd/phpmd/releases/download/2.14.1/phpmd.phar -O /usr/bin/phpmd
RUN wget https://phar.phpunit.de/phpcpd.phar -O /usr/bin/phpcpd
RUN wget https://github.com/povils/phpmnd/archive/refs/tags/v3.4.0.zip -O phpmnd.zip &&\
    unzip phpmnd.zip -d phpmnd &&\
    cd phpmnd/* &&\
    php -dphar.readonly=0 bin/createPhar &&\
    mv phpmnd.phar /usr/bin/phpmnd

RUN rm /usr/bin/composer

COPY all /usr/bin/all
COPY suggest-config /usr/bin/suggest-config
COPY phpcpdrun /usr/bin/phpcpdrun
COPY config /var/config
COPY phpmndrun /usr/bin/phpmndrun

RUN chmod +x \
    /usr/bin/phpcs \
    /usr/bin/phpstan \
    /usr/bin/phpmd \
    /usr/bin/phpcpd \
    /usr/bin/all \
    /usr/bin/suggest-config \
    /usr/bin/phpcpdrun \
    /usr/bin/phpmnd \
    /usr/bin/phpmndrun

RUN git config --global --add safe.directory /app
