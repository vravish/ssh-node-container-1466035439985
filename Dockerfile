FROM node:argon 

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm install

COPY . /usr/src/app

# Set up SSH
RUN apt-get update ; apt-get install -y zip
RUN apt-get install -y sudo openssh-server
RUN sed -i '/^.sudo/c\%sudo ALL=(ALL) NOPASSWD:ALL' /etc/sudoers
RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd
RUN useradd --create-home --shell /bin/bash --groups sudo vravish

# Add public key to right place
RUN mkdir -p /home/vravish/.ssh
RUN cat /usr/src/app/id_rsa.pub >> /home/vravish/.ssh/authorized_keys

# Configure MySQL
ENV MYSQL_USER="coreosuser"
ENV MYSQL_DATABASE="enterpriseregistrydb"
ENV MYSQL_CONTAINER_NAME="mysql"

ENV MYSQL_ROOT_PASSWORD="rootpass"
ENV MYSQL_PASSWORD="mypass"

# Expose all ports
EXPOSE 8080
EXPOSE 22
EXPOSE 80
EXPOSE 9080
EXPOSE 1111
EXPOSE 3306

CMD ["npm", "start"]

