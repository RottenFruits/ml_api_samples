FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y python3.7 python3-distutils curl

RUN curl https://bootstrap.pypa.io/get-pip.py get-pip.py | python3.7

RUN pip install Flask &&\
    pip install scikit-learn

COPY src/ /home/src

WORKDIR /home/src/app

EXPOSE 5000