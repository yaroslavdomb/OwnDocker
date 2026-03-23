ARG APP=ubuntu
ARG TAG
FROM $APP:$TAG
ENV APP_ENV="inner env"
WORKDIR /app
RUN echo $APP_ENV >> log.log
CMD ["bash", "-c", "echo $APP_ENV >> log.log && bash"]