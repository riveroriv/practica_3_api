docker build --rm -t productos -f Dockerfile .

clear

docker images

docker-compose stop
docker-compose down
docker-compose up -d
clear

docker-compose ps
