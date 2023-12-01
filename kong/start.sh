docker image ls

docker-compose up -d kong-db

docker-compose up -d kong

docker-compose run --rm kong kong migrations bootstrap

docker-compose up -d konga

docker-compose run --rm kong kong migrations up