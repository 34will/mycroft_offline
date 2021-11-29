FROM ubuntu:18.04 as build

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y npm git curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    git clone https://github.com/MycroftAI/selene-ui.git

WORKDIR selene-ui

RUN npm install

WORKDIR projects

RUN npx ng build --project shared && \
    npx ng build --project globalnav

ARG APPNAME

RUN npx ng build --project $APPNAME --prod

FROM nginx:latest

ARG APPNAME

ENV ACCOUNT_URL="account.mycroft.ai"
ENV MARKET_URL="market.mycroft.ai"
ENV SSO_URL="sso.mycroft.ai"

ADD replace-domain.sh /opt/replace-domain.sh

RUN rm -rf /etc/nginx/conf.d/default.conf && \
    chmod +x /opt/replace-domain.sh && \
    rm -f /usr/share/nginx/html/*

ADD ui-app-nginx.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s+/usr/share/nginx/html+/usr/share/nginx/html/${APPNAME}+g" /etc/nginx/conf.d/default.conf && \
    cat /etc/nginx/conf.d/default.conf

COPY --from=build /usr/src/app/selene-ui/dist /usr/share/nginx/html

CMD [ "bash", "-c", "/opt/replace-domain.sh $ACCOUNT_URL $MARKET_URL $SSO_URL && nginx -g 'daemon off;'" ]
