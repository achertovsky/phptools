# General
Toolset which usually required to develop php and check code you write. Contains:
- phpstan
- phpmd
- phpcs
- phpcpd
- phpmnd

# Usage
## Dependencies
Make sure your env has app called `yq`, install it via package manager
## Install and first run
```
composer require --dev achertovsky/phptools
vendor/bin/suggest-config
vendor/bin/phptools
```
## Notes
### phpstan-related
phpstan launched with `--memory_limit=-1` flag due to widely-known issues so to not it leat all memory of your machine use `-m` param of docker to limit container memory

### `phptools` options applicable
- `-m` will check files that is modified/added according to `git`
- `-p test.php` will check provided file only

### phpcpd
phar placed in lib code is [box](https://github.com/box-project/box)'ed from [latest phpcpd main branch code](https://github.com/sebastianbergmann/phpcpd) and do not belong to lib author

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

# Development
```
docker build -t phptools .
docker run --rm -it -u${UID} -v${PWD}:/var/www/html -w/var/www/html phptools composer i
cp config/* .
docker run --rm -it -u${UID} -v${PWD}:/var/www/html -w/var/www/html phptools php phptools
```
