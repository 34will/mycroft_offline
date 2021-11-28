FROM selene-backend:latest

ARG SELENEAPPDIR
ARG FILECHECK
ENV _SELENEAPPDIR=$SELENEAPPDIR
ENV _FILECHECK=$FILECHECK

ADD start.sh /opt/start.sh

RUN chmod +x /opt/start.sh && \
    /opt/pipenv-install.sh $SELENEAPPDIR

CMD [ "bash", "-c", "/opt/start.sh $_FILECHECK $_SELENEAPPDIR $APP_PORT" ]
