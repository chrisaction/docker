FROM debian:latest
#更新源
RUN apt-get -y update && apt-get -y upgrade
#安装ssh
RUN apt install -y openssh-server curl wget unzip git
#同步系统时间
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#修改root

RUN mkdir /tmp/v2ray
RUN curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
RUN unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
RUN chmod +x /tmp/v2ray/v2ray
RUN chmod +x /tmp/v2ray/v2ctl
RUN mv /tmp/v2ray/v2ray /usr/local/bin/v2ray
RUN mv /tmp/v2ray/v2ctl /usr/local/bin/v2ctl
RUN mkdir /usr/local/etc/v2ray
RUN touch /usr/local/etc/v2ray/config.json
RUN rm -rf /tmp/v2ray

RUN sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication yes/g" /etc/ssh/sshd_config
RUN echo root:123456789 |chpasswd root

RUN wget -P /usr/bin https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz
RUN tar -zxvf /usr/bin/caddy_v1.0.4_linux_amd64.tar.gz -C /usr/bin
RUN chmod +x /usr/bin/caddy
RUN mkdir /wwwroot
RUN git clone https://github.com/xiongbao/we.dog
RUN mv we.dog/* /wwwroot
RUN rm -rf /we.dog

ADD Caddyfile /etc/Caddyfile

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
