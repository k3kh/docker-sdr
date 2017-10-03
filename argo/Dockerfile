FROM phusion/passenger-ruby24:latest

MAINTAINER Chris Beer <cabeer@stanford.edu>

RUN apt-get update \
 && apt-get install -y tzdata \
 && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/service/nginx/down

ADD secret_key.conf /etc/nginx/main.d/secret_key.conf
ADD postgres-env.conf /etc/nginx/main.d/postgres-env.conf
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN git clone https://github.com/sul-dlss/argo.git /home/app/webapp
RUN chown -R app /home/app/webapp
RUN rm /etc/nginx/sites-enabled/default

WORKDIR /home/app/webapp

## Local hacks

# Allow us to use the postgres database
RUN echo 'gem "pg"' >> Gemfile

# Under postgres: The limit on text can be at most 1GB - 1byte.
RUN rm db/migrate/20160318203331_increase_delayed_job_column.rb


RUN bundle install
RUN bundle exec rake assets:precompile SECRET_KEY=asdf
