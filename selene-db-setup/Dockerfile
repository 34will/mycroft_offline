FROM selene-backend

ADD wait-for-postgres.sh /opt/wait-for-postgres.sh

ENV POSTGRES_PORT=5432

RUN apt-get install -y postgresql wget && \
  wget -O /opt/selene/countryInfo.txt http://download.geonames.org/export/dump/countryInfo.txt && \
  wget -O /opt/selene/timeZones.txt http://download.geonames.org/export/dump/timeZones.txt && \
  wget -O /opt/selene/admin1CodesASCII.txt http://download.geonames.org/export/dump/admin1CodesASCII.txt && \
  wget -O /opt/selene/cities500.zip http://download.geonames.org/export/dump/cities500.zip && \
  chmod +x /opt/wait-for-postgres.sh

WORKDIR /opt/selene/selene-backend/db
RUN bash -c 'export LANG=en; pipenv install'

CMD [ "/opt/wait-for-postgres.sh", "$POSTGRES_HOST", "$POSTGRES_PORT", "bash", "-c", "\"cd /opt/selene/selene-backend/db/scripts && pipenv run python -u bootstrap_mycroft_db.py && touch /shared/db_bootstrap_done\"" ]
