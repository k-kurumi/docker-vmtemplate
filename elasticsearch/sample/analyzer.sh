#!/bin/bash

# kuromjiの動作確認

curl -s -XPOST 'http://localhost:9200/_analyze' \
   -H 'Content-Type: application/json' \
   -d '
{
  "analyzer": "kuromoji",
  "text": "Hello Elasticsearch. 日本語のひらがなとカタカナ"
}
' | jq .


# 結果(ひらがながうまく取得できていない)
# $ bash ./analyzer.sh
# {
#   "tokens": [
#     {
#       "token": "hello",
#       "start_offset": 0,
#       "end_offset": 5,
#       "type": "word",
#       "position": 0
#     },
#     {
#       "token": "elasticsearch",
#       "start_offset": 6,
#       "end_offset": 19,
#       "type": "word",
#       "position": 1
#     },
#     {
#       "token": "日本語",
#       "start_offset": 21,
#       "end_offset": 24,
#       "type": "word",
#       "position": 2
#     },
#     {
#       "token": "ひる",
#       "start_offset": 25,
#       "end_offset": 26,
#       "type": "word",
#       "position": 4
#     },
#     {
#       "token": "カタカナ",
#       "start_offset": 30,
#       "end_offset": 34,
#       "type": "word",
#       "position": 9
#     }
#   ]
# }
