#Build Phase
#Purpose of this to build application
FROM node:alpine as builder
WORKDIR '/app'
#to copy all dependencies into container
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#Run phase

FROM nginx
COPY --from=builder  /app/build  /usr/share/nginx/html
