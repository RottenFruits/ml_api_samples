docker-compose up -d

curl http://ml_api_python:5000/predict -X POST -H 'Content-Type:application/json' -d '{"feature":[1, 1, 1, 1]}'

