FROM ruby:2.6
# debian base

ARG uid
ARG gid
ARG user
ARG group

RUN groupadd -g $gid $group
RUN useradd $user -u $uid -g $gid

WORKDIR /work
RUN chown -R $user:$group /work

RUN apt-get update && apt-get install -y sudo
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 必要そうなツールを追加する
RUN apt-get install -y iproute2

USER $user
