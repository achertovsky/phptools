# General
Container with tools required to develop php and check code you write. Contains:
- Phpstan
- Phpmd
- phpcs
- composer

# Usage
## build local
- `docker build -t phptools .`
- `docker run --rm -it -u ${UID} -v ${PWD}:/app -w /app phptools all`<br>
## use built image
- `docker pull achertovsky/phptools:8.2`<br>
## Commands applicable
- all (will launch all tools one by one)
- phpstan
- phpcs
- phpmd
- composer

# Tools config
You can create your own
## config file for phpcs
https://github.com/squizlabs/PHP_CodeSniffer/wiki/
Advanced-Usage#using-a-default-configuration-file
## config file for phpmd
https://phpmd.org/documentation/creating-a-ruleset.html
## config file for phpstan
https://phpstan.org/config-reference#config-file
