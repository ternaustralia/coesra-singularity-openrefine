FROM openjdk:8-jre-alpine

# Instance url of the latest version of openrefine
ENV OR_URL https://github.com/OpenRefine/OpenRefine/releases/download/3.4.1/openrefine-linux-3.4.1.tar.gz

WORKDIR /app

# Download Openrefine
RUN set -xe \
    && apk add --no-cache bash curl grep tar \
    && curl -sSL ${OR_URL} | tar xz --strip 1

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data"]
