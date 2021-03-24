#!/bin/bash
# YOUR_JUST_ONCE_LOGIC_HERE
if [ ! -e "Gemfile" ]; then
  bundle init && \
  echo "gem 'rails', '~> 6.0', '>= 6.1.3'" >> Gemfile 
fi

CONTAINER_ALREADY_STARTED="config.ru"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then  
  echo "-- First container startup --"
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
