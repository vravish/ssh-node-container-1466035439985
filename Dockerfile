FROM gidikern/rhel-oracle-jre

ADD BI_AMBARI-2.1.0.repo /etc/yum.repos.d

WORKDIR /root

CMD wget https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz && tar -xvf node-v4.4.7-linux-x64.tar.xz

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN /root/node-v4.4.7-linux-x64/bin/npm install

COPY . /usr/src/app

EXPOSE 8080
CMD [ "/root/node-v4.4.7-linux-x64/bin/npm", "start" ] 
