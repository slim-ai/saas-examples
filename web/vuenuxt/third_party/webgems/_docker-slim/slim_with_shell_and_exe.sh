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

docker-slim build --http-probe=$HTTP_PROBE --include-shell --include-app-nuxt-build-dir --include-app-nuxt-static-dir --include-app-nuxt-nodemodules-dir --include-exe uname slimexamples/$IMAGE_NAME
popd
