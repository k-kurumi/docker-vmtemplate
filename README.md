# docker-template

コンテナ内のユーザをホストと同じにすることで、生成ファイルのパーミッションを合わせてVM風に使いたい

## usage

```
cd <Dockerfileのあるフォルダ>

# マウントするフォルダを作成
mkdir -p localwork

# 実行ユーザと同じuidで作ればマウント部分に書き出しても実行ユーザ所有に見える
docker build . -t r1 --build-arg uid=$(id -u) --build-arg gid=$(id -g) --build-arg user=$(id -u -n) --build-arg group=$(id -g -n)

# マウントして起動(alpineは/bin/sh)
docker run -it --entrypoint=/bin/bash -v $(readlink -f localwork):/work r1
```
