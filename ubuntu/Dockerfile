FROM ubuntu:18.04

ARG uid
ARG gid
ARG user
ARG group

RUN groupadd -g $gid $group
RUN useradd $user -u $uid -g $gid --home-dir /home/$user --create-home

RUN apt-get update && apt-get install -y sudo
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 必要そうなツールを追加する
RUN apt-get install -y iproute2

USER $user
WORKDIR /home/$user
