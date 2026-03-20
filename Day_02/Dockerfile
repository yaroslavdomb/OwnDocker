ARG VERSION=20
ARG TAG=alpine
FROM node:$VERSION-$TAG AS dependencies
LABEL author="yaroslavdomb" purpose="create multy-build docker"
WORKDIR /app
COPY package*.json .
RUN npm install

FROM dependencies AS testing
COPY . .
RUN npm test
# silent arg will skip name of script and command itself
# > day_02@1.0.0 test
# > echo My first test
CMD ["npm", "test", "--silent"]

ARG VERSION=20
ARG TAG=alpine
FROM node:$VERSION-$TAG AS prod
WORKDIR /opt/app
COPY --from=dependencies /app/node_modules ./node_modules
COPY --from=dependencies /app/package*.json .
COPY --from=testing /app/server.js .
CMD ["node","server.js"]