header:
	@echo "Buen días!, Working with  docker and alpine"
#===========================================================
red:
#1 Red
	docker network create jenkins
dind:
#2 create dind
	docker run \
  --name jenkins-docker \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind \
  --storage-driver overlay2

build:
#3 build
	docker build -t myjenkins:2.580.2-1 .
run:
#4 run contenedor
	docker run \
  --name jenkins \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins:2.580.2-1

pass:
	docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword 
#========================================================
pin:
	docker exec socket  ping jenkins-blueocean 
ipp:	
	docker inspect socket | grep IPAddress 
rm:
	docker rm -f alpine-git 
rmi:
	docker rmi alpine-git 
ls:
	docker exec jenkins-blueocean ls /var/jenkins_home/workspace 
g:
	bash docs/g.sh