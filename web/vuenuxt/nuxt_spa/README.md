## NUXT - Single Page Application

This example shows how to optimize a Nuxt web application using serverside rendering technology, to use an example you can issue a `make build_fat` command to build the initial image. After that use `make slim command` to optimize the image.

Optimization is done using docker-slim with added parameter --include-path-file `docker-slim build --http-probe=true --include-path-file=include-paths slimexamples/server-nuxtjs-static-spa`

### Slim SaaS

To analyze this image on Slim SaaS portal follow this link: [LINK]
Image can be found on DockerHub at this link: [LINK]
