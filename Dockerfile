FROM gidikern/rhel-oracle-jre

ADD BI_AMBARI-2.1.0.repo /etc/yum.repos.d
RUN yum install node

RUN echo Hello
