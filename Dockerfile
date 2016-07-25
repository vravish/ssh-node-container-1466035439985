FROM gidikern/rhel-oracle-jre 

CMD wget https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz
CMD tar -xvf node-v4.4.7-linux-x64.tar.xz -C /usr/local --strip-components=1 

CMD ["node"]
