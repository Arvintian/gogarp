FROM golang:1.22.11 AS builder

COPY . /build-dir

WORKDIR /build-dir

RUN GOPROXY=https://goproxy.cn,direct CGO_ENABLED=0 GOOS=linux go build -o gogarp -ldflags '-s -w' ./main.go

FROM alpine:3.10

COPY --from=builder /build-dir/gogarp /usr/local/bin/gogarp