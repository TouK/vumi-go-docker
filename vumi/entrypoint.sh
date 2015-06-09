#!/bin/bash

set -e

if [ ! -f /tmp/setup.done ]; then
  psql -h localhost -U postgres -f /tmp/scripts/postgres.sql
  ./setup_env.sh
  ./setup_env/build/go_startup_env.sh
  touch /tmp/setup.done
fi

supervisord -c setup_env/build/go_supervisord.conf
