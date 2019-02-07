FROM ubuntu:18.04 as builder
RUN apt-get update
RUN apt-get -y install build-essential git vim g++-8-arm-linux-gnueabihf cmake
RUN mkdir -p /wiringpi
WORKDIR /wiringpi
RUN git clone git://git.drogon.net/wiringPi
WORKDIR /wiringpi/wiringPi/wiringPi
COPY CMakeLists.wiringPi ./CMakeLists.txt
COPY Toolchain-rpi3.cmake ./Toolchain-rpi3.cmake
RUN cmake . -DCMAKE_TOOLCHAIN_FILE=Toolchain-rpi3.cmake
RUN make
RUN mkdir -p /testprj
WORKDIR /testprj
COPY CMakeLists.txt ./CMakeLists.txt
COPY Toolchain-rpi3.cmake ./Toolchain-rpi3.cmake
COPY hello.cpp /testprj/hello.cpp
RUN cmake . -DCMAKE_TOOLCHAIN_FILE=Toolchain-rpi3.cmake
RUN make