FROM node:20-alpine AS dependencies
LABEL author="yaroslavdomb" purpose="create multy-build docker"
WORKDIR /app
COPY package*.json .
RUN npm install

FROM dependencies AS testing
COPY . .
RUN npm test

FROM node:20-alpine AS  AS prod
WORKDIR /app
COPY --from=
CMD ["node","server.js"]