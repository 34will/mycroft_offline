FROM nvidia/cuda:10.1-base

CMD nvidia-smi

RUN apt-get update && \
    apt-get install -y python3.7 python python3-pip git wget python3.7-dev && \
    pip3 install deepspeech-gpu && \
    pip3 install deepspeech-server && \
    wget https://github.com/mozilla/DeepSpeech/releases/download/v0.9.3/models_0.9.tar.gz && \
    tar xvfz models_0.9.tar.gz

WORKDIR models

ADD config.json config.json

CMD [ "deepspeech-server", "--config", "config.json" ]
