FROM php:8.3-cli-alpine

RUN apk add --no-cache --upgrade \
    wget \
    bash \
    git \
    xq

COPY --from=composer /usr/bin/composer /usr/bin/composer
