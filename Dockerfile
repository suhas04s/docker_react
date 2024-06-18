FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
copy . . 
RUN npm run build

FROM nginx
# this is used to copy the build files from above node to start niginx
COPY --from=builder /app/build /usr/share/nginx/html