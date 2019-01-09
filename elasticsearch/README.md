# elasticsearch

elasticsearchはrootで動かすため、dataフォルダにrootのファイルができる

## usage

```
# マウントするelasticsearchのデータフォルダ
mkdir -p data

# ホスト側のパラメータを書き換える
# https://www.elastic.co/guide/en/elasticsearch/reference/6.5/docker.html
sudo sysctl -w vm.max_map_count=262144

docker-compose up
```
