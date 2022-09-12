# build a tiny docker images
FROM alpine:latest
RUN mkdir /app
COPY authApp /app
CMD ["/app/authApp"]