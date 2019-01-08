FROM alpine:3.8

ARG uid
ARG gid
ARG user
ARG group

RUN addgroup -g $gid $group
RUN adduser $user -u $uid -G $group -D

WORKDIR /work
RUN chown -R $user:$group /work

USER $user
