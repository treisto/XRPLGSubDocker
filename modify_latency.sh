#!/bin/bash
#echo "started at `date +%s.%N`, delay added (ms): " $1
#echo "0, `date +%s.%N`"
#sudo docker exec docker_rippled-1_1 tc qdisc del dev eth0 root netem
#sudo docker exec docker_rippled-2_1 tc qdisc del dev eth0 root netem
#sudo docker exec docker_rippled-3_1 tc qdisc del dev eth0 root netem
#sleep 40
echo "150, `date +%s.%N`"
sudo docker exec docker_rippled-1_1 tc qdisc add dev eth0 root netem delay 150ms
sudo docker exec docker_rippled-2_1 tc qdisc add dev eth0 root netem delay 150ms
sudo docker exec docker_rippled-3_1 tc qdisc add dev eth0 root netem delay 150ms
sleep 40
echo "0, `date +%s.%N`"
sudo docker exec docker_rippled-1_1 tc qdisc del dev eth0 root netem
sudo docker exec docker_rippled-2_1 tc qdisc del dev eth0 root netem
sudo docker exec docker_rippled-3_1 tc qdisc del dev eth0 root netem
sleep 40
echo "150, `date +%s.%N`"
sudo docker exec docker_rippled-1_1 tc qdisc add dev eth0 root netem delay 150ms
sudo docker exec docker_rippled-2_1 tc qdisc add dev eth0 root netem delay 150ms
sudo docker exec docker_rippled-3_1 tc qdisc add dev eth0 root netem delay 150ms
sleep 40
echo "0, `date +%s.%N`"
sudo docker exec docker_rippled-1_1 tc qdisc del dev eth0 root netem
sudo docker exec docker_rippled-2_1 tc qdisc del dev eth0 root netem
sudo docker exec docker_rippled-3_1 tc qdisc del dev eth0 root netem
sleep 40
echo "150, `date +%s.%N`"
sudo docker exec docker_rippled-1_1 tc qdisc add dev eth0 root netem delay 150ms
sudo docker exec docker_rippled-2_1 tc qdisc add dev eth0 root netem delay 150ms
sudo docker exec docker_rippled-3_1 tc qdisc add dev eth0 root netem delay 150ms
sleep 40
echo "0, `date +%s.%N`"
sudo docker exec docker_rippled-1_1 tc qdisc del dev eth0 root netem
sudo docker exec docker_rippled-2_1 tc qdisc del dev eth0 root netem
sudo docker exec docker_rippled-3_1 tc qdisc del dev eth0 root netem
sleep 40
echo "150, `date +%s.%N`"
sudo docker exec docker_rippled-1_1 tc qdisc add dev eth0 root netem delay 150ms
sudo docker exec docker_rippled-2_1 tc qdisc add dev eth0 root netem delay 150ms
sudo docker exec docker_rippled-3_1 tc qdisc add dev eth0 root netem delay 150ms
sleep 40
echo "0, `date +%s.%N`"
sudo docker exec docker_rippled-1_1 tc qdisc del dev eth0 root netem
sudo docker exec docker_rippled-2_1 tc qdisc del dev eth0 root netem
sudo docker exec docker_rippled-3_1 tc qdisc del dev eth0 root netem
