FROM ubuntu:18.04

ADD wait-for-postgres.sh /opt/wait-for-postgres.sh

# https://github.com/MycroftAI/selene-backend
RUN apt-get update && \
  apt-get install -y python3.7 python python3-pip git wget && \
  mkdir -p /opt/selene && \
  mkdir -p /opt/selene/data && \
  mkdir -p /var/log/mycroft && \
  python3.7 -m pip install pipenv

WORKDIR /opt/selene
RUN git clone https://github.com/MycroftAI/selene-backend.git

RUN wget -O /opt/selene/countryInfo.txt http://download.geonames.org/export/dump/countryInfo.txt && \
  wget -O /opt/selene/timeZones.txt http://download.geonames.org/export/dump/timeZones.txt && \
  wget -O /opt/selene/admin1CodesASCII.txt http://download.geonames.org/export/dump/admin1CodesASCII.txt && \
  wget -O /opt/selene/cities500.zip http://download.geonames.org/export/dump/cities500.zip && \
  chmod +x /opt/wait-for-postgres.sh && \
  # https://github.com/MycroftAI/selene-backend/issues/201
  mkdir -p /opt/selene/documentation/_pages && \
  cd /opt/selene/documentation/_pages && \
  printf "%s\n%s\n" '---' '---' > embed-privacy-policy.md && \
  printf "%s\n%s\n" '---' '---' > embed-terms-of-use.md

WORKDIR /opt/selene/selene-backend/db
RUN pipenv install

RUN bash -c 'export LANG=en; cd /opt/selene/selene-backend/api; for dir in sso account market public; do pushd $dir; pipenv install; popd; done'
