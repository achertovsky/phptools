# General
Container with tools required to develop php and check code you write. Contains:
- phpstan
- Phpmd
- phpcs
- phpcpd

# Usage
## build local
- `docker build -t phptools .`
- `docker run --rm -it -u ${UID} -v ${PWD}:/app -w /app phptools all`<br>
## use built image
- `docker pull achertovsky/phptools`<br>
## Commands applicable
- all (will launch all tools one by one)
- phpstan
- phpcs
- phpmd
- phpcpd

### all options applicable
- `-m` will check files that is modified/added according to `git`
- `-p test.php` will check provided file only

# Tools config
You can create your own
## config file for phpcs
https://github.com/squizlabs/PHP_CodeSniffer/wiki/
Advanced-Usage#using-a-default-configuration-file
## config file for phpmd
https://phpmd.org/documentation/creating-a-ruleset.html
## config file for phpstan
https://phpstan.org/config-reference#config-file
