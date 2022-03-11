# About this repository
Slim.AI Container Optimization Demo - Nuxt

This demo app and container image is used to demo the Container Optimization feature at [Slim.AI](https://www.slim.ai). 

For more information, please see our [related blog post](https://community.slim.ai/t/slimming-a-containerized-nuxtjs-app-with-slim-ai/84) on the project. 

## Instructions 
To run the application or container locally, clone the git repo to a local directory. 

### Running the app
```
$ cd /app
$ npm install
$ npm run dev 
```

### Building and running the container
From the project root directory: 

```
$ docker build -t slim-nuxt-demo . 
...building..
$ docker run --rm -p 3000:3000 slim-nuxt-demo
```

You can also pull a copy of the container from Docker Hub: 

```
$ docker pull slimexamples/slim-nuxt-demo
```

The app will be available at `localhost:3000` or `0.0.0.0:3000`. 

To learn more or connect with us, [join our Discord](https://discord.gg/uBttmfyYNB). 