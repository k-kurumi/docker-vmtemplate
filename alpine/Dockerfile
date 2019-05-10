FROM alpine:3.9.3

ARG uid
ARG gid
ARG user
ARG group

RUN addgroup -g $gid $group
RUN adduser $user -u $uid -G $group -D

WORKDIR /home/$user
RUN chown -R $user:$group /home/$user

RUN apk add --no-cache sudo bash wget curl
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $user
