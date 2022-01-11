FROM alpine:3.15

ARG assembly_version=0.0
ARG kubectl_version="1.20.14"

ENV KUBECTL_VERSION=$kubectl_version
ENV ASSEMBLY_VERSION=$assembly_version

RUN apk update \
    && apk upgrade \
    && apk add --quiet --no-cache \
        ca-certificates \
        curl \
        jq \
        tzdata \
        zlib

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN /usr/local/bin/kubectl version --client
