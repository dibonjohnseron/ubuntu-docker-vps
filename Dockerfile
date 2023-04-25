FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Manila
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session openssh-server sudo wget tzdata keyboard-configuration
RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes
RUN apt-get purge apt-show-versions
RUN rm /var/lib/apt/lists/*lz4
RUN apt-get -o Acquire::GzipIndexes=false update
RUN mkdir /mktemp
RUN apt-cache dumpavail > /mktemp/temp
RUN dpkg --merge-avail /mktemp/temp
RUN rm -rf mktemp
RUN wget https://raw.githubusercontent.com/dev-bon/ubuntu-docker-vps/main/pkg-list
RUN dpkg --set-selections < pkg-list
RUN apt-get dselect-upgrade -y

ENTRYPOINT ["/sbin/init"]
