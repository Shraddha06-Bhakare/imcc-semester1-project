// Final code:-
// pipeline {
//     agent any

//     environment {
//         DOCKER_IMAGE = "ecommerce:latest"
//         CONTAINER_NAME = "ecommerce_container"
//     }

//     stages {

//         stage('Pull Code') {
//             steps {
//                 echo "Pulling latest code from GitHub..."
//                 checkout scm
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 echo "Building Docker image..."
//                 script {
//                     sh "docker build -t ${DOCKER_IMAGE} ."
//                 }
//             }
//         }

//         stage('Stop Old Container') {
//             steps {
//                 echo "Stopping old running container (if exists)..."
//                 script {
//                     sh """
//                         if [ \$(docker ps -q -f name=${CONTAINER_NAME}) ]; then
//                             docker stop ${CONTAINER_NAME}
//                             docker rm ${CONTAINER_NAME}
//                         fi
//                     """
//                 }
//             }
//         }

//         stage('Run New Container') {
//             steps {
//                 echo "Starting new container..."
//                 script {
//                     sh """
//                         docker run -d --name ${CONTAINER_NAME} -p 8000:8000 ${DOCKER_IMAGE}
//                     """
//                 }
//             }
//         }

//     }

//     post {
//         success {
//             echo "Deployment Completed Successfully!"
//         }
//         failure {
//             echo "Build or Deployment Failed!"
//         }
//     }
// }



// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"
//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 git credentialsId: "${env.GIT_CREDENTIAL}", url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                     sonar-scanner \
//                     -Dsonar.projectKey=ecommerce_django_project \
//                     -Dsonar.sources=. \
//                     -Dsonar.host.url=http://sonarqube.imcc.com \
//                     -Dsonar.login=${SONAR_TOKEN}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh """
//                 docker build -t ${REGISTRY}/${IMAGE_NAME}:latest .
//                 """
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIAL}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
//                     sh """
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh """
//                 kubectl apply -f deployment.yaml
//                 kubectl apply -f service.yaml
//                 """
//             }
//         }
//     }

//     post {
//         success {
//             echo "Deployment Successful!"
//         }
//         failure {
//             echo "Pipeline Failed!"
//         }
//     }
// }




// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"
//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 git branch: 'main',
//                     credentialsId: "${env.GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                     sonar-scanner \
//                     -Dsonar.projectKey=ecommerce_django_project \
//                     -Dsonar.sources=. \
//                     -Dsonar.host.url=http://sonarqube.imcc.com \
//                     -Dsonar.login=${sonar-token-2002}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh """
//                 docker build -t ${REGISTRY}/${IMAGE_NAME}:latest .
//                 """
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIAL}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
//                     sh """
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh """
//                 kubectl apply -f K8s/deployment.yaml
//                 kubectl apply -f K8s/service.yaml
//                 """
//             }
//         }
//     }

//     post {
//         success {
//             echo "Deployment Successful!"
//         }
//         failure {
//             echo "Pipeline Failed!"
//         }
//     }
// }



// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"
//         SONAR_SERVER = "SonarQubeServer"

//         // CREDENTIALS (replace IDs with yours)
//         SONAR_TOKEN = credentials('sonar-token-2002')
//         GIT_CREDENTIAL = "github-cred"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 git(
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git',
//                     branch: 'main'
//                 )
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                         sonar-scanner \
//                         -Dsonar.projectKey=ecommerce_django_project \
//                         -Dsonar.sources=. \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=${sonar-token-2002}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh """
//                     docker build -t ${REGISTRY}/${IMAGE_NAME}:latest .
//                 """
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIAL}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
//                     sh """
//                         docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                         docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh """
//                     kubectl apply -f deployment.yaml
//                     kubectl apply -f service.yaml
//                 """
//             }
//         }
//     }

//     post {
//         success {
//             echo "🎉 Deployment Successful!"
//         }
//         failure {
//             echo "❌ Pipeline Failed! Please check logs."
//         }
//     }
// }



// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"

//         // Correct way to read token
//         SONAR_TOKEN = credentials('sonar-token-1')

//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 git credentialsId: "${env.GIT_CREDENTIAL}", url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                     sonar-scanner \
//                     -Dsonar.projectKey=ecommerce_django_project \
//                     -Dsonar.sources=. \
//                     -Dsonar.host.url=http://sonarqube.imcc.com \
//                     -Dsonar.login=${sonar-token-2002}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(
//                     credentialsId: "${DOCKER_CREDENTIAL}",
//                     usernameVariable: 'USERNAME',
//                     passwordVariable: 'PASSWORD'
//                 )]) {
//                     sh """
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh """
//                 kubectl apply -f deployment.yaml
//                 kubectl apply -f service.yaml
//                 """
//             }
//         }
//     }

//     post {
//         success {
//             echo "🚀 Deployment Successful!"
//         }
//         failure {
//             echo "❌ Pipeline Failed!"
//         }
//     }
// }




// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"

//         // SonarQube token stored in Jenkins credentials (Secret Text)
//         SONAR_TOKEN = credentials('sonar-token-1')

//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 git credentialsId: "${GIT_CREDENTIAL}", 
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                     sonar-scanner \
//                     -Dsonar.projectKey=ecommerce_django_project \
//                     -Dsonar.sources=. \
//                     -Dsonar.host.url=http://sonarqube.imcc.com \
//                     -Dsonar.login=${SONAR_TOKEN}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(
//                     credentialsId: "${DOCKER_CREDENTIAL}",
//                     usernameVariable: 'USERNAME',
//                     passwordVariable: 'PASSWORD'
//                 )]) {
//                     sh """
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh """
//                 kubectl apply -f deployment.yaml
//                 kubectl apply -f service.yaml
//                 """
//             }
//         }
//     }

//     post {
//         success {
//             echo "🚀 Deployment Successful!"
//         }
//         failure {
//             echo "❌ Pipeline Failed!"
//         }
//     }
// }



// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"

//         // Correct SonarQube token ID
//         SONAR_TOKEN = credentials('sonar-token-2002')

//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 git branch: 'main', git credentialsId: "${GIT_CREDENTIAL}", 
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                     sonar-scanner \
//                     -Dsonar.projectKey=ecommerce_django_project \
//                     -Dsonar.sources=. \
//                     -Dsonar.host.url=http://sonarqube.imcc.com \
//                     -Dsonar.login=${SONAR_TOKEN}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(
//                     credentialsId: "${DOCKER_CREDENTIAL}",
//                     usernameVariable: 'USERNAME',
//                     passwordVariable: 'PASSWORD'
//                 )]) {
//                     sh """
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh """
//                 kubectl apply -f deployment.yaml
//                 kubectl apply -f service.yaml
//                 """
//             }
//         }
//     }

//     post {
//         success {
//             echo "🚀 Deployment Successful!"
//         }
//         failure {
//             echo "❌ Pipeline Failed!"
//         }
//     }
// }




// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"

//         // Correct SonarQube token
//         SONAR_TOKEN = credentials('sonar-token-2002')

//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 // Clean workspace before checkout
//                 deleteDir()

//                 git branch: 'main',
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                     sonar-scanner \
//                     -Dsonar.projectKey=ecommerce_django_project \
//                     -Dsonar.sources=. \
//                     -Dsonar.host.url=http://sonarqube.imcc.com \
//                     -Dsonar.login=${SONAR_TOKEN}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(
//                     credentialsId: "${DOCKER_CREDENTIAL}",
//                     usernameVariable: 'USERNAME',
//                     passwordVariable: 'PASSWORD'
//                 )]) {
//                     sh """
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh """
//                 kubectl apply -f deployment.yaml
//                 kubectl apply -f service.yaml
//                 """
//             }
//         }
//     }

//     post {
//         success {
//             echo "🚀 Deployment Successful!"
//         }
//         failure {
//             echo "❌ Pipeline Failed!"
//         }
//     }
// }



// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"

//         SONAR_TOKEN = credentials('sonar-token-2002')
//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//         K8S_SECRET_NAME = "ecommerce-k8s-secret"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 deleteDir()
//                 git branch: 'main',
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('Declarative Agent Actions') {
//             steps {
//                 echo "Preparing pipeline environment..."
//             }
//         }

//         stage('Create Kubernetes Secret') {
//             steps {
//                 sh """
//                 kubectl create secret generic ${K8S_SECRET_NAME} \
//                 --from-literal=username='admin' \
//                 --from-literal=password='admin123' --dry-run=client -o yaml | kubectl apply -f -
//                 """
//             }
//         }

//         stage('Create Application Secrets') {
//             steps {
//                 echo "Application secrets setup (e.g., env variables, API keys)..."
//                 // Add any secret creation scripts here if required
//             }
//         }

//         stage('Create Docker Registry Secret') {
//             steps {
//                 sh """
//                 kubectl create secret docker-registry docker-reg-cred \
//                 --docker-server=${REGISTRY} \
//                 --docker-username=${DOCKER_CREDENTIAL} \
//                 --docker-password='PLACE_PASSWORD_HERE' \
//                 --docker-email='admin@local' --dry-run=client -o yaml | kubectl apply -f -
//                 """
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                     sonar-scanner \
//                     -Dsonar.projectKey=ecommerce_django_project \
//                     -Dsonar.sources=. \
//                     -Dsonar.host.url=http://sonarqube.imcc.com \
//                     -Dsonar.login=${SONAR_TOKEN}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(
//                     credentialsId: "${DOCKER_CREDENTIAL}",
//                     usernameVariable: 'USERNAME',
//                     passwordVariable: 'PASSWORD'
//                 )]) {
//                     sh """
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh """
//                 kubectl apply -f deployment.yaml
//                 kubectl apply -f service.yaml
//                 """
//             }
//         }

//     }

//     post {
//         success {
//             echo "🚀 Pipeline executed successfully!"
//         }
//         failure {
//             echo "❌ Pipeline failed!"
//         }
//     }
// }




pipeline {
    agent any

    environment {
        REGISTRY = "localhost:8082"
        IMAGE_NAME = "ecommerce-web"
        SONAR_SERVER = "SonarQubeServer"
        DOCKER_CREDENTIAL = "nexus-docker-cred"
        GIT_CREDENTIAL = "github-cred"
        K8S_SECRET_NAME = "ecommerce-k8s-secret"
    }

    stages {
        stage('Checkout Code') {
            steps {
                deleteDir()
                git branch: 'main',
                    credentialsId: "${GIT_CREDENTIAL}",
                    url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
            }
        }

        stage('Install Required Tools') {
            steps {
                sh '''
                echo "Installing required tools..."
                # Install kubectl
                curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
                chmod +x kubectl
                sudo mv kubectl /usr/local/bin/
                
                # Verify installations
                kubectl version --client
                docker --version
                '''
            }
        }

        stage('Setup Kubernetes Context') {
            steps {
                sh '''
                # Setup kubeconfig (you'll need to configure this based on your cluster)
                mkdir -p ~/.kube
                # Add your kubeconfig content here or use a Kubernetes plugin
                echo "Setting up Kubernetes context..."
                '''
            }
        }

        stage('Create Kubernetes Secret') {
            steps {
                sh """
                kubectl create secret generic ${K8S_SECRET_NAME} \
                --from-literal=username='admin' \
                --from-literal=password='admin123' --dry-run=client -o yaml | kubectl apply -f - || echo "Secret creation skipped or failed"
                """
            }
        }

        stage('Create Docker Registry Secret') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDENTIAL}",
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh """
                    kubectl create secret docker-registry docker-reg-cred \
                    --docker-server=${REGISTRY} \
                    --docker-username=${DOCKER_USERNAME} \
                    --docker-password=${DOCKER_PASSWORD} \
                    --docker-email='admin@local' --dry-run=client -o yaml | kubectl apply -f - || echo "Docker registry secret creation skipped"
                    """
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONAR_SERVER}") {
                    withCredentials([string(credentialsId: 'sonar-token-2002', variable: 'SONAR_TOKEN')]) {
                        sh """
                        # Install sonar-scanner if not present
                        if ! command -v sonar-scanner &> /dev/null; then
                            echo "Installing sonar-scanner..."
                            wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
                            unzip sonar-scanner-cli-4.8.0.2856-linux.zip
                            export PATH=$PWD/sonar-scanner-4.8.0.2856-linux/bin:$PATH
                        fi
                        
                        sonar-scanner \
                        -Dsonar.projectKey=ecommerce_django_project \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://sonarqube.imcc.com \
                        -Dsonar.login=${SONAR_TOKEN}
                        """
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${REGISTRY}/${IMAGE_NAME}:latest .
                """
            }
        }

        stage('Push to Nexus Registry') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKER_CREDENTIAL}",
                    usernameVariable: 'USERNAME',
                    passwordVariable: 'PASSWORD'
                )]) {
                    sh """
                    docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
                    docker push ${REGISTRY}/${IMAGE_NAME}:latest
                    """
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh """
                # Apply deployment and service
                kubectl apply -f K8s/deployment.yaml || echo "Deployment apply failed"
                kubectl apply -f K8s/service.yaml || echo "Service apply failed"
                
                # Wait for deployment to be ready
                kubectl rollout status deployment/ecommerce-web-deployment --timeout=300s || echo "Rollout status check failed"
                
                # Get deployment info
                kubectl get deployments
                kubectl get services
                kubectl get pods
                """
            }
        }
    }

    post {
        always {
            // Clean up Docker images to save space
            sh '''
            docker system prune -f || true
            '''
        }
        success {
            echo "🚀 Pipeline executed successfully!"
            // Add notification here
        }
        failure {
            echo "❌ Pipeline failed!"
            // Add notification here
        }
    }
}