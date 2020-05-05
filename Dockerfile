FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

#no need for volumes since in production no changes happen
FROM nginx 
# see docker hub docs for nginx to understand this step
COPY --from=builder /app/build /usr/share/nginx/html
