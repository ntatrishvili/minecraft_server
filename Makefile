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
	tail -f -n=10 /minecraft/app/logs/latest.log

.PHONY: backup
backup:
	make stop
# our backup scripts go here
	make restart

.PHONY: restore
restore:
	make stop
# our restore scripts go here
	make restart
