ARG BASE_TAG=3.11                   # ARGS declared before FROM are usable ONLY in FROM line 
FROM python:${BASE_TAG} AS builder
ARG APP_VERSION=1.0
ARG BUILD_ENV=production
ARG SECRET_KEY                      # If there is no value it means the value HAVE to be given on build stage
ENV APP_VERSION=${APP_VERSION}      # if we need to use ARGS values in container - need to copy them
ENV BUILD_ENV=${BUILD_ENV}
ENV APP_HOME=/app
RUN echo "Building ${APP_VERSION} for ${BUILD_ENV}"
WORKDIR ${APP_HOME}
COPY . .
RUN pip install -r requirements.txt


FROM python:${BASE_TAG}-slim AS runtime
ARG APP_VERSION                       # ARGS have to be re-declared cause of new FROM used
ARG BUILD_ENV=production
ENV APP_VERSION=${APP_VERSION}        # Each ENV is allocated for his FROM only, so line 6 is not visible here 
ENV BUILD_ENV=${BUILD_ENV}
ENV APP_HOME=/app
ENV PORT=8000
WORKDIR ${APP_HOME}
COPY --from=builder ${APP_HOME} .
CMD ["sh", "-c", "python app.py --port ${PORT}"]