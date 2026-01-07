# Usamos Tomcat 9 con Java 8 (compatible con tu proyecto)
FROM tomcat:9.0-jre8-alpine

# Limpiamos las apps por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos el WAR que pusiste en la raíz
# Al llamarse ROOT.war, la app cargará en midominio.up.railway.app/ sin subcarpetas
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Exponemos el puerto
EXPOSE 8080

# Arrancamos Tomcat
CMD ["catalina.sh", "run"]