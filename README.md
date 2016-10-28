An open source FTP 2 S3 bridge
==============================

Build the docker container
==========================

```
docker build -t ftp2s3 .
```

Run the bridge
==============

```
docker run -it --rm -e BUCKET_NAME=buck -v /tmp/passwd-s3fs:/hostfs/passwd-s3fs --name ftp2s3 ftp2s3
```
