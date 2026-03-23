ARG BASE_TAG=18
ARG BASE_APP=postgres
FROM $BASE_APP:$BASE_TAG
ARG BASE_TAG=18
ARG BASE_APP=postgres
WORKDIR /app
RUN echo "start $BASE_APP:$BASE_TAG" > log.log 
EXPOSE 5432
CMD ["postgres"]