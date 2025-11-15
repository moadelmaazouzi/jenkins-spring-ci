# ---- Étape 1 : Build Maven ----
FROM maven:3.9.9-eclipse-temurin-21 AS build

# Répertoire de travail
WORKDIR /app

# Copier le fichier pom.xml pour télécharger les dépendances
COPY pom.xml .

# Télécharger les dépendances pour accélérer le build
RUN mvn dependency:go-offline -B

# Copier le code source
COPY src ./src

# Compiler le projet et générer le JAR
RUN mvn clean package -DskipTests

# ---- Étape 2 : Image finale ----
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copier le JAR depuis l'étape de build
COPY --from=build /app/target/*.jar app.jar

# Exposer le port
EXPOSE 8080

# Démarrer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
