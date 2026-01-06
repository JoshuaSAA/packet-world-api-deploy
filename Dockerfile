# ---------- BUILD ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Clona la rama correcta del repo público
RUN git clone --branch joshua https://github.com/YisusSlap/packet-world.git .

WORKDIR /app/backend/PacketWorldAPI

RUN mvn clean package -DskipTests

# ---------- RUNTIME ----------
FROM tomcat:9-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/backend/PacketWorldAPI/target/PacketWorldAPI.war \
/usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
