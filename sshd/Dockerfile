FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive TZ=Asia/Tokyo
RUN apt-get update && apt-get -y install sudo openssh-server

RUN mkdir -p /var/run/sshd
RUN useradd -d /home/sss -m -s /bin/bash sss
RUN echo sss:ppp111 | chpasswd
RUN echo 'sss ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
