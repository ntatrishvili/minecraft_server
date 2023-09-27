# -* MakeFile -*-

mc_stdin = /run/minecraft.stdin

UID := $(shell id -u)
GID := $(shell id -g)

.PHONY: start
start:
	mkdir -p ./app/world
	docker run -d -it \
	 --name minecraft \
	 -v minecraft:/minecraft \
	 -v ./app/world:/minecraft/world:rw \
	 -p 25565:25565 \
	 -u $(UID):$(GID) \
	 ghcr.io/ntatrishvili/minecraft_server:main 

.PHONY: stop
stop:
	docker stop -s SIGTERM minecraft
	docker rm -f minecraft

.PHONY: restart
restart:
	docker restart -s SIGTERM minecraft

.PHONY: mc_alias
mc_alias:
	mc alias set ${S3_ALIAS_NAME} ${S3_ENDPOINT} ${S3_ACCESS_KEY} ${S3_SECRET_KEY}

.PHONY: backup
backup:
	make stop
# our backup scripts go here
	zip -r /tmp/world.zip ./app/world
	mc cp /tmp/world.zip ${S3_ALIAS_NAME}/${S3_BACKUP_BUCKET}

	make start

.PHONY: restore
restore:
	make stop

	cp -r ./app/world  /tmp/world.bak

	rm -rf ./app/world

	mc cp ${S3_ALIAS_NAME}/${S3_BACKUP_BUCKET}/world.zip /tmp/

	unzip /tmp/world.zip -d .
# our restore scripts go here
	make start

.PHONY: ansible
ansible:
	docker build -t ansible ${PWD}/iac/ansible
	docker run --rm -it \
		-v ${PWD}/iac/ansible:/ansible:ro \
		-v "$(dirname "$SSH_AUTH_SOCK")":"$(dirname "$SSH_AUTH_SOCK")"\
		-e SSH_AUTH_SOCK="$SSH_AUTH_SOCK" \
		--network host ansible
