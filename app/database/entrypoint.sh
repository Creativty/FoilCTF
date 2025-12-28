#!/usr/bin/env bash
set -xe

PGDATA="$HOME/data"
PGLOGS="$HOME/logs"

function migrations_apply {
	pg_ctl -D "$PGDATA" -l "$PGLOGS" start

	echo "Starting with migration '$(container-migrations-manage current)'"
	container-migrations-manage apply

	pg_ctl -D "$PGDATA" stop
}

if [[ ! -d "$PGDATA" ]]; then
	initdb "$PGDATA";
fi

migrations_apply
exec postgres -D "$PGDATA"

