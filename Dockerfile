FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

# Set up SSH
RUN apt-get update ; apt-get install -y zip
RUN apt-get install -y default-jre
RUN apt-get install -y sudo openssh-server
RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd
RUN useradd --create-home --shell /bin/bash --groups sudo vravish
RUN printf "welcome\nwelcome\n" | passwd vravish

# Add public key to right place
RUN mkdir -p /home/vravish/.ssh
RUN cat /usr/src/app/id_rsa.pub >> /home/vravish/.ssh/authorized_keys

# Expose all ports
EXPOSE 8080
EXPOSE 22
EXPOSE 80
EXPOSE 9080
EXPOSE 1111

CMD ["npm", "start"]
