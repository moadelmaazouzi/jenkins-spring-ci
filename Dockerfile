# Stage 1: Build the Spring Boot application
# FROM maven:3.8.7-jdk-21 AS build
#WORKDIR /app
#COPY pom.xml .
#COPY src ./src
#RUN mvn clean package -DskipTests

# Stage 2: Create the final runtime image
#FROM openjdk:21-jre-slim
#WORKDIR /app
#COPY --from=build /app/target/*.jar app.jar
#EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "app.jar"]



# Image de base avec Java 21
FROM eclipse-temurin:21-jre

# Répertoire de travail
WORKDIR /app

# Copier ton JAR compilé depuis ton machine vers le conteneur
COPY target/*.jar app.jar

# Exposer le port de ton application
EXPOSE 8080

# Démarrer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
