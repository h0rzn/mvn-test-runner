FROM eclipse-temurin:21-jdk-alpine
# FROM maven:3.9.0-eclipse-temurin-11-alpine

VOLUME /opt/project_source

# RUN apk add --no-cache git
RUN apk add --no-cache maven

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY checkout-pr.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/checkout-pr.sh


WORKDIR /opt/project_source
# RUN checkout-pr.sh

ENTRYPOINT ["entrypoint.sh"]
#
# EXPOSE 5000


