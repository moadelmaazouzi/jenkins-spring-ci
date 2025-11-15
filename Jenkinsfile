pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/moadelmaazouzi/jenkins-spring-ci.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                    echo "Build de l'image Docker..."
                    docker build -t test-image:latest .
                """
            }
        }

         stage('Push Docker Image') {
                    steps {
                        sh """
                            echo "Push de l'image Docker..."

                            docker images
                            docker rm -f spring-app

                            docker run -d -p 9091:8080 --name spring-app test-image:latest
                            docker ps

                        """
                    }
                }
    }

    post {
        always {
            echo "Pipeline terminé."
        }
    }
}
