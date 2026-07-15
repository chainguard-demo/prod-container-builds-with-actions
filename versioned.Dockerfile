# For testing versioning of images with private registry
FROM cgr.dev/chainguard.edu/go:v1.25.5@sha256:1be8ec014148fa86f633a00313fae1ec50209732879f97a13fa3521726a7ad5b AS builder

WORKDIR /work

COPY go.mod /work/
COPY cmd /work/cmd
COPY internal /work/internal

RUN CGO_ENABLED=0 go build -o hello ./cmd/server

FROM cgr.dev/chainguard/static:latest@sha256:60582b2ae6074f641094af0f370d4ab241aab271858a66223dcde7eee9f51638
COPY --from=builder /work/hello /hello

ENTRYPOINT ["/hello"]
