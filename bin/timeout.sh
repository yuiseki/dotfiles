#! /bin/bash
bash -c "sleep 1; test -e /proc/$$ && kill -KILL $$" >/dev/null &
disown $!
exec "$@"
