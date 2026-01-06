FROM tomcat:9-jdk8

# Limpia apps por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia la aplicación web ya construida
COPY PacketWorldAPI /usr/local/tomcat/webapps/ROOT

EXPOSE 8080

CMD ["catalina.sh", "run"]
