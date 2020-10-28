#!/usr/bin/env bash

handleERR() {
    echo "$0 Error on line $1"
}
set -e
trap 'handleERR $LINENO' ERR

mkdir -p /tmp/start/twitch
chown twitch:twitch /home/twitch
chmod ug+rwx /home/twitch

for streamer in $(ENV STREAMERS); do
cat <<EOT > /tmp/start/twitch/${streamer}.sh
#!/usr/bin/env bash

handleERR() {
    echo "\$0 Error on line \$1"
}
set -e
trap 'handleERR \$LINENO' ERR

while true; do
    TS="\$(date "+%Y")-\$(date "+%m")-\$(date "+%d") \$(date "+%H"):\$(date "+%M")"

    /usr/local/bin/streamlink -l warning --twitch-disable-hosting --twitch-disable-ads --twitch-disable-reruns twitch.tv/${streamer} $(ENV STREAMER "$streamer" QUALITY) -o "/home/twitch/${streamer}-\${TS}.ts" 2>/dev/null || echo > /dev/null

    sleep 15
done
EOT
done

chown twitch:twitch -R /tmp/start/twitch
chmod u+x -R /tmp/start/twitch

