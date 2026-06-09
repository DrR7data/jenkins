header:
	@echo "Buen días!, Working with  docker and alpine"
red:
	docker network create jenkins
build:
	docker build -t myjenkins-blueocean:2.555.2-1 .
run:
	docker run \
	--name jenkins-blueocean \
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
	myjenkins-blueocean:2.555.2-1
pass:
	docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword 
pin:
	docker exec socket  ping jenkins-blueocean 
ipp:	
	docker inspect socket | grep IPAddress 
rm:
	docker rm -f alpine-git 
rmi:
	docker rmi alpine-git 
