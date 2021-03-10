#!/bin/bash
CONTAINER_ALREADY_STARTED="config.ru"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then  
  echo "-- First container startup --"
  # YOUR_JUST_ONCE_LOGIC_HERE
  bundle init && \
  echo "gem 'rails', '~> 6.0', '>= 6.1.3'" >> Gemfile && \
  bundle install && \
  rails new . --force --database=mysql --skip-bundle --skip-webpack-install && \
  bundle install && \
  rails webpacker:install 
else
  echo "-- Not first container startup --"
  rm -f tmp/pids/serv.pid
  bundle install
  #/bin/bash
fi
