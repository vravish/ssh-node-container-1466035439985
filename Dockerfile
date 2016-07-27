FROM gidikern/rhel-oracle-jre

ADD BI_AMBARI-2.1.0.repo /etc/yum.repos.d
RUN yum install -y rpms/nodejs ; yum install -y nodejs

RUN echo Hello
