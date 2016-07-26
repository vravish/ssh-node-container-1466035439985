FROM gidikern/rhel-oracle-jre 

CMD wget https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz
CMD tar -xvf node-v4.4.7-linux-x64.tar.xz -C /usr/local/bin --strip-components=1

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080
CMD [ "npm", "start" ]
