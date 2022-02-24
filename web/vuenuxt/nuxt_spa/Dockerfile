FROM node:lts as base
WORKDIR /app
COPY service/package.json /app/
RUN npm install
COPY service /app
RUN npm run generate

FROM nginx:latest as final
COPY --from=base /app/dist /usr/share/nginx/html
EXPOSE 80
