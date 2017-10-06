FROM phusion/passenger-ruby24:latest

MAINTAINER Chris Beer <cabeer@stanford.edu>

RUN apt-get update \
 && apt-get install -y tzdata \
 && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/service/nginx/down

ADD secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN git clone https://github.com/sul-dlss/dor_indexing_app.git /home/app/webapp
RUN chown -R app /home/app/webapp
RUN rm /etc/nginx/sites-enabled/default

WORKDIR /home/app/webapp
RUN bundle install
ADD config.rb /home/app/webapp/config/initializers/config.rb
RUN mv config/dor_config.rb config/initializers
RUN touch config/dor_config.rb
ADD settings.conf /etc/nginx/main.d/settings.conf
