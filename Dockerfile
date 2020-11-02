# Dockerfile
FROM golang:1.15-buster

ENV APP_USER root
ENV GO111MODULE=on
USER $APP_USER

# Build and install dependencies.
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y gperf ccache readline-common cmake protobuf-compiler libssl-dev && \
    cd /tmp && \
    git clone https://github.com/tdlib/td.git && \
    cd td/ && \
    mkdir build && \
    cd build/ && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . && \
    make install
