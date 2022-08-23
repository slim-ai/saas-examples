HACK_DIR ?= ${EXAMPLE_DIR}/../../../makecommon

include ${HACK_DIR}/common.mk

# TODO: Investigate why using an abs path here (seems) to break the `docker-slim build` command.
DOCKERFILE ?= Dockerfile


.PHONY:
fat-build: EXPECTED_IMAGE_NAME=slimexamples/${IMAGE_NAME}
fat-build: EXPECTED_IMAGE_SIZE=${EXPECTED_IMAGE_SIZE_FAT_${ARCH}}
fat-build:
	@echo "${GREEN}Building Fat Image${RESET}"
	docker build -t slimexamples/${IMAGE_NAME} ${EXAMPLE_DIR}
	$(assert_image_size)

.PHONY:
fat-push:
	@echo "${GREEN}Pushing Fat Image${RESET}"
	docker push slimexamples/${IMAGE_NAME}

.PHONY:
fat-run:
	@echo "${GREEN}Running Fat Image${RESET}"
	docker run --rm --detach --publish ${API_PORT}:${API_PORT} --name ${CONTAINER_NAME} slimexamples/${IMAGE_NAME}

.PHONY:
fat-run-seccomp:
	docker run --rm --detach --publish ${API_PORT}:${API_PORT} --security-opt seccomp=${EXAMPLE_DIR}/slimexamples-${IMAGE_NAME}-seccomp.json --name ${CONTAINER_NAME} slimexamples/${IMAGE_NAME}

.PHONY:
fat-run-interactive:
	@echo "${GREEN}Running Fat Image (interactive)${RESET}"
	docker run --rm -i --publish ${API_PORT}:${API_PORT} --name ${CONTAINER_NAME} slimexamples/${IMAGE_NAME}

.PHONY:
fat-run-interactive-shell:
	@echo "${GREEN}Running Fat Image (interactive shell)${RESET}"
	docker run --rm -it --security-opt seccomp=unconfined --publish ${API_PORT}:${API_PORT} --entrypoint ${SHELL_NAME} slimexamples/${IMAGE_NAME}

.PHONY:
fat-validate:
	$(query-running-service)

.PHONY:
fat-stop:
	$(stop-container)

.PHONY:
slim-build: EXPECTED_IMAGE_NAME=slimexamples/${IMAGE_NAME}.slim
slim-build: EXPECTED_IMAGE_SIZE=${EXPECTED_IMAGE_SIZE_SLIM_${ARCH}}
slim-build:
	@echo "${GREEN}Building Slim Image${RESET}"
	docker-slim ${DSLIM_EXTRA_FLAGS} build ${DSLIM_BUILD_EXTRA_FLAGS} slimexamples/${IMAGE_NAME}
	$(assert_image_size)

.PHONY:
slim-build-verbose:
	@echo "${GREEN}Building Slim Image (debug mode)${RESET}"
	docker-slim ${DSLIM_EXTRA_FLAGS} --debug build ${DSLIM_BUILD_EXTRA_FLAGS} --show-clogs slimexamples/${IMAGE_NAME}

.PHONY:
slim-build-dockerized:
	@echo "${GREEN}Building Slim Image (dockerized)${RESET}"
	docker run -it --rm --volume /var/run/docker.sock:/var/run/docker.sock dslim/docker-slim ${DSLIM_EXTRA_FLAGS} build ${DSLIM_BUILD_EXTRA_FLAGS} slimexamples/${IMAGE_NAME}

.PHONY:
slim-build-from-dockerfile:
	@echo "${GREEN}Building Slim Image Using Fat Dockerfile${RESET}"
	docker-slim ${DSLIM_EXTRA_FLAGS} build ${DSLIM_BUILD_EXTRA_FLAGS} --dockerfile ${DOCKERFILE} --tag-fat slimexamples/${IMAGE_NAME} ${EXAMPLE_DIR}

