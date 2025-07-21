# Image de base légère avec Java 17
FROM eclipse-temurin:17-jre-alpine

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} /app.jar

# Exposer le port 8080
EXPOSE 8080

# Commande de démarrage
ENTRYPOINT ["java", "--add-opens=java.base/java.lang=ALL-UNNAMED", "--add-opens=java.base/java.lang.reflect=ALL-UNNAMED", "-jar", "/app.jar"]


