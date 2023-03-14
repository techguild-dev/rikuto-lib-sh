#!/bin/bash

# サーバの使用容量を表示
echo "【サーバ使用容量】"
df -h | awk '$NF=="/"{printf "総容量: %dGB\n使用量: %dGB\n空き容量: %dGB\n使用率: %s\n", $2,$3,$4,$5}'

# メモリの使用率を表示
echo "【メモリ使用率】"
free | awk 'NR==2{printf "総容量: %dMB\n使用量: %dMB\n空き容量: %dMB\n使用率: %.2f%%\n", $2,$3,$4,($3/$2)*100}'

# 使用中のポート番号を表示
echo "【使用中のポート番号】"
netstat -an | grep -E "^tcp.*LISTEN" | awk '{print $4}' | awk -F':' '{print $NF}' | sort -n | uniq
