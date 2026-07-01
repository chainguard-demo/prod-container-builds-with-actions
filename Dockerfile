# syntax=docker/dockerfile:1@sha256:87999aa3d42bdc6bea60565083ee17e86d1f3339802f543c0d03998580f9cb89
FROM cgr.dev/chainguard/go:latest-dev@sha256:5de7adc81a8ed20e8648ba98e26db994bba99e73a25ea782ec14e515a037353d AS builder

WORKDIR /work

COPY go.mod /work/
COPY cmd /work/cmd
COPY internal /work/internal

RUN CGO_ENABLED=0 go build -o hello ./cmd/server

FROM cgr.dev/chainguard/static:latest@sha256:77d8b8925dc27970ec2f48243f44c7a260d52c49cd778288e4ee97566e0cb75b
COPY --from=builder /work/hello /hello

ENTRYPOINT ["/hello"]
