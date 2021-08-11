# Rippled Validator Network on Docker

- Containers' IPs are hardcoded in docker-compose file
- Rippled keys must be generated offline and loaded into the configuration files in /keystore, for each rippled validator (example included)

##To start:
sudo ./run_demo webstart -l

##Useful:

Open a new termimal into a Rippled container:
sudo docker exec -ti -u root docker_rippled-1 bash

Inspect the docker network:
sudo docker network inspect docker_rip_rip

##To add delay to one container:
- From outside (untested):
docker exec docker_rippled-1 tc qdisc add dev eth0 root netem delay 500ms
- From inside (tested):
tc qdisc add dev eth0 root netem delay 500ms

##The number of threads to compile boost and rippled is set to 4 in the dockerfile.
  It is possible to adjust as needed.

##Source.
Currently the Rippled source is in "treisto" Git repo - a fork from Flaviene.
Here is the current "one4all.js" grpc script.
It can be changed as needed.

##The gossipsub nodes start automatically with Docker-Compose.
However at this stage the corresponding rippled nodes in each container must be started manually.
- To do this, enter each container (a script can be made):

   sudo docker exec -ti docker_rippled-3_1 bash

- Then start the rippled node with the corresponding config file:

   /opt/ripple/bin/rippled --conf /opt/ripple/etc/rippled3.cfg --quorum=2

Lucian: From my practical experience with this docker-compose project, it is better to start the Gossipsub first and Rippled after (which I do now).
Starting Rippled first and GossipSub after had 100% crashed Rippled.




