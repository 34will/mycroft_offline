FROM ubuntu:18.04

ARG SELENEAPP

# https://github.com/MycroftAI/selene-backend
RUN apt-get update && \
  apt-get install -y python3.7 python python3-pip git python3.7-dev && \
  mkdir -p /opt/selene && \
  mkdir -p /opt/selene/data && \
  mkdir -p /var/log/mycroft && \
  python3.7 -m pip install pipenv

WORKDIR /opt/selene
RUN git clone https://github.com/MycroftAI/selene-backend.git

  # https://github.com/MycroftAI/selene-backend/issues/201
RUN mkdir -p /opt/selene/documentation/_pages && \
  cd /opt/selene/documentation/_pages && \
  printf "%s\n%s\n" '---' '---' > embed-privacy-policy.md && \
  printf "%s\n%s\n" '---' '---' > embed-terms-of-use.md

# db sso account market public
RUN bash -c 'export LANG=en; cd /opt/selene/selene-backend/; if [ ! "$SELENEAPP" == "db" ]; then cd api/; fi; cd $SELENEAPP; pipenv install;'
