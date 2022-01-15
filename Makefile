build_vpn_docker_x86:
	docker build -t pigpiggcp/boar_openvpn:apline -f Dockerfile .

build_vpn_docker_arm64:
	docker build -t pigpiggcp/boar_openvpn:apline -f Dockerfile.aarch64 .
