#/bin/bash

OVPN_DATA="ovpn-data-boar"
IMAGE_NAME=pigpiggcp/boar_openvpn:apline
FQDN=ec2-54-144-210-125.compute-1.amazonaws.com
docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --rm ${IMAGE_NAME} ovpn_genconfig -u udp://${FQDN}
echo "Generate the OVPN server credentials"
docker run -v $OVPN_DATA:/etc/openvpn --rm -it ${IMAGE_NAME} ovpn_initpki

PORT=1194
echo "Start the service"
docker run -v $OVPN_DATA:/etc/openvpn -d -p ${PORT}:${PORT}/udp --cap-add=NET_ADMIN ${IMAGE_NAME}

