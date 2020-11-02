# Dockerfile
FROM golang:1.15-buster

ENV APP_USER root
ENV GO111MODULE=on
USER $APP_USER

# Build and install dependencies.
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y gperf ccache readline-common cmake protobuf-compiler libssl-dev wget tar && \
    cd /tmp && \
    wget https://github.com/tdlib/td/archive/v1.6.0.tar.gz && \
    tar -zxvf v1.6.0.tar.gz && \
    cd td-1.6.0/ && \
    mkdir build && \
    cd build/ && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . && \
    make install
