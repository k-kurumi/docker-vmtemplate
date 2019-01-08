FROM ruby:2.6

ARG uid
ARG gid
ARG user
ARG group

RUN groupadd -g $gid $group
RUN useradd $user -u $uid -g $gid

WORKDIR /work
RUN chown -R $user:$group /work

USER $user
