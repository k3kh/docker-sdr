FROM mkroli/karaf:4.1

WORKDIR /opt/karaf
RUN bin/start && \
  #allow the Karaf process to start
  sleep 10 && \
  #install camel repo url and version
  bin/client feature:repo-add camel 2.19.3 && \
  #allow feature url installation to complete
  sleep 5 && \
  #install camel core
  bin/client feature:install camel && \
  bin/client feature:install camel-blueprint && \
  bin/client feature:install camel-http4 && \
  bin/client feature:install camel-netty4 && \
  bin/client feature:install camel-jmx && \
  bin/client feature:install camel-metrics
RUN sleep 10
RUN bin/start && \
  #allow the Karaf process to start
  sleep 10 && \
  #install camel repo url and version
  bin/client feature:repo-add activemq 5.15.0 && \
  #allow feature url installation to complete
  sleep 5 && \
  #install camel core
  bin/client feature:install activemq && \
  bin/client feature:install activemq-broker && \
  bin/client feature:install activemq-camel
RUN sleep 10
RUN bin/start && \
  #allow the Karaf process to start
  sleep 10 && \
  #install hawtio repo url and version
  bin/client feature:repo-add hawtio 1.5.3 && \
  #allow feature url installation to complete
  sleep 5 && \
  #install hawtio
  bin/client feature:install hawtio

ADD activemq.xml /opt/karaf/etc/activemq.xml
