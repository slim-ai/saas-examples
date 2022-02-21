## NUXT - Single Page Application

This example shows how to optimize a Nuxt web application using serverside rendering technology, to use an example you can issue a `make build_fat` command to build the initial image. After that use `make slim` command to optimize the image.

Optimization is done using docker-slim with added parameter --include-path-file `docker-slim build --http-probe=true --include-path-file=include-paths slimexamples/server-nuxtjs-static-spa`

### Slim SaaS

To analyze this image on Slim SaaS portal follow this link: [HERE](https://hub.docker.com/r/slimexamples/server-nuxtjs-serverside)  
Image can be found on DockerHub at this link: [HERE](https://portal.slim.dev/home/xray/dockerhub%3A%2F%2Fdockerhub.public%2Fslimexamples%2Fserver-nuxtjs-serverside%3Alatest%40sha256%3A7c1c1912e1b8948f7c690d9e06ace0814226ee1dce2445bf60026e1966d74fdf)
