FROM selene-backend:latest

ENV SKILLSVERSION=21.02

ADD skills-install.sh /opt/skills-install.sh

RUN /opt/pipenv-install.sh /opt/selene/selene-backend/batch && \
    chmod +x /opt/skills-install.sh

CMD [ "bash", "-c", "/opt/skills-install.sh $SKILLSVERSION" ]
