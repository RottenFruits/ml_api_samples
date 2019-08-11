
# ml api samples

This repository is a machine learning prediction ap samples for iris data by implementing python, R and Julia(todo).

## Installation

- clone.

```bash
git clone https://github.com/RottenFruits/ml_api_samples.git
```

- docker build and start.

```bash
cd ml_api_samples
docker-compose build
docker-compose up -d
```

## Usage

### Browser
- access server
   - http://0.0.0.0:8080/

- select api type
![p1](https://raw.githubusercontent.com/RottenFruits/ml_api_samples/master/png/p1.png)

- input data
![p2](https://raw.githubusercontent.com/RottenFruits/ml_api_samples/master/png/p2.png)

- submit, return result
![p3](https://raw.githubusercontent.com/RottenFruits/ml_api_samples/master/png/p3.png)

### Command line

```bash
curl http://0.0.0.0:5000/predict -X POST -H 'Content-Type:application/json' -d '{"feature":[1, 1, 1, 1]}'

curl http://0.0.0.0:6100/predict -X POST -H 'Content-Type:application/json' -d '{"feature":[1, 1, 1, 1]}'
```


## References

- [Python(Flask) でサクッと 機械学習 API を作る](https://qiita.com/fam_taro/items/1464c42324f15d7b8223])
- [Rのコードをweb APIに {plumber}](https://qiita.com/masaki_kubota/items/a5ccc6504a697c0e89f8)
