# syntax=docker/dockerfile:1@sha256:b6afd42430b15f2d2a4c5a02b919e98a525b785b1aaff16747d2f623364e39b6
FROM cgr.dev/chainguard/go:latest-dev@sha256:b656f0da4d7fc528746186fc6e6251a4da0d65f9d481b3ab16f663d259c177bd AS builder

WORKDIR /work

COPY go.mod /work/
COPY cmd /work/cmd
COPY internal /work/internal

RUN CGO_ENABLED=0 go build -o hello ./cmd/server

FROM cgr.dev/chainguard/static:latest@sha256:7bdd9720cefba78e8133c4d03eaaf3f18a25d147d2c8803cc830061e46b6b474
COPY --from=builder /work/hello /hello

ENTRYPOINT ["/hello"]
