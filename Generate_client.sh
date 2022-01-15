#/bin/bash
OVPN_DATA="ovpn-data-boar"
IMAGE_NAME=pigpiggcp/boar_openvpn:apline
CLIENTNAME=$1
if [ -z ${CLIENTNAME} ]; then
    CLIENTNAME=client$(cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 20; echo;)
fi
docker run -v $OVPN_DATA:/etc/openvpn --rm -it ${IMAGE_NAME} easyrsa build-client-full $CLIENTNAME nopass
echo "NEW CLIENT: ${CLIENTNAME}"
docker run -v $OVPN_DATA:/etc/openvpn --rm ${IMAGE_NAME} ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn