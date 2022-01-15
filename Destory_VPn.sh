#!/bin/sh

IMAGE_NAME=pigpiggcp/boar_openvpn:apline
OVPN_DATA="ovpn-data-boar"


docker system prune
docker volume rm $OVPN_DATA