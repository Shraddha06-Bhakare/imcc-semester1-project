pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "ecommerce:latest"
        CONTAINER_NAME = "ecommerce_container"
    }

    stages {

        stage('Pull Code') {
            steps {
                echo "Pulling latest code from GitHub..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Stop Old Container') {
            steps {
                echo "Stopping old running container (if exists)..."
                script {
                    sh """
                        if [ \$(docker ps -q -f name=${CONTAINER_NAME}) ]; then
                            docker stop ${CONTAINER_NAME}
                            docker rm ${CONTAINER_NAME}
                        fi
                    """
                }
            }
        }

        stage('Run New Container') {
            steps {
                echo "Starting new container..."
                script {
                    sh """
                        docker run -d --name ${CONTAINER_NAME} -p 8000:8000 ${DOCKER_IMAGE}
                    """
                }
            }
        }

    }

    post {
        success {
            echo "Deployment Completed Successfully!"
        }
        failure {
            echo "Build or Deployment Failed!"
        }
    }
}
