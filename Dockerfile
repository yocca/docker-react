FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY --chown=node:node ./ ./
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html