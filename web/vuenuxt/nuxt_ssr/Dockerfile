FROM node:lts
WORKDIR /app
COPY service/package.json /app/
RUN npm install
COPY service/ /app/
RUN npm run build
EXPOSE 3000
ENTRYPOINT [ "npm", "run", "start" ]