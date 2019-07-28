docker-compose up -d

curl http://ml_api_python:5000/predict -X POST -H 'Content-Type:application/json' -d '{"feature":[1, 1, 1, 1]}'



docker-compose stop
docker-compose rm -f
docker-compose build
docker-compose up -d



cd src
go run server.go

