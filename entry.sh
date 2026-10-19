#!/bin/sh
UUID=${UUID:-$(cat /proc/sys/kernel/random/uuid)}
PORT=${PORT:-8080}
WS_PATH=${WS_PATH:-/vless}
cat > /etc/xray.json <<EOF
{
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "vless",
      "settings": { "clients": [ { "id": "$UUID" } ], "decryption": "none" },
      "streamSettings": { "network": "ws", "wsSettings": { "path": "$WS_PATH" } }
    }
  ],
  "outbounds": [ { "protocol": "freedom" } ]
}
EOF
echo "UUID=$UUID"
echo "WS_PATH=$WS_PATH"
echo "PORT=$PORT"
/usr/local/bin/xray run -c /etc/xray.json
