FROM tomcat:latest
COPY target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps
RUN sed -i 's/port="8080"/port="8082"/g' /usr/local/tomcat/conf/server.xml
EXPOSE 8082
CMD ["catalina.sh","run"]
