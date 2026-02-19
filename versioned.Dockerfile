# For testing versioning of images with private registry
FROM cgr.dev/chainguard.edu/go:v1.25.5@sha256:08cb10ef823daefaa7cfb4c73a33309c5ea924c6b4aabef758c50a1f67c43668 AS builder

WORKDIR /work

COPY go.mod /work/
COPY cmd /work/cmd
COPY internal /work/internal

RUN CGO_ENABLED=0 go build -o hello ./cmd/server

FROM cgr.dev/chainguard/static:latest@sha256:11ec91f0372630a2ca3764cea6325bebb0189a514084463cbb3724e5bb350d14
COPY --from=builder /work/hello /hello

ENTRYPOINT ["/hello"]
