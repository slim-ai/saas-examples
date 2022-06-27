FROM node:12.16.0-buster

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run buildx

EXPOSE 3000

CMD ["./node_modules/.bin/nuxt", "start", "--hostname", "0.0.0.0"]
