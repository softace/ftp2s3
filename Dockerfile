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

CMD ["/bin/supervisord"]
