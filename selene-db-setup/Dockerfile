FROM selene-backend:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql wget && \
  wget -O /opt/selene/countryInfo.txt http://download.geonames.org/export/dump/countryInfo.txt && \
  wget -O /opt/selene/timeZones.txt http://download.geonames.org/export/dump/timeZones.txt && \
  wget -O /opt/selene/admin1CodesASCII.txt http://download.geonames.org/export/dump/admin1CodesASCII.txt && \
  wget -O /opt/selene/cities500.zip http://download.geonames.org/export/dump/cities500.zip && \
  /opt/pipenv-install.sh /opt/selene/selene-backend/db

ENV DB_PORT=5432

ADD wait-for-postgres.sh /opt/wait-for-postgres.sh
ADD postgres-user.sh /opt/postgres-user.sh
ADD bootstrap-db.sh /opt/bootstrap-db.sh

RUN chmod +x /opt/wait-for-postgres.sh && \
  chmod +x /opt/postgres-user.sh && \
  chmod +x /opt/bootstrap-db.sh && \
  # https://github.com/MycroftAI/selene-backend/issues/227
  rm /opt/selene/selene-backend/db/mycroft/drop_roles.sql && \
  echo "SELECT * FROM pg_user" >> /opt/selene/selene-backend/db/mycroft/drop_roles.sql && \
  rm /opt/selene/selene-backend/db/mycroft/create_roles.sql && \
  echo "SELECT * FROM pg_user" >> /opt/selene/selene-backend/db/mycroft/create_roles.sql && \
  # https://github.com/MycroftAI/selene-backend/issues/201
  mkdir -p /opt/mycroft/devops/agreements && \
  cd /opt/mycroft/devops/agreements && \
  printf "%s\n%s\n" '---' '---' > privacy_policy.md && \
  printf "%s\n%s\n" '---' '---' > terms_of_use.md

CMD [ "bash", "-c", "/opt/wait-for-postgres.sh $DB_HOST $DB_PORT bash -c \"DB_PASSWORD=$DB_PASSWORD /opt/postgres-user.sh $DB_HOST $DB_PORT $DB_PASSWORD && /opt/bootstrap-db.sh && echo 'done'\"" ]
