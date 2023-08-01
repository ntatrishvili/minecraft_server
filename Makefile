# -* MakeFile -*-

mc_stdin = /run/minecraft.stdin
_logs = /app/logs/latest.log
_minecraft = minecraft


.PHONY: start
start:
	systemctl daemon-reload
	systemctl enable minecraft
	systemctl start --no-block minecraft

.PHONY: stop
stop: $(mc_stdin)
	echo "stop" > $(mc_stdin)

.PHONY: restart
restart:
	systemctl restart $(minecraft)

.PHONY: log
log:
	cat $(_logs)
