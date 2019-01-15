# elasticsearch

* クラスタ確認のため master x3, data x3, ingest x1 の構成
  * master: クラスタ管理専門
  * data: データ保持専門
  * ingest: API受付専門(kibana受付)
* elasticsearchはrootで動かすため、dataフォルダにrootのファイルができる

## usage

```
# マウントするelasticsearchのデータフォルダ
mkdir -p es_{master,data}{0..2}_data
mkdir -p es_ingest0_data

# ホスト側のパラメータを書き換える
# https://www.elastic.co/guide/en/elasticsearch/reference/6.5/docker.html
sudo sysctl -w vm.max_map_count=262144

docker-compose up
```

動作確認

```
$ curl 'http://localhost:9200/_cat/nodes?v'
ip         heap.percent ram.percent cpu load_1m load_5m load_15m node.role master name
172.20.0.9           35          98  57   11.99    6.60     3.29 m         *      master0
172.20.0.2           34          98  72   11.99    6.60     3.29 m         -      master1
172.20.0.5           37          98  55   11.99    6.60     3.29 i         -      ingest0
172.20.0.8           26          98  59   11.99    6.60     3.29 d         -      data0
172.20.0.3           34          98  68   11.99    6.60     3.29 m         -      master2
172.20.0.7           29          98  58   11.99    6.60     3.29 d         -      data2
172.20.0.4           38          98  61   11.99    6.60     3.29 d         -      data1
```

```
$ curl 'http://localhost:9200/_cluster/health?pretty'
{
  "cluster_name" : "my-cluster",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 7,
  "number_of_data_nodes" : 3,
  "active_primary_shards" : 3,
  "active_shards" : 6,
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

---

## endpoint

> elasticsearch-head

http://localhost:9100/

> kibana

http://localhost:5601/
