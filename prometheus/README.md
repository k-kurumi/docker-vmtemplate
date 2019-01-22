# prometheus



## usage

1. direnvか手動で.envrc相当の処理をする
2. 起動する

``````
docker-compose up
``````

---

設定とルールのチェック

```
$ go get github.com/prometheus/prometheus/cmd/promtool

$ promtool check config ./prometheus.yml
Checking ./prometheus.yml
  SUCCESS: 1 rule files found

Checking rules/rule1.yml
  SUCCESS: 3 rules found
```
