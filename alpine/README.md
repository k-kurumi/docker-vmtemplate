# alpine

## usage

```
# マウントするフォルダを作成
mkdir -p localwork

# 実行ユーザと同じuidで作ればマウント部分に書き出しても実行ユーザ所有に見える
docker build . -t a1 --build-arg uid=$(id -u) --build-arg gid=$(id -g) --build-arg user=$(id -u -n) --build-arg group=$(id -g -n)

# マウントして起動(alpineはbusyboxのため/bin/bashがない)
docker run -it --entrypoint=/bin/sh -v $(readlink -f localwork):/work a1
```
