ARG VERSION
FROM nginx:$VERSION

ARG VERSION
ENV VERSION=$VERSION
CMD ["nginx", "-g", "daemon off;"]