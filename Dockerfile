FROM busybox:ubuntu-14.04

COPY bin /bin/

CMD ["/bin/sqlite3"]
