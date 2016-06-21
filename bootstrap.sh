MY_CONTAINER_NAME="${CONTAINER_NAME}_${BUILD_NUMBER}"
echo $MY_CONTAINER_NAME is the container name
echo $IC_COMMAND is the command to call for ice

$IC_COMMAND exec -it $MY_CONTAINER_NAME /usr/sbin/sshd



knife bootstrap 169.44.119.171 --ssh-user vravish --ssh-password 'welcome' --sudo --use-sudo-password --node-name node1 --run-list 'recipe[venu_tomcat]'


