#specify base image
FROM node:18-alpine as builder

WORKDIR /app
# install some dependancies
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# default command

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html