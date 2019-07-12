FROM ubuntu:18.04

RUN apt-get update && apt-get install -y sudo

# 一般ユーザ名を設定
ENV USER_NAME=developer

# sudoを使用できるようにする
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME}

# 一般ユーザがユーザ/グループを追加できるようにする
# entrypoint.sh内でパーミッションを元に戻す
RUN chmod u+s /usr/sbin/useradd \
    && chmod u+s /usr/sbin/groupadd

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
