FROM ubuntu:18.04 as builder
RUN apt-get update
RUN apt-get -y install python3 vim git g++-8-arm-linux-gnueabihf cmake
COPY vimrc /root/.vimrc

RUN mkdir -p /wiringpi
WORKDIR /wiringpi
RUN git clone git://git.drogon.net/wiringPi
WORKDIR /wiringpi/wiringPi/wiringPi
COPY CMakeLists.wiringPi ./CMakeLists.txt
COPY Toolchain-rpi3.cmake ./Toolchain-rpi3.cmake
RUN cmake . -DCMAKE_TOOLCHAIN_FILE=Toolchain-rpi3.cmake
RUN make

RUN mkdir -p /HaveFun
RUN mkdir -p /HaveBuild
ENTRYPOINT ["/HaveFun/build"]