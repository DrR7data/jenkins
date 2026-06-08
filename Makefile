header:
	@echo "Buen días!, Working with  docker and alpine"
build:
	docker build . -t alpine-git
run:
	docker run -it --name alpine-git -p 3000:3000 alpine-git sh
rm:
	docker rm -f alpine-git 
rmi:
	docker rmi alpine-git 
