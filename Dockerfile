FROM tomcat:8.0-alpine

LABEL maintainer="abc@testing.com"

WORKDIR /opt/tomcat/webapps
COPY target/vprofile-v1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
