#!/bin/bash

# 確認用マッピング

# 削除(データも消える)
curl -s -X DELETE 'http://localhost:9200/myindex2'

# keyword: 完全一致でのみ検索可能で、グラフに使える(useragent割合をグラフ化するなど)
# text: アナライザーで分かち書きなど検索対象になる(グラフに使えない)
#
# shardsはあとから変更できない
# replicasはあとで変更できる
# shard: 5, replica: 1 のとき、shardは全部で10個できる(shard5とレプリカ分5)
curl -s -XPUT 'http://localhost:9200/myindex2' \
  -H 'Content-Type: application/json' \
  -d '
{
  "mappings": {
    "mytype": {
      "properties": {
        "username": {
          "type": "keyword"
        },
        "date": {
          "type": "date"
        },
        "message": {
          "type": "text",
          "analyzer": "kuromoji"
        }
      }
    }
  },
  "settings": {
    "index": {
     "number_of_shards": 2,
     "number_of_replicas": 1
   }
  }
}
' | jq .
