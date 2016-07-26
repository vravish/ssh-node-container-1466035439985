FROM gidikern/rhel-oracle-jre

RUN apt-rpm install node || yum install node

RUN echo Hello
