FROM ubuntu:18.04

MAINTAINER ezio <ezio_zhang@outlook.com>

ENV DEBIAN_FRONTEND=noninteractive 
#install dependences:
RUN sed -i.bak s/archive.ubuntu.com/mirror.tuna.tsinghua.edu.cn/g /etc/apt/sources.list && \
  dpkg --add-architecture i386 && apt-get update && apt-get install -y \
  build-essential \
  sudo \
  iproute2 \
  gawk \
  net-tools \
  expect \
  libncurses5-dev \
  tftpd \
  libssl-dev \
  gnupg \
  wget \
  socat \
  gcc-multilib \
  screen \
  xterm \
  gzip \
  unzip \
  cpio \
  chrpath \
  autoconf \
  lsb-release \
  locales \
  xutils-dev \
  mtd-utils \
  tmux \
  net-tools \
  git \
  bc

RUN locale-gen en_US.UTF-8 && update-locale
RUN cd /opt && \
    wget ftp://ftp.loongnix.org/embedd/ls3a/toolchain/gcc-4.4-gnu.tar.gz && \
    wget ftp://ftp.loongnix.org/embedd/ls3a/toolchain/gcc-4.9.3-64-gnu.tar.gz && \
    tar -xf gcc-4.4-gnu.tar.gz && \
    tar -xf gcc-4.9.3-64-gnu.tar.gz && \
    rm gcc-4.9.3-64-gnu.tar.gz gcc-4.4-gnu.tar.gz && \
    mv opt/* . && \
    rmdir opt

#make a loongson user
RUN adduser --disabled-password --gecos '' loongson && \
  usermod -aG sudo loongson && \
  echo "loongson ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#ARG GCC_PATH

#COPY ${GCC_PATH} /opt/

# run the install
#RUN chmod a+x -R /opt/gcc-4.4-gnu \ 
#    chmod a+x -R /opt/gcc-4.9.3-64-gnu

USER loongson 
ENV HOME /home/loongson
ENV LANG en_US.UTF-8
RUN mkdir /home/loongson/project
WORKDIR /home/loongson/project

