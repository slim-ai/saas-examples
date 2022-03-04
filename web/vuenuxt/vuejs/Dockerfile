FROM node:lts-bullseye as build-stage
WORKDIR /app
COPY vuejs/package.json /app
RUN npm install
COPY /vuejs /app
RUN npm run build

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80