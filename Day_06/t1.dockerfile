ARG VER
FROM alpine:$VER
ENV ENV_DATA="day_06"
WORKDIR /app
RUN echo $ENV_DATA >> log.log
CMD ["sh", "-c", "echo $ENV_DATA >> log.log && ash"]
#CMD "echo $ENV_DATA >> log.log && ash"