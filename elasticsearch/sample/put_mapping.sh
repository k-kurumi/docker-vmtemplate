#!/bin/bash

# 確認用マッピング

# keyword: 完全一致でのみ検索可能で、グラフに使える(useragent割合をグラフ化するなど)
# text: アナライザーで分かち書きなど検索対象になる(グラフに使えない)

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
  }
}
' | jq .
