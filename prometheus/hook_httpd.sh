#!/bin/bash
#
# alertmanagerから通知を受けるhttpd
# nc -k 付きで起動すると表示がおかしい(重複している)

while true
do
  (echo "HTTP/1.0 200 Ok"; echo; echo "Hello World") | nc -l 5001
  [ $? == 0 ] || exit 1
done
