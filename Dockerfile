
FROM ruby:3.0.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update -qq && \
    apt upgrade -y && \
    apt install sudo vim nodejs yarn -y && \
    mkdir -p /sample_app &&\
    gem install bundler

ARG APP_ROOT=/sample_app

WORKDIR $APP_ROOT
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
