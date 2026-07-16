IMAGE=achertovsky/php-infrastructure:dev_cli
USER_ID=$(shell id -u)
GROUP_ID=$(shell id -g)
WORKDIR=/app
VOLUME=${PWD}:${WORKDIR}
DOCKER_RUN=docker run --rm -it -u $(USER_ID):$(GROUP_ID) -w $(WORKDIR) -v $(VOLUME) $(IMAGE)

.PHONY: build install test coverage xdebug

build:
	$(DOCKER_RUN) composer i
	$(DOCKER_RUN) cp config/* .
	$(DOCKER_RUN) mv infection.json5.dist infection.json5
	$(DOCKER_RUN) rm phptools.php && cp phptools.php.dist phptools.php

bash:
	$(DOCKER_RUN) /bin/bash

test:
	$(DOCKER_RUN) php phptools

test-debug:
	docker run --rm -it --add-host=host.docker.internal:host-gateway -e XDEBUG_MODE=debug -u $(USER_ID):$(GROUP_ID) -w $(WORKDIR) -v $(VOLUME) $(IMAGE) php phptools
