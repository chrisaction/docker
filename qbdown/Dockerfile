FROM debian:latest
#更新源
RUN apt-get -y update && apt-get -y upgrade
RUN apt install -y curl wget rclone jq
RUN apt-get install qbittorrent-nox -y
#同步系统时间
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mkdir /etc/ct

VOLUME /root/.config/qBittorrent

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 1234 8999
ENTRYPOINT ["/entrypoint.sh"]
