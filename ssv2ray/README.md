# ssv2ray
IBM Cloud Foundry上用的ss+v2ray-plugin

关于客户端参数配置  由于我只用clash  贴出一下参数吧

```shell
- name: "名称"
  type: ss
  server: ibm或者workers.dev反代域名
  port: 443
  cipher: chacha20-ietf-poly1305
  password: "peng"
  plugin: v2ray-plugin
  plugin-opts:
    mode: websocket # no QUIC now
    tls: true # wss
    skip-cert-verify: true
    host: ibm或者workers.dev反代域名
    path: "/peng"
      # mux: true
      # headers:
      #   custom: value
```
