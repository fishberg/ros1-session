#/usr/bin/env bash
#docker run -it $DOCKER_TAG

source CONFIG.sh

OPTIONS="--rm"
NETWORK="--net=host"
SHARE_USER="-v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -u `id -u`:`id -g` -w /home/$USER"
#DEVICES="--privileged --device=/dev/ttyUSB0"
VOLUMES="-v $(pwd)/home-bridge:/home/$USER"
#ROS_VARS="-e ROS_MASTER_URI=$ROS_MASTER_URI -e ROS_IP=$ROS_IP"

docker run -it $OPTIONS $NETWORK $SHARE_USER $DEVICES $VOLUMES $ROS_VARS $DOCKER_TAG $@
