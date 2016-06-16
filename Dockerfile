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
RUN apt-get update ; apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd
RUN /usr/sbin/sshd
RUN useradd --create-home --shell /bin/bash --groups sudo vravish
RUN printf "welcome\nwelcome\n" | passwd vravish

EXPOSE 8080
EXPOSE 22
EXPOSE 80
EXPOSE 9080
CMD [ "npm", "start" ]

