MY_CONTAINER_NAME="${CONTAINER_NAME}_${BUILD_NUMBER}"
echo $MY_CONTAINER_NAME is the container name
echo $IC_COMMAND is the command to call for ice

# $IC_COMMAND exec -it $MY_CONTAINER_NAME /usr/sbin/sshd

mkdir -p chef-repo/.chef
cp knife.rb chef-repo/.chef
cp admin.pem chef-repo/.chef

wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.15.15-1_amd64.deb
sudo dpkg --install chefdk_0.15.15-1_amd64.deb

cd chef-repo
knife ssl fetch
knife ssl check

# knife bootstrap ${FLOATING_IP} --ssh-user vravish --ssh-password 'welcome' --sudo --use-sudo-password --node-name node1 --run-list 'recipe[venu_tomcat]'


