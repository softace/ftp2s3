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
docker run -it --rm -e BUCKET_NAME=buck -e S3_URL=http://localhost/ --privileged --cap-add SYS_ADMIN --device /dev/fuse --name ftp2s3 ftp2s3
```
