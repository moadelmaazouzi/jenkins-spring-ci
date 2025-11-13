pipeline {
    agent {
        docker {
            image 'maven:3.9.4-eclipse-temurin-21'  // Maven + JDK 21
            args '-v $HOME/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

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
                sh 'mvn clean package -DskipTests'
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
