FROM node:12.18.0-alpine AS builder
 
USER node
COPY --chown=node . /home/node/app
WORKDIR /home/node/app
RUN npm install


FROM nginx:1.18.0-alpine
COPY --from=builder /home/node/app /usr/share/nginx/html
