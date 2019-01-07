FROM ubuntu:18.04

RUN apt-get update && apt-get install -y netcat

ARG uid
ARG gid
ARG user
ARG group

RUN groupadd -g $gid $group
RUN useradd $user -u $uid -g $gid

WORKDIR /work
RUN chown -R $user:$group /work

USER $user

ENTRYPOINT ["/bin/nc", "-k", "-l", "8888"]
