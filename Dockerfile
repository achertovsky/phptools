FROM php:8.4-cli

RUN apt update && apt install xq

COPY --from=composer /usr/bin/composer /usr/bin/composer
