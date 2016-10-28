FROM centos:centos7.2.1511

### START Copied section, see https://hub.docker.com/_/centos/
MAINTAINER "Jarl Friis" <jarl@softace.dk>
### END Copied section

RUN yum install -y epel-release
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
RUN yum -y update
RUN yum install -y \
  openssl \
  proftpd \
  proftpd-utils \
  supervisor

COPY supervisord.conf /etc/supervisord.conf

RUN /sbin/proftpd --configtest

run yum install -y \
  automake \
  fuse \
  fuse-devel \
  gcc-c++ \
  libcurl-devel \
  libxml2-devel \
  make \
  openssl-devel

# Find latest stable version on https://github.com/s3fs-fuse/s3fs-fuse/releases
ENV FUSE_VERSION=1.80
RUN cd /tmp && \
curl -fLO https://github.com/s3fs-fuse/s3fs-fuse/archive/v${FUSE_VERSION}.tar.gz && \
tar -zxvf v${FUSE_VERSION}.tar.gz && \
pushd s3fs-fuse-${FUSE_VERSION} && \
./autogen.sh && \
./configure && \
make && \
make install && \
popd && \
rm -rf s3fs-fuse-${FUSE_VERSION}

CMD ["/bin/supervisord"]
