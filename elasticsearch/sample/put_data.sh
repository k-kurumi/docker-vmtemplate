#!/bin/bash

# 確認用データ

curl -s -XPUT 'http://localhost:9200/myindex2/mytype/1?refresh' \
  -H 'Content-Type: application/json' \
  -d '
{
  "username": "user1",
  "date": "2019-01-10T09:52:09+09:00",
  "message": "一人目のユーザ。東京都の昨日の天気は雨だった。"
}
' | jq .

curl -s -XPUT 'http://localhost:9200/myindex2/mytype/2?refresh' \
  -H 'Content-Type: application/json' \
  -d '
{
  "username": "user2",
  "date": "2019-01-10T09:55:09+09:00",
  "message": "二人目のユーザー。京都の今日の天気は晴れだった。"
}
' | jq .

curl -s -XPUT 'http://localhost:9200/myindex2/mytype/3?refresh' \
  -H 'Content-Type: application/json' \
  -d '
{
  "username": "user3",
  "date": "2019-01-10T10:00:09+09:00",
  "message": "三人目のユーザ。東京都の明日の天気は雪だった。"
}
' | jq .

