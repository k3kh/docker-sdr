FROM phusion/passenger-ruby24:latest

MAINTAINER Chris Beer <cabeer@stanford.edu>

RUN apt-get update \
 && apt-get install -y tzdata \
 && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/service/nginx/down

ADD secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD postgres-env.conf /etc/nginx/main.d/postgres-env.conf
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN gem install rails
RUN rails new wfs -m https://raw.githubusercontent.com/sul-dlss/wfs_rails/761ca779a25ff7b03768794a64c5de7fe637d222/template.rb
RUN rm /home/app/webapp/db/migrate/*
RUN chown -R app /home/app/webapp
RUN rm /etc/nginx/sites-enabled/default

WORKDIR /home/app/webapp
RUN bundle install
RUN bundle exec rake assets:precompile SECRET_KEY_BASE=asdf
