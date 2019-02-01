FROM ubuntu:18.04 as builder
RUN apt-get update
RUN apt-get -y install build-essential cmake
RUN mkdir -p /testprj
WORKDIR /testprj
COPY CMakeLists.txt /testprj/CMakeLists.txt
COPY hello.cpp /testprj/hello.cpp
RUN cmake .
RUN make