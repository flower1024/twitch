# twitch
streamlink twitch recorder

# docker-compose
```
    twitch:
        image: flower1024/twitch
        restart: unless-stopped
        read_only: true
        environment:
            - STREAMERS=royalphunk gerugon
            - STREAMER_DEFAULT_QUALITY=720p,best
        volumes:
            - /srv/volumes/twitch/records:/home/twitch
            - /srv/volumes/twitch/tmp:/tmp
```
