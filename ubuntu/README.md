# ubuntu

* Dockerfile
  * プレーンな状態

## usage

```
# マウントするフォルダを作成
mkdir -p localwork

# 実行ユーザと同じuidで作ればマウント部分に書き出しても実行ユーザ所有に見える
docker build . -t u1 --build-arg uid=$(id -u) --build-arg gid=$(id -g) --build-arg user=$(id -u -n) --build-arg group=$(id -g -n)

# マウントして起動
docker run -it --entrypoint=/bin/bash -v $(readlink -f localwork):/work u1
```

---

* Dockerfile2
  * 開発環境を追加した状態

## usage

```
# マウントするフォルダを作成
mkdir -p localwork

# 実行ユーザと同じuidで作ればマウント部分に書き出しても実行ユーザ所有に見える
docker build . -t u2 --build-arg uid=$(id -u) --build-arg gid=$(id -g) --build-arg user=$(id -u -n) --build-arg group=$(id -g -n) -f Dockerfile2

# マウントして起動
docker run -it --entrypoint=/bin/bash -v $(readlink -f localwork):/work u2
```