.PHONY:
slim-build-with-shell-and-exe:
	@echo "${GREEN}Building Slim Image with Extra Shell and Exe${RESET}"
	docker-slim ${DSLIM_EXTRA_FLAGS} build ${DSLIM_BUILD_EXTRA_FLAGS} --include-shell --include-exe ${EXE_NAME} slimexamples/${IMAGE_NAME}

.PHONY:
slim-build-and-keep-artifacts:
	@echo "${GREEN}Building Slim Image and Keeping Artifacts${RESET}"
	docker-slim ${DSLIM_EXTRA_FLAGS} --report ${IMAGE_NAME}.slim.report.json build ${DSLIM_BUILD_EXTRA_FLAGS} --copy-meta-artifacts ${EXAMPLE_DIR} slimexamples/${IMAGE_NAME}

.PHONY:
slim-push:
	@echo "${GREEN}Pushing Slim Image${RESET}"
	docker push slimexamples/${IMAGE_NAME}.slim

.PHONY:
slim-run:
	@echo "${GREEN}Running Slim Image${RESET}"
	docker run --rm --detach --publish ${API_PORT}:${API_PORT} --name ${CONTAINER_NAME} slimexamples/${IMAGE_NAME}.slim

.PHONY:
slim-run-seccomp:
	docker run --rm --detach --publish ${API_PORT}:${API_PORT} --security-opt seccomp=${EXAMPLE_DIR}/slimexamples-${IMAGE_NAME}-seccomp.json --name ${CONTAINER_NAME} slimexamples/${IMAGE_NAME}.slim

.PHONY:
slim-run-interactive:
	@echo "${GREEN}Running Slim Image (interactive)${RESET}"
	docker run --rm -i --publish ${API_PORT}:${API_PORT} --name ${CONTAINER_NAME} slimexamples/${IMAGE_NAME}.slim

.PHONY:
slim-validate:
	$(query-running-service)

.PHONY:
slim-stop:
	$(stop-container)

.PHONY:
exec:
	docker exec ${CONTAINER_NAME} ${EXE_NAME}

.PHONY:
exec-interactive:
	docker exec -i ${CONTAINER_NAME} ${EXE_NAME}

.PHONY:
exec-shell:
	docker exec ${CONTAINER_NAME} ${SHELL_NAME}

.PHONY:
exec-shell-interactive:
	docker exec -it ${CONTAINER_NAME} ${SHELL_NAME}

.PHONY:
debug-sidecar:
	docker run --rm -it --pid=container:${CONTAINER_NAME} --net=container:${CONTAINER_NAME} --cap-add sys_admin alpine sh

.PHONY:
test-slim-build-web: _TEST_MSG = Slimming Previously Built Image (Web Service Mode)
test-slim-build-web: _say-test fat-build fat-run fat-validate fat-stop slim-build slim-run slim-validate slim-stop clean

.PHONY:
test-slim-build-web-from-dockerfile: _TEST_MSG = Slimming Image Using Dockerfile (Web Service Mode)
test-slim-build-web-from-dockerfile: _say-test slim-build-from-dockerfile slim-run slim-validate slim-stop clean

.PHONY:
test-slim-build-web-with-shell-and-exe: _TEST_MSG = Slimming Image Keeping ${SHELL_NAME} and ${EXE_NAME} (Web Service Mode)
test-slim-build-web-with-shell-and-exe: _say-test fat-build fat-run fat-validate fat-stop slim-build-with-shell-and-exe slim-run slim-validate exec slim-stop clean

.PHONY:
test-slim-build-cli: fat-build fat-run-interactive slim-build slim-run-interactive clean

.PHONY:
test-slim-build-cli-from-dockerfile: slim-build-from-dockerfile slim-run-interactive clean

.PHONY:
clean:
	@echo "${GREEN}Cleaning things up...${RESET}"
	docker rmi slimexamples/${IMAGE_NAME} || true
	docker rmi slimexamples/${IMAGE_NAME}.slim || true

define stop-container
	@echo "${GREEN}Stopping Container ${CONTAINER_NAME}${RESET}"
	docker stop ${CONTAINER_NAME} || true
endef
