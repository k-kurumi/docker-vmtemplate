#!/bin/bash

# 確認用データ

curl -s -XPUT 'http://localhost:9200/myindex2/mytype/1?refresh' \
  -H 'Content-Type: application/json' \
  -d '
{
  "username": "user1",
  "date": "'$(date -d '- 20 min' --iso-8601=s)'",
  "message": "一人目のユーザ。東京都の昨日の天気は雨だった。"
}
' | jq .

curl -s -XPUT 'http://localhost:9200/myindex2/mytype/2?refresh' \
  -H 'Content-Type: application/json' \
  -d '
{
  "username": "user2",
  "date": "'$(date -d '- 10 min' --iso-8601=s)'",
  "message": "二人目のユーザー。京都の今日の天気は晴れだった。"
}
' | jq .

curl -s -XPUT 'http://localhost:9200/myindex2/mytype/3?refresh' \
  -H 'Content-Type: application/json' \
  -d '
{
  "username": "user3",
  "date": "'$(date --iso-8601=s)'",
  "message": "三人目のユーザ。東京都の明日の天気は雪だった。"
}
' | jq .
