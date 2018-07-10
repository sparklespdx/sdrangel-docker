FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install libsqlite3-dev cmake g++ pkg-config libfftw3-dev libqt5multimedia5-plugins qtmultimedia5-dev qttools5-dev qttools5-dev-tools libqt5opengl5-dev qtbase5-dev libusb-1.0 librtlsdr-dev libboost-all-dev libasound2-dev pulseaudio libnanomsg-dev libopencv-dev libsqlite3-dev libxml2-dev bison flex ffmpeg libavcodec-dev libavformat-dev librtlsdr-dev

RUN apt-get -y install git

WORKDIR /home/work
RUN git clone https://github.com/myriadrf/LimeSuite.git
RUN git clone https://github.com/f4exb/sdrangel.git

WORKDIR /home/work/LimeSuite/builddir
RUN cmake ../ && make -j4 && make install

WORKDIR /home/work/sdrangel/build
RUN cmake ../ && make -j4 && make install

WORKDIR /home
RUN rm -rf work

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/local/lib64
CMD bash
