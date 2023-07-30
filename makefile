# -* MakeFile -*-

mc_stdin = /run/minecraft.stdin
_logs = /app/logs/latest.log
_minecraft = minecraft

all: stop restart log
.PHONY: all

stop: $(mc_stdin)
	echo "stop" > $(mc_stdin)

# should we also delete the world? 
restart:
	systemctl restart $(minecraft)

log:
	cat $(_logs)
