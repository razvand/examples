FROM golang:1.21.4-alpine3.18 AS build

ARG OTELCONTRIBCOL_VERSION=0.95.0

WORKDIR /otelcontribcol

# Dependencies
RUN set -xe; \
    apk --no-cache add \
      bash \
      ca-certificates \
      gcc \
      git \
      make \
      musl-dev \
    ; \
    git clone --branch v${OTELCONTRIBCOL_VERSION} --depth=1 https://github.com/open-telemetry/opentelemetry-collector-contrib.git /otelcontribcol;

WORKDIR /otelcontribcol

# Build
RUN set -xe; \
    make generate; \
    cd ./cmd/otelcontribcol; \
    CGO_ENABLED=1 \
    go build -v \
      -buildmode=pie \
      -ldflags "-linkmode external -extldflags '-static-pie'" \
      -o /usr/bin/otelcontribcol \
      .

FROM scratch

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /usr/bin/otelcontribcol /usr/bin/otelcontribcol
COPY ./rootfs/ /
