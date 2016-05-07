Docker Container for Shadowsocks
===

Start shadowsocks server.
```bash
# Start
docker run -d --name shadowsocks -p 9521:8388 imwithye/shadowsocks
# Get the randomly generated password
docker logs shadowsocks
```

## ENV
You can also use ENV to reconfigure the shadowsocks server.
```bash
docker run -d --name shadowsocks -p 8080:8388 -e "PASSWORD=123456" -e "METHOD=aes-256-cfb" imwithye/shadowsocks
docker logs shadowsocks
```
