$IC_COMMAND ps

echo $MY_CONTAINER_NAME is the passed container name
CONTAINER_ID=$($IC_COMMAND ps | grep $MY_CONTAINER_NAME | cut -d ' ' -f1)
echo $CONTAINER_ID is the container ID
echo $IC_COMMAND is the command to call for ice
NODE_IP=$($IC_COMMAND inspect --format '{{ .NetworkSettings.PublicIpAddress }}' $CONTAINER_ID)
echo $NODE_IP is the IP of the node container


# Activate SSH and enable passwordless login for this VM
$IC_COMMAND exec -it $CONTAINER_ID /usr/sbin/sshd
mkdir -p ~/.ssh
cp ./id_rsa* ~/.ssh
chmod 0700 ~/.ssh/id_rsa*

# Prevent asking for authenticity during connections
ssh -o StrictHostKeyChecking=no vravish@$NODE_IP 'echo hello' 


# Install Chef
mkdir -p chef-repo/.chef
cp knife.rb chef-repo/.chef
cp admin.pem chef-repo/.chef

wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.15.15-1_amd64.deb
sudo dpkg --install chefdk_0.15.15-1_amd64.deb

cd chef-repo
knife ssl fetch
knife ssl check


# Make sure vravish can change all items in the home folder
ssh vravish@$NODE_IP 'sudo chown -R vravish:vravish /home/vravish'


# Finally do the knife bootstrapping
knife bootstrap $NODE_IP -y --ssh-user vravish --ssh-password 'welcome' --sudo --use-sudo-password --node-name tomcat --run-list 'recipe[venu_tomcat, venu_mysql]’


