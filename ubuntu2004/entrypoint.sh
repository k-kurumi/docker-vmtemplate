#!/bin/bash

set -eu

USER_ID=$(id -u)
GROUP_ID=$(id -g)

# グループを作成する
if (( GROUP_ID != 0 )); then
  # -f: GIDが被っても無視する
  groupadd -f -g "${GROUP_ID}" "${USER_NAME}"
fi

# ユーザを作成する
if (( USER_ID != 0 )); then
  useradd -d "/home/${USER_NAME}" -m -s /bin/bash -u "${USER_ID}" -g "${GROUP_ID}" "${USER_NAME}"
fi

# パーミッションを元に戻す
sudo chmod u-s /usr/sbin/useradd
sudo chmod u-s /usr/sbin/groupadd

sudo chown -R "${USER_ID}":"${GROUP_ID}" "${HOME}"

exec "$@"
