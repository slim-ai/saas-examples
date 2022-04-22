#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _docker-slim.env

if [ -z "$HTTP_PROBE" ]; then
	echo "HTTP_PROBE is not set, defaulting to true"
	HTTP_PROBE=true
fi

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock dslim/docker-slim build --include-app-nuxt-static-dir --http-probe=$HTTP_PROBE slimexamples/$IMAGE_NAME
popd
