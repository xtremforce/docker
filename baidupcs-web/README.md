执行命令：

docker run -d --name baidupcs -p 5299:5299 -v /your/downloads:/downloads -v /your/config:/root/.config/BaiduPCS-Go xforce/baidupcs:latest
