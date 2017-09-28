# docker-sdr

A docker-compose project for launching the DLSS SDR ecosystem.

## Running

```
$ docker-compose build
# initialize databases, solr collections, etc
$ ./setup.sh
# launching the whole ecosystem:
$ docker-compose up
# or launching only some components
# $ docker-compose up stacks
```
