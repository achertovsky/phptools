FROM php:8.3-cli-alpine as phpstan

RUN apk add --no-cache --upgrade \
    wget \
    bash \
    make \
    git \
    patch \
    yq

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN git clone -b 1.10.55 --single-branch https://github.com/phpstan/phpstan-src.git /phpstan-src
WORKDIR /phpstan-src
RUN cd /phpstan-src  \
    && composer install \
    && composer require phpstan/phpstan-doctrine \
    && composer require phpstan/phpstan-symfony \
    && composer require phpstan/phpstan-phpunit \
    && cd compiler \
    && composer install \
    && php bin/prepare \
    && cd build \
    && ls -la && chmod +x box.phar \
    && ./box.phar compile --no-parallel

FROM php:8.3-cli-alpine

RUN apk add --no-cache --upgrade \
    wget \
    bash \
    git \
    yq

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN wget https://github.com/PHPCSStandards/PHP_CodeSniffer/releases/download/3.10.1/phpcs.phar -O /usr/bin/phpcs
COPY --from=phpstan /phpstan-src/tmp/phpstan.phar /usr/bin/phpstan
RUN wget https://github.com/phpmd/phpmd/releases/download/2.15.0/phpmd.phar -O /usr/bin/phpmd
RUN wget https://phar.phpunit.de/phpcpd.phar -O /usr/bin/phpcpd
RUN wget https://github.com/povils/phpmnd/archive/refs/heads/master.zip -O phpmnd.zip &&\
    unzip phpmnd.zip -d phpmnd &&\
    cd phpmnd/* &&\
    php -dphar.readonly=0 bin/createPhar &&\
    mv phpmnd.phar /usr/bin/phpmnd
RUN wget https://github.com/achertovsky/phpdrc/releases/download/0.3.0/phpdrc.phar -O /usr/bin/phpdrc

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
    /usr/bin/phpmndrun \
    /usr/bin/phpdrc

RUN git config --global --add safe.directory /app
