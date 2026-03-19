#The only thing can be before FROM/ Works in build time only
ARG APP_VERSION=20
ARG APP_NAME=node
FROM $APP_NAME:$APP_VERSION-alpine

RUN apk add --no-cache curl

#Here your glorious come 
LABEL author="yaroslavdomb" version="1.0" description="My first Node.js app"

ENV PORT=3030

ARG DIR=/opt/app
WORKDIR $DIR

COPY package*.json ./

RUN npm install

COPY server.js ./

# documentation purpose only. Actually not impact on docker
EXPOSE $PORT

# Works in runtime only, so can't use ARG
HEALTHCHECK \
  --interval=30s \
  --timeout=3s \
  --start-period=3s \
  --retries=3 \
  CMD curl -f http://localhost:$PORT || exit 1

# Create a volume inside the container 
VOLUME ["/opt/app/data"]

# By default it's a root user
USER node

#what to do with stop signal. There are some options
STOPSIGNAL SIGKILL

# can be more then one, but will work only the last one
# it can be substituted in runtime by arguments
CMD ["server.js"]

# can be more then one, but will work only the last one
# it can't be substituted in runtime by arguments
# BUT it can be substituted by flag --entrypoint
ENTRYPOINT ["node"]

# It's almost full Dockerfile - there is some tags that were not used here:
# ONBUILD - to run only when the Docker used from another Docker 
# SHELL  - to run on different shels