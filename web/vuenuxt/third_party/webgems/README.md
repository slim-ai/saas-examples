## Webgems

Original source of this example is from github repository [lostdesign/webgems](https://github.com/lostdesign/webgems).
This example is Nuxt.js Serverside rendering application listening on port 3000.
In this example we use minification using flag `--include-app-nuxt-static-dir` which includes files required by nuxt.js to work. During minification many files are removed which results in difference of 298,4 MB between big and unoptimized image. 

### How to run and interact
You can build this image using `make build_fat` command which will output image named slimexamples/server-thirdparty-webgems or docker build . -t {image name}
To run this unoptimized image you can execute `make run_fat` or `docker run -p 3000:3000 {image name}`.

To interact you can access it using your browser using http://127.0.0.1:3000, if you are running this contianer on another device then you are trying to access it, you need to replace 127.0.0.1 with ip of web address of other device.

This example shows how to optimize a complex Nuxt web applicaiton with dokcer-slim, to optimize this example issue command `make slim` command.
 
