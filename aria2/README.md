Docker Container for Aria2
===

Start aria2 RPC server.
```bash
# Start
docker run -d --name aria2 -p 6800:6800 imwithye/aria2
# Get the randomly generated token
docker logs aria2
```

## ENV
You can also use ENV to reconfigure the aria2 server.
```bash
docker run -d --name aria2 -p 6800:6800 -e "TOKEN=123456" imwithye/aria2
docker logs aria2
```

## Data
Data is stored in the volume `/data`. You may mount a host volume to the container.
```bash
docker run -d --name aria2 -p 6800:6800 -v $HOME/data:/data imwithye/aria2
docker logs aria2
```
