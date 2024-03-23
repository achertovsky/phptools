# General
Container with tools required to develop php and check code you write. Contains:
- phpstan
- phpmd
- phpcs
- phpcpd
- phpmnd

# Usage
## build local
- `docker build -t phptools .`
- (optional) `docker run --rm -it -u ${UID} -v ${PWD}:/app -w /app phptools suggest-config`<br>
- `docker run -m100m --rm -it -u ${UID} -v ${PWD}:/app -w /app phptools all`<br>
## use built image
- `docker pull achertovsky/phptools`<br>
- (optional) `docker run --rm -it -u ${UID} -v ${PWD}:/app -w /app achertovsky/phptools suggest-config`<br>
- `docker run -m100m --rm -it -u ${UID} -v ${PWD}:/app -w /app achertovsky/phptools all`<br>
## Commands applicable
- all (will launch all tools one by one)
- suggest-config (will create example configs for all tools)
- phpcpdrun (will launch phpcpd using config)
- phpstan
- phpcs
- phpmd
- phpcpd
- phpmndrun (will launch phpmnd using config)
- phpmnd
- phpdrc
## Notes
### phpstan-related
phpstan launched with `--memory_limit=-1` flag due to widely-known issues so to not it leat all memory of your machine use `-m` param of docker to limit container memory

phpstan is finetuned by `phptools` and `phar`'ed from source code with symfony, phpunit and doctrine extension

### `all` options applicable
- `-m` will check files that is modified/added according to `git`
- `-p test.php` will check provided file only

# Tools config
You can create your own
## config file for phpcs
https://github.com/squizlabs/PHP_CodeSniffer/wiki/Advanced-Usage#using-a-default-configuration-file
## config file for phpmd
https://phpmd.org/documentation/creating-a-ruleset.html
## config file for phpstan
https://phpstan.org/config-reference#config-file
## config file for phpcpd
check `phpcpd.xml` file in `config` directory
## config file for phpmnd
check `phpmnd.xml` file in `config` directory
## config file for phpdrc
https://github.com/achertovsky/phpdrc/blob/master/readme.md#config
