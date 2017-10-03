FROM phusion/passenger-ruby24:latest

MAINTAINER Chris Beer <cabeer@stanford.edu>

RUN apt-get update \
 && apt-get install -y tzdata \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/sul-dlss/robot-master.git /home/app/webapp
RUN chown -R app /home/app/webapp

WORKDIR /home/app/webapp
RUN bundle install
CMD bundle exec controller boot && bundle exec controller log
