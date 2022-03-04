FROM node:14

LABEL "com.example.vendor"="Slim.AI Inc."
LABEL version="1.0"
LABEL description="This demo container is used for on-platform minification on portal.slim.dev."

COPY app/package.json /app/package.json
WORKDIR /app 
RUN npm install

COPY app /app
RUN npm run build 

USER node
EXPOSE 3000 
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

ENTRYPOINT ["npm","start"]