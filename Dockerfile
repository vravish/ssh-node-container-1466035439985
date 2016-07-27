FROM gidikern/rhel-oracle-jre

ADD BI_AMBARI-2.1.0.repo /etc/yum.repos.d
CMD yum install -y tar
WORKDIR /root

RUN mkdir -p /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
CMD wget https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz && tar -xvf node-v4.4.7-linux-x64.tar.xz && \
	 node-v4.4.7-linux-x64/bin/npm install

EXPOSE 8080
CMD [ "/usr/src/app/node-v4.4.7-linux-x64/bin/npm", "start" ] 
