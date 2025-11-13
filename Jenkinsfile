pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhubCreds')
        IMAGE_NAME = "tonDockerUser/tonImage"
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/moadelmaazouzi/jenkins-spring-ci.git'
            }
        }

        stage('Build JAR') {
            steps {
                sh "docker run --rm -v $PWD:/app -v $HOME/.m2:/root/.m2 -w /app maven:3.9.4-eclipse-temurin-21 mvn clean package -DskipTests"
            }
        }

        stage('Build Docker image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
            }
        }

        stage('Push image') {
            steps {
                sh "docker push ${IMAGE_NAME}:latest"
            }
        }
    }
}
