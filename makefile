# -* MakeFile -*-

mc_stdin = /run/minecraft.stdin
_logs = /app/logs/latest.log
_minecraft = minecraft

all: stop restart log clean
.PHONY: all

stop: $(mc_stdin)
	echo "stop" > $(mc_stdin)

# should we also delete the world? 
restart:
	systemctl restart $(minecraft)

log:
	cat $(_logs)

clean:
	rm $(mc_stdin) $(_logs)
