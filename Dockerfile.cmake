FROM ubuntu:18.04 as builder
RUN apt-get update
RUN apt-get -y install build-essential g++-8-arm-linux-gnueabihf cmake
RUN mkdir -p /testprj
WORKDIR /testprj
COPY CMakeLists.txt /testprj/CMakeLists.txt
COPY Toolchain-rpi3.cmake /testprj/Toolchain-rpi3.cmake
COPY hello.cpp /testprj/hello.cpp
RUN cmake . -DCMAKE_TOOLCHAIN_FILE=Toolchain-rpi3.cmake
RUN make