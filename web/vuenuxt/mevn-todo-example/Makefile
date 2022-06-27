EXAMPLE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
HACK_DIR:=${EXAMPLE_DIR}/../../../makecommon

include ${EXAMPLE_DIR}/_docker-slim.env
export

.PHONY:
default: fat-build slim-build-compose slim-run slim-validate

.PHONY:
test-e2e:
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-compose
	COMPOSE_FILE_FAT=${EXAMPLE_DIR}/docker-compose.yaml ${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-compose


include ${HACK_DIR}/rules-docker-compose.mk
