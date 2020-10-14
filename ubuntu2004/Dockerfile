FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# lessやgit logの文字化け対策
ENV LESSCHARSET=utf-8
ENV LANG=en_US.UTF-8

# 一般ユーザ名を設定
ENV USER_NAME=kurumi
ENV HOME=/home/${USER_NAME}

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  sudo zsh \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

# sudoを使用できるようにする
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME}

# 一般ユーザがユーザとグループを追加できるようにする
# entrypoint.sh内でパーミッションを元に戻す
RUN chmod u+s /usr/sbin/useradd && chmod u+s /usr/sbin/groupadd

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/zsh"]
WORKDIR /work/docker-vmtemplate
