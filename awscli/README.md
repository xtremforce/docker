Docker Container for awscli
===

Make sure you have docker installed, or your docker has been successfully connected to a remote docker machine.

Simply copy `aws` to your system path.
```bash
export PATH=$PATH:$HOME/bin
cp aws $HOME/bin
```

Use `aws` like you usually do.
```
aws configure
aws s3 ls s3://mybucket
```
