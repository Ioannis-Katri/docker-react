#Building Phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY ./ ./

RUN npm run build

#Second Phase

FROM nginx
# it want to copy over so mething form the previous phase
COPY --from=builder /app/build /usr/share/nginx/html


