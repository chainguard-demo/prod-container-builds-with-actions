# syntax=docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6
FROM cgr.dev/chainguard/go:latest-dev@sha256:302e8195e2e9a422ec1e86e7bbdeed7990956c481a204b971da9a6dc77fdabff AS builder

WORKDIR /work

COPY go.mod /work/
COPY cmd /work/cmd
COPY internal /work/internal

RUN CGO_ENABLED=0 go build -o hello ./cmd/server

FROM cgr.dev/chainguard/static:latest@sha256:77d8b8925dc27970ec2f48243f44c7a260d52c49cd778288e4ee97566e0cb75b
COPY --from=builder /work/hello /hello

ENTRYPOINT ["/hello"]
