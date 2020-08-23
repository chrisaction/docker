FROM debian:latest
#更新源
RUN apt-get -y update && apt-get -y upgrade
RUN apt install wget curl bash git sudo python3-distutils -y
RUN apt install python3 python3-pip -y

#同步系统时间
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#下载机器人
RUN git clone https://github.com/wrenfairbank/telegram_gcloner
RUN cd /telegram_gcloner && pip3 install -r requirements.txt
ADD config.ini /telegram_gcloner/telegram_gcloner/config.ini

RUN wget https://github.com/donwa/gclone/releases/download/v1.51.0-mod1.3.1/gclone_1.51.0-mod1.3.1_Linux_x86_64.gz
RUN gunzip gclone_1.51.0-mod1.3.1_Linux_x86_64.gz
RUN mv gclone_1.51.0-mod1.3.1_Linux_x86_64 /usr/bin/gclone
RUN chmod +x /usr/bin/gclone

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
