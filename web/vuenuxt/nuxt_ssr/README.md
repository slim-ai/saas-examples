## NUXT - Serverside Rendering

This example shows how to optimize a Nuxt web application using serverside rendering technology, to use an example you can issue a make build command to build the initial image. After that use make slim command to optimize the image.

Optimization is using docker-slim with added paramaters --include-path-file abd --http-probe. `docker-slim build --http-probe=true --include-path-file=include-paths slimexamples/dslim-examples-server`

Scripts used by makefile can be found in _docker-slim and environment variables used can be found in _docker-slim.env

Using portal-profile.sbp file you can import profile used for this example into Slim Portal to get preset that is equivalent to what you can use with docker-slim using above command.