# -* MakeFile -*-

mc_stdin = /run/minecraft.stdin


.PHONY: start
start:
	systemctl daemon-reload
	systemctl enable minecraft
	systemctl start --no-block minecraft

.PHONY: stop
stop:
	echo "stop" > $(mc_stdin)

.PHONY: restart
restart:
	systemctl restart minecraft

.PHONY: log
log:
	tail -f -n 10 /minecraft/app/logs/latest.log

.PHONY: mc_alias
mc_alias:
	mc alias set ${S3_ALIAS_NAME} ${S3_ENDPOINT} ${S3_ACCESS_KEY} ${S3_SECRET_KEY}

.PHONY: backup
backup:
	make stop
# our backup scripts go here
	zip -r /tmp/world.zip ./app/world
	mc cp /tmp/world.zip ${S3_ALIAS_NAME}/${S3_BACKUP_BUCKET}

	make restart

.PHONY: restore
restore:
	make stop

	cp -r ./app/world  /tmp/world.bak

	rm -rf ./app/world

	mc cp ${S3_ALIAS_NAME}/${S3_BACKUP_BUCKET}/world.zip /tmp/

	unzip /tmp/world.zip -d .
# our restore scripts go here
	make restart
