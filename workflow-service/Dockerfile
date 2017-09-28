FROM phusion/passenger-ruby24:latest

MAINTAINER Chris Beer <cabeer@stanford.edu>

RUN apt-get update \
 && apt-get install -y tzdata \
 && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/service/nginx/down

ADD secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD postgres-env.conf /etc/nginx/main.d/postgres-env.conf
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD template.rb /tmp/template.rb

ENV PATH /usr/local/rvm/gems/ruby-2.4.1/bin:$PATH

RUN gem install rails -v "~> 5.1"
RUN rails new webapp -m /tmp/template.rb
# RUN rm /home/app/webapp/db/migrate/*
# RUN chown -R app /home/app/webapp
RUN rm /etc/nginx/sites-enabled/default

# WORKDIR /home/app/webapp
# RUN echo 'gem "pg"' >> Gemfile
# RUN bundle install
# RUN bundle exec rake assets:precompile SECRET_KEY_BASE=asdf
