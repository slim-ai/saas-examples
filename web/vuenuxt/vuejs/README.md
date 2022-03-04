## VUEJS

### What it does  
This example is a VueJS application

### Tech Stack Info  
- Framework: Vuejs
- Language: Javascript
  - NodeJS 16 LTS
- Web server: Nginx
  - Debian Bullseye 11 based container

### Application Structure
Single container with no dependancies on other containers.
Image can be found on DockerHub at this link: [Click Here]()
Container port: 1300 for HTTP traffic

### How to run and interact
You can build this image using `make build_fat` command which will output image named slimexamples/server-nuxtjs-static-spa or `docker build . -t {iamge name}`
To run this image you can execute `make run_fat` or `docker run -p 80:80 {image name}`

To interact with the image you can access it using your browser using http://127.0.0.1:80, if you are running this container on another device then you are trying to access it, you need to replace 127.0.0.1 with ip or web address of other device

This example shows how to optimize a Nuxt web application using serverside rendering technology with docker-slim, to use an example you can issue a `make build_fat` command to build the initial image. After that use `make slim` command to optimize the image.

Optimization is done using docker-slim with added parameter --include-path-file `docker-slim build --http-probe=true --include-path-file=include-paths slimexamples/server-vuejs`

### Slim SaaS

### How to explore image
To analyze this image on Slim SaaS portal follow this link: [Click here]() (login required)
