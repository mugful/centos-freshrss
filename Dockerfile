FROM quay.io/centos/centos:8
MAINTAINER Jiri Stransky <jistr@jistr.com>

RUN dnf -y update --refresh && dnf clean all

COPY build.sh /root/build.sh
RUN /root/build.sh

COPY files /

CMD ["/usr/local/bin/container-freshrss"]
