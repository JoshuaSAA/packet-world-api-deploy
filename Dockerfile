FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app
COPY backend/PacketWorldAPI ./PacketWorldAPI
WORKDIR /app/PacketWorldAPI

RUN mvn clean package -DskipTests

# -------------------------

FROM tomcat:9-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/PacketWorldAPI/target/PacketWorldAPI.war \
/usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
