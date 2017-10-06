#!/bin/bash

docker-compose run suri rake db:create db:migrate
docker-compose run argo-web rake db:create db:migrate
docker-compose run hydrus rake db:create db:migrate
docker-compose run purl-fetcher rake db:create db:migrate
docker-compose run discovery-dispatcher rake db:create db:migrate
docker-compose run workflow-service rake db:create db:migrate

docker-compose up solr_config_loader
