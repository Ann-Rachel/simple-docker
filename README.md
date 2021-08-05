## install docker
https://docs.docker.com/get-docker/

Ubuntu 20.04: latest version of Docker
```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
```
download this project
```bash
git clone https://github.com/Ann-Rachel/simple-docker.git
```
build
```bash
sudo docker build -t simple . -f Dockerfile
```
run
```bash
sudo docker run -it --rm simple ANNA BEN
```
