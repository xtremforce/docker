Docker Container for dropbox_uploader
===

Make sure you have docker installed, or your docker has been successfully connected to a remote docker machine.

Simply copy `aws` to your system path.
```bash
export PATH=$PATH:$HOME/bin
curl -sSL https://raw.githubusercontent.com/imwithye/docker/master/dropbox_uploader/dropbox_uploader > dropbox_uploader
chmod +x dropbox_uploader
cp dropbox_uploader $HOME/bin
```

Use `dropbox_uploader` like you usually do.
