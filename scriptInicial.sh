#!/bin/bash
# Create the sub-networks
docker network create -d bridge --subnet 172.25.10.0/24 centos6_net
docker network create -d bridge --subnet 172.25.20.0/24 centos7_net
docker network create -d bridge --subnet 172.25.30.0/24 ubuntu16_net
docker network create -d bridge --subnet 172.25.40.0/24 ubuntu14_net

# Create the docker-image.
docker build -t ubuntu_16 ./ubuntu_16
docker run -d --network=ubuntu16_net --name Ubuntu_16_1 --ip=172.25.30.2 --rm ubuntu_16
docker run -d --network=ubuntu16_net --name Ubuntu_16_2 --ip=172.25.30.3 --rm ubuntu_16

docker build -t ubuntu_14 ./ubuntu_14
docker run -d --network=ubuntu14_net --name Ubuntu_14_1 --ip=172.25.40.2 --rm ubuntu_14
docker run -d --network=ubuntu14_net --name Ubuntu_14_2 --ip=172.25.40.3 --rm ubuntu_14

docker build -t centos7 ./centos7
docker run -d --network=centos7_net --name Centos7_1 --ip=172.25.20.2 --rm centos7
docker run -d --network=centos7_net --name Centos7_2 --ip=172.25.20.3 --rm centos7

docker build -t centos6 ./centos6
docker run -d --network=centos6_net --name Centos6_1 --ip=172.25.10.2 --rm centos6
docker run -d --network=centos6_net --name Centos6_2 --ip=172.25.10.3 --rm centos6
