FROM flower1024/ghost-python3

ARG UID=82
ARG GID=82

COPY /app /app/

RUN yes | pip3 install streamlink && \
    chmod ugo+x -R /app/init && \
    USER twitch ${UID} twitch ${GID}

VOLUME [ "/home/twitch" ]
