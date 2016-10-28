#!/bin/bash
set -e

if [ "$BUCKET_NAME" == "" ]
then
  echo You must provide an environment variable BUCKET_NAME. Exiting now!
  exit 1
fi

if [ "$1" = 'supervisord' ]
then
    exec "$@"
fi

exec "$@"
