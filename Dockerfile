# Juste Java JDK pour exécuter le .jar
FROM eclipse-temurin:21-jdk
WORKDIR /app

# Copie du .jar déjà présent dans le repo
COPY target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
