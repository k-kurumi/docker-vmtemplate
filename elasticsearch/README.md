# elasticsearch

elasticsearchはrootで動かすため、dataフォルダにrootのファイルができる

## usage

```
# マウントするelasticsearchのデータフォルダ
mkdir -p data{0..2}

# ホスト側のパラメータを書き換える
# https://www.elastic.co/guide/en/elasticsearch/reference/6.5/docker.html
sudo sysctl -w vm.max_map_count=262144

docker-compose up
```

動作確認

```
$ curl -s 'http://localhost:9200/_cluster/health?pretty'
{
  "cluster_name" : "my-cluster",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 3,
  "number_of_data_nodes" : 3,
  "active_primary_shards" : 6,
  "active_shards" : 12,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}
```
