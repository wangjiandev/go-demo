# build a tiny docker images
FROM alpine:latest
RUN mkdir /app
COPY brokerApp /app
CMD ["/app/brokerApp"]