FROM golang:1.19-alpine as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN export GOPROXY=https://proxy.golang.com.cn,direct

RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api

RUN chmod +x /app/brokerApp

# build a tiny docker images
FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/brokerApp /app

CMD ["/app/brokerApp"]