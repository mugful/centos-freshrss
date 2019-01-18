FROM centos:7
MAINTAINER Jiri Stransky <jistr@jistr.com>

RUN yum clean expire-cache && yum -y update && yum clean all

COPY build.sh /root/build.sh
RUN /root/build.sh

COPY files /

CMD ["/usr/local/bin/container-freshrss"]
