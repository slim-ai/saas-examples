## MEVN todo example

### What it does  
This example is a simple todo app built using MEVN stack and docker co pose.

### Tech Stack Info  
- Framework: MEVN
  - MongoDB
  - Express.js
  - Vuetify
  - Nuxt
- Language: Javascript
- Database: MongoDB
- NGINX reverse proxy
- docker compose

### Application Structure
Docker compose with 4 containers, a frontend webapp, a backend api, a reverse proxy and a mongoDB database.
Images can be found on DockerHub
- [Frontend](https://hub.docker.com/r/slimexamples/mevn-todo-example-app-client)
- [Backend](https://hub.docker.com/r/slimexamples/mevn-todo-example-app-api)
- [Reverse proxy](https://hub.docker.com/r/slimexamples/mevn-todo-example-app-reverse-proxy)
- [MongoDB](https://hub.docker.com/_/mongo)
Container port: 80 for HTTP traffic

### How to run and interact
You can build this image using `make fat-build` command which will output image named slimexamples/server-nuxtjs-static-spa or `docker build . -t {image name}`
To run this image you can execute `make fat-run` or `docker run -p 80:80 {image name}`

To interact with the image you can access it using your browser using http://127.0.0.1:80, if you are running this container on another device then you are trying to access it, you need to replace 127.0.0.1 with ip or web address of other device

This example shows how to optimize a Nuxt web application using serverside rendering technology with docker-slim, to use an example you can issue a `make fat-build` command to build the initial image. After that use `make slim-build` command to optimize the image.

Optimization is done using docker-slim with added parameter --include-path `docker-slim  build --include-path="/app/nuxt_modules" --target-compose-svc vue_client --compose-file /home/bigpod/movetosaasreal/saas-examples/web/vuenuxt/mevn-todo-example/docker-compose.yaml`
