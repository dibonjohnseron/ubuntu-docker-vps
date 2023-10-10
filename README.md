# Ubuntu 22.04 Docker VPS

## Clone Ubuntu 22.04 Docker VPS
    - git clone https://github.com/dev-bon/ubuntu-docker-vps.git
    - cd ubuntu-docker-vps

## Build Ubuntu 22.04 Docker VPS
    - docker build -t ubuntu-vps -f Dockerfile .

## Run Ubuntu 22.04 Docker VPS
    - docker run -it --privileged --cap-add=ALL ubuntu-vps
