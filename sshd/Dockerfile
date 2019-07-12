FROM ubuntu:18.04

ENV USERNAME=kurumi
ENV GITHUB_USERNAME=k-kurumi

ENV DEBIAN_FRONTEND=noninteractive TZ=Asia/Tokyo
RUN apt-get update && apt-get -y install sudo openssh-server curl

RUN mkdir -p /var/run/sshd
RUN useradd -d /home/${USERNAME} -m -s /bin/bash ${USERNAME}

RUN echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USERNAME}

# 鍵の登録
RUN mkdir -p /home/${USERNAME}/.ssh \
  && curl -s -o /home/${USERNAME}/.ssh/authorized_keys https://github.com/${GITHUB_USERNAME}.keys \
  && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/.ssh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
