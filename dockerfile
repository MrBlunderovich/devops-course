FROM node:22-alpine
WORKDIR /app
COPY nodejs-server/ .
RUN npm ci
RUN npm run build
CMD ["node", "./dist/index.js"]
EXPOSE 8080