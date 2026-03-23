ARG APP1 
ARG TAG1
FROM $APP1:$TAG1 AS db
ARG TAG1
ENV APP_VERSION=$TAG1
WORKDIR /app
RUN echo $APP_VERSION >> log.txt 
CMD ["postgres"]

ARG APP2 
ARG TAG2
FROM $APP2:$TAG2 AS ui
WORKDIR /app
RUN echo $APP_VERSION >> log.txt 
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]