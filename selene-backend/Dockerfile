FROM ubuntu:18.04

ENV DB_USER=selene
ENV DB_NAME=mycroft
ENV DB_PORT=5432
ENV SELENE_ENVIRONMENT=prod
ENV REDIS_PORT=6379

ADD pipenv-install.sh /opt/pipenv-install.sh
ADD wait-for-bootstrap.sh /opt/wait-for-bootstrap.sh
ADD common.sh /opt/common.sh

# https://github.com/MycroftAI/selene-backend
RUN apt-get update && \
  apt-get install -y python3.7 python python3-pip git python3.7-dev && \
  mkdir -p /opt/selene && \
  mkdir -p /opt/selene/data && \
  mkdir -p /var/log/mycroft && \
  python3.7 -m pip install pipenv && \
  chmod +x /opt/pipenv-install.sh && \
  chmod +x /opt/wait-for-bootstrap.sh && \
  chmod +x /opt/common.sh

WORKDIR /opt/selene
RUN git clone https://github.com/MycroftAI/selene-backend.git
