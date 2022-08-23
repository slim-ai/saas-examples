## AWS lambda example with Express API

### What it does  
This example is a Lambda container based Express API. 

### Tech Stack Info  
- AWS Lambda Container
- Framework: ExpressJS
- Language: Javascript

### Application Structure
Single AWS lambda JS container.

Container port: 8080 for HTTP traffic

### How to run and interact
You can build this image using `make fat-build` command which will output image named slimexamples/server-nuxtjs-static-spa or `docker build . -t {image name}`
To run this image you can execute `make fat-run` or `docker run -p 9000:8080 {image name}`

Easiest way to interact with the image is using test.sh script found in _docker-slim directory or executing `make test` as lambda containers require specifically crafted payloads to run endpoints.  

This example shows how to optimize a AWS Lambda container image with docker-slim, to use an example you can issue a `make fat-build` command to build the initial image. After that use `make slim-build` command to optimize the image.

Optimization is done using docker-slim with added parameter --include-path `docker-slim build --http-probe-cmd-file custom-probe.json --include-path-file includefile ${IMAGE_NAME}:${GIT_REVISION}`
