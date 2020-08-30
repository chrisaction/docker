#FROM debian:latest
#更新源
#RUN apt-get -y update && apt-get -y upgrade
#RUN apt install -y wget curl git unzip bash jq rclone aria2
#同步系统时间
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

FROM archlinux:latest
RUN echo y | pacman -Syu
RUN echo y | pacman -S wget curl git unzip bash jq rclone aria2
#同步系统时间
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mkdir /etc/ct
#RUN touch /etc/ct/config.json
RUN chgrp -R 0 /etc/ct
RUN chmod -R g+rwX /etc/ct

VOLUME /etc/ct
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080 51413
ENTRYPOINT ["/entrypoint.sh"]
