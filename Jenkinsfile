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




// pipeline {
//     agent any

//     environment {
//         REGISTRY = "localhost:8082"
//         IMAGE_NAME = "ecommerce-web"
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

//         stage('Install Required Tools') {
//             steps {
//                 sh '''
//                 echo "Installing required tools..."
//                 # Install kubectl
//                 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
//                 chmod +x kubectl
//                 sudo mv kubectl /usr/local/bin/
                
//                 # Verify installations
//                 kubectl version --client
//                 docker --version
//                 '''
//             }
//         }

//         stage('Setup Kubernetes Context') {
//             steps {
//                 sh '''
//                 # Setup kubeconfig (you'll need to configure this based on your cluster)
//                 mkdir -p ~/.kube
//                 # Add your kubeconfig content here or use a Kubernetes plugin
//                 echo "Setting up Kubernetes context..."
//                 '''
//             }
//         }

//         stage('Create Kubernetes Secret') {
//             steps {
//                 sh """
//                 kubectl create secret generic ${K8S_SECRET_NAME} \
//                 --from-literal=username='admin' \
//                 --from-literal=password='admin123' --dry-run=client -o yaml | kubectl apply -f - || echo "Secret creation skipped or failed"
//                 """
//             }
//         }

//         stage('Create Docker Registry Secret') {
//             steps {
//                 withCredentials([usernamePassword(
//                     credentialsId: "${DOCKER_CREDENTIAL}",
//                     usernameVariable: 'DOCKER_USERNAME',
//                     passwordVariable: 'DOCKER_PASSWORD'
//                 )]) {
//                     sh """
//                     kubectl create secret docker-registry docker-reg-cred \
//                     --docker-server=${REGISTRY} \
//                     --docker-username=${DOCKER_USERNAME} \
//                     --docker-password=${DOCKER_PASSWORD} \
//                     --docker-email='admin@local' --dry-run=client -o yaml | kubectl apply -f - || echo "Docker registry secret creation skipped"
//                     """
//                 }
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     withCredentials([string(credentialsId: 'sonar-token-2002', variable: 'SONAR_TOKEN')]) {
//                         sh """
//                         # Install sonar-scanner if not present
//                         if ! command -v sonar-scanner &> /dev/null; then
//                             echo "Installing sonar-scanner..."
//                             wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
//                             unzip sonar-scanner-cli-4.8.0.2856-linux.zip
//                             export PATH=$PWD/sonar-scanner-4.8.0.2856-linux/bin:$PATH
//                         fi
                        
//                         sonar-scanner \
//                         -Dsonar.projectKey=ecommerce_django_project \
//                         -Dsonar.sources=. \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=${SONAR_TOKEN}
//                         """
//                     }
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
//                 # Apply deployment and service
//                 kubectl apply -f K8s/deployment.yaml || echo "Deployment apply failed"
//                 kubectl apply -f K8s/service.yaml || echo "Service apply failed"
                
//                 # Wait for deployment to be ready
//                 kubectl rollout status deployment/ecommerce-web-deployment --timeout=300s || echo "Rollout status check failed"
                
//                 # Get deployment info
//                 kubectl get deployments
//                 kubectl get services
//                 kubectl get pods
//                 """
//             }
//         }
//     }

//     post {
//         always {
//             // Clean up Docker images to save space
//             sh '''
//             docker system prune -f || true
//             '''
//         }
//         success {
//             echo "🚀 Pipeline executed successfully!"
//             // Add notification here
//         }
//         failure {
//             echo "❌ Pipeline failed!"
//             // Add notification here
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
//                 deleteDir()
//                 git branch: 'main',
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('Install Required Tools') {
//             steps {
//                 sh '''
//                 echo "Installing required tools..."
//                 # Install kubectl without sudo
//                 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
//                 chmod +x kubectl
//                 mkdir -p $HOME/bin
//                 mv kubectl $HOME/bin/
//                 export PATH=$HOME/bin:$PATH
                
//                 # Verify installations
//                 echo "=== kubectl version ==="
//                 $HOME/bin/kubectl version --client
//                 '''
//             }
//         }

//         stage('Setup Kubernetes Context') {
//             steps {
//                 sh '''
//                 # Setup basic kubeconfig (you'll need to adjust this for your cluster)
//                 mkdir -p $HOME/.kube
//                 echo "Setting up Kubernetes context..."
//                 # Add your actual kubeconfig here or use Jenkins Kubernetes plugin
//                 '''
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     withCredentials([string(credentialsId: 'sonar-token-2002', variable: 'SONAR_TOKEN')]) {
//                         sh '''
//                         # Install sonar-scanner if not present
//                         if ! command -v sonar-scanner &> /dev/null; then
//                             echo "Installing sonar-scanner..."
//                             wget -q https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
//                             unzip -q sonar-scanner-cli-4.8.0.2856-linux.zip
//                             export PATH=$PWD/sonar-scanner-4.8.0.2856-linux/bin:$PATH
//                         fi
                        
//                         echo "=== Running SonarQube Analysis ==="
//                         sonar-scanner \
//                         -Dsonar.projectKey=ecommerce_django_project \
//                         -Dsonar.sources=. \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=${SONAR_TOKEN}
//                         '''
//                     }
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     // Use the Docker container that's available in the pod
//                     sh '''
//                     echo "=== Building Docker Image ==="
//                     cd /home/jenkins/agent/workspace/2401013_ecommerce
//                     docker build -t ${REGISTRY}/${IMAGE_NAME}:latest .
//                     '''
//                 }
//             }
//         }

//         stage('Push to Nexus Registry') {
//             steps {
//                 withCredentials([usernamePassword(
//                     credentialsId: "${DOCKER_CREDENTIAL}",
//                     usernameVariable: 'USERNAME',
//                     passwordVariable: 'PASSWORD'
//                 )]) {
//                     sh '''
//                     echo "=== Pushing to Nexus Registry ==="
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     '''
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh '''
//                 echo "=== Deploying to Kubernetes ==="
//                 export PATH=$HOME/bin:$PATH
                
//                 # Apply Kubernetes manifests
//                 kubectl apply -f K8s/deployment.yaml --validate=false
//                 kubectl apply -f K8s/service.yaml --validate=false
                
//                 # Check deployment status
//                 echo "=== Deployment Status ==="
//                 kubectl get deployments -o wide
//                 kubectl get services -o wide
//                 kubectl get pods -o wide
//                 '''
//             }
//         }
//     }

//     post {
//         always {
//             sh '''
//             echo "=== Cleaning up ==="
//             # Clean up Docker images
//             docker system prune -f || true
//             '''
//         }
//         success {
//             echo "🚀 Pipeline executed successfully!"
//         }
//         failure {
//             echo "❌ Pipeline failed!"
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
//                 deleteDir()
//                 git branch: 'main',
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('Install Required Tools') {
//             steps {
//                 sh '''
//                 echo "=== Installing Required Tools ==="
//                 # Install kubectl
//                 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
//                 chmod +x kubectl
//                 mkdir -p $HOME/bin
//                 mv kubectl $HOME/bin/
//                 export PATH=$HOME/bin:$PATH
                
//                 # Install wget for sonar-scanner
//                 apk add --no-cache wget unzip
                
//                 echo "=== Tool Versions ==="
//                 $HOME/bin/kubectl version --client
//                 '''
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     withCredentials([string(credentialsId: 'sonar-token-2002', variable: 'SONAR_TOKEN')]) {
//                         sh '''
//                         echo "=== Installing Sonar Scanner ==="
//                         # Install sonar-scanner using curl (since we now have wget)
//                         wget -q https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
//                         unzip -q sonar-scanner-cli-4.8.0.2856-linux.zip
//                         export PATH=$PWD/sonar-scanner-4.8.0.2856-linux/bin:$PATH
                        
//                         echo "=== Running SonarQube Analysis ==="
//                         sonar-scanner \
//                         -Dsonar.projectKey=ecommerce_django_project \
//                         -Dsonar.sources=. \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=${SONAR_TOKEN}
//                         '''
//                     }
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     // Use the Docker socket from the dind container
//                     sh '''
//                     echo "=== Building Docker Image ==="
//                     ls -la
//                     '''
                    
//                     // Build using Docker from the dind container
//                     sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//                 }
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
//                     echo "=== Pushing to Nexus Registry ==="
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 sh '''
//                 echo "=== Deploying to Kubernetes ==="
//                 export PATH=$HOME/bin:$PATH
                
//                 # For now, just show what we would deploy
//                 echo "Kubernetes deployment files:"
//                 ls -la K8s/ || echo "K8s directory not found"
                
//                 # Apply Kubernetes manifests if kubeconfig is configured
//                 kubectl apply -f K8s/deployment.yaml --validate=false || echo "Deployment failed - check kubeconfig"
//                 kubectl apply -f K8s/service.yaml --validate=false || echo "Service failed - check kubeconfig"
                
//                 echo "=== Kubernetes Resources ==="
//                 kubectl get deployments,services,pods || echo "Cannot connect to Kubernetes cluster"
//                 '''
//             }
//         }
//     }

//     post {
//         always {
//             sh '''
//             echo "=== Pipeline Completed ==="
//             '''
//         }
//         success {
//             echo "🚀 Pipeline executed successfully!"
//         }
//         failure {
//             echo "❌ Pipeline failed!"
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
//                 deleteDir()
//                 git branch: 'main',
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('Install Tools') {
//             steps {
//                 sh '''
//                 echo "=== Installing Required Tools ==="
//                 # Install necessary packages
//                 apk add --no-cache curl wget unzip
                
//                 # Install kubectl
//                 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
//                 chmod +x kubectl
//                 mkdir -p $HOME/bin
//                 mv kubectl $HOME/bin/
//                 export PATH=$HOME/bin:$PATH
//                 '''
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     withCredentials([string(credentialsId: 'sonar-token-2002', variable: 'SONAR_TOKEN')]) {
//                         sh '''
//                         echo "=== Setting up Sonar Scanner ==="
//                         # Download and setup sonar-scanner
//                         wget -q https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
//                         unzip -q sonar-scanner-cli-4.8.0.2856-linux.zip
                        
//                         echo "=== Running SonarQube Analysis ==="
//                         ./sonar-scanner-4.8.0.2856-linux/bin/sonar-scanner \
//                         -Dsonar.projectKey=ecommerce_django_project \
//                         -Dsonar.sources=. \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=${SONAR_TOKEN}
//                         '''
//                     }
//                 }
//             }
//         }

//         stage('Build and Push Docker Image') {
//             steps {
//                 script {
//                     echo "=== Building Docker Image ==="
                    
//                     // Check if we can access docker
//                     sh '''
//                     which docker || echo "Docker not in PATH"
//                     docker --version || echo "Cannot run docker commands"
//                     '''
                    
//                     // Build the image
//                     sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
                    
//                     // Push the image
//                     withCredentials([usernamePassword(
//                         credentialsId: "${DOCKER_CREDENTIAL}",
//                         usernameVariable: 'USERNAME',
//                         passwordVariable: 'PASSWORD'
//                     )]) {
//                         sh """
//                         docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                         docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                         """
//                     }
//                 }
//             }
//         }

//         stage('Kubernetes Deployment') {
//             steps {
//                 sh '''
//                 echo "=== Kubernetes Deployment ==="
//                 export PATH=$HOME/bin:$PATH
                
//                 # Check if we have kubeconfig
//                 kubectl cluster-info || echo "No kubeconfig configured"
                
//                 # Try to apply manifests
//                 if [ -f "K8s/deployment.yaml" ]; then
//                     kubectl apply -f K8s/deployment.yaml --validate=false
//                 else
//                     echo "deployment.yaml not found in K8s directory"
//                 fi
                
//                 if [ -f "K8s/service.yaml" ]; then
//                     kubectl apply -f K8s/service.yaml --validate=false
//                 else
//                     echo "service.yaml not found in K8s directory"
//                 fi
//                 '''
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
//                 deleteDir()
//                 git branch: 'main',
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('Install Basic Tools') {
//             steps {
//                 sh '''
//                 echo "=== Installing Basic Tools ==="
//                 apk add --no-cache curl wget unzip
//                 '''
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     withCredentials([string(credentialsId: 'sonar-token-2002', variable: 'SONAR_TOKEN')]) {
//                         sh '''
//                         echo "=== Running SonarQube Analysis ==="
//                         wget -q https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
//                         unzip -q sonar-scanner-cli-4.8.0.2856-linux.zip
//                         ./sonar-scanner-4.8.0.2856-linux/bin/sonar-scanner \
//                         -Dsonar.projectKey=ecommerce_django_project \
//                         -Dsonar.sources=. \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=${SONAR_TOKEN}
//                         '''
//                     }
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//             }
//         }

//         stage('Push Docker Image') {
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
//                 deleteDir()
//                 git branch: 'main',
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     withCredentials([string(credentialsId: 'sonar-token-2002', variable: 'SONAR_TOKEN')]) {
//                         sh '''
//                         echo "=== Running SonarQube Analysis ==="
//                         # Use curl which is usually available in Jenkins agents
//                         curl -L -o sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
                        
//                         # Try to extract using different methods
//                         which unzip && unzip -q sonar-scanner.zip || (which python3 && python3 -c "import zipfile; zipfile.ZipFile('sonar-scanner.zip').extractall()" || echo "Extraction method not available")
                        
//                         # Run sonar-scanner
//                         ./sonar-scanner-4.8.0.2856-linux/bin/sonar-scanner \
//                         -Dsonar.projectKey=ecommerce_django_project \
//                         -Dsonar.sources=. \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=${SONAR_TOKEN} || echo "SonarQube analysis completed"
//                         '''
//                     }
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//             }
//         }

//         stage('Push Docker Image') {
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
//                 deleteDir()
//                 git branch: 'main',
//                     credentialsId: "${GIT_CREDENTIAL}",
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project.git'
//             }
//         }

//         stage('Prepare Environment') {
//             steps {
//                 sh '''
//                 echo "=== Preparing Environment ==="
//                 pwd
//                 ls -la
//                 echo "Current directory structure:"
//                 find . -type f -name "*.py" | head -10
//                 '''
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     withCredentials([string(credentialsId: 'sonar-token-2002', variable: 'SONAR_TOKEN')]) {
//                         sh '''
//                         echo "=== Running SonarQube Analysis ==="
//                         # Download and setup sonar-scanner
//                         curl -L -o sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
                        
//                         # Install unzip and extract
//                         apt-get update && apt-get install -y unzip
//                         unzip -q sonar-scanner.zip
                        
//                         # Make sonar-scanner executable and run
//                         chmod +x sonar-scanner-4.8.0.2856-linux/bin/sonar-scanner
//                         chmod +x sonar-scanner-4.8.0.2856-linux/jre/bin/java
                        
//                         ./sonar-scanner-4.8.0.2856-linux/bin/sonar-scanner \
//                         -Dsonar.projectKey=ecommerce_django_project \
//                         -Dsonar.sources=. \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=${SONAR_TOKEN} || echo "SonarQube analysis completed with warnings"
//                         '''
//                     }
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     // Use the docker container specifically
//                     sh '''
//                     echo "=== Building Docker Image ==="
//                     which docker || echo "Docker not found in PATH"
//                     '''
                    
//                     // Build using docker from dind container
//                     sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:latest ."
//                 }
//             }
//         }

//         stage('Push Docker Image') {
//             steps {
//                 withCredentials([usernamePassword(
//                     credentialsId: "${DOCKER_CREDENTIAL}",
//                     usernameVariable: 'USERNAME',
//                     passwordVariable: 'PASSWORD'
//                 )]) {
//                     sh """
//                     echo "=== Pushing to Nexus Registry ==="
//                     docker login ${REGISTRY} -u $USERNAME -p $PASSWORD
//                     docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
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



//Final code:_
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




// pipeline {
//     agent any

//     environment {
//         REGISTRY = "nexus.imcc.com"
//         IMAGE_NAME = "ecommerce"
        
//         // Correct SonarQube token ID (your credential ID)
//         SONAR_TOKEN = credentials('sonar-token-2002')

//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 git branch: 'main',
//                     url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project',
//                     credentialsId: "${GIT_CREDENTIAL}"
//             }
//         }

//         stage('Install Dependencies') {
//             steps {
//                 sh 'npm install'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh """
//                     sonar-scanner \
//                       -Dsonar.projectKey=2401013_ecommerce \
//                       -Dsonar.sources=. \
//                       -Dsonar.host.url=http://sonarqube.imcc.com \
//                       -Dsonar.login=${SONAR_TOKEN}
//                     """
//                 }
//             }
//         }

//         stage('Quality Gate') {
//             steps {
//                 timeout(time: 2, unit: 'MINUTES') {
//                     waitForQualityGate abortPipeline: true
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     sh """
//                     docker build -t ${REGISTRY}/docker-hosted/${IMAGE_NAME}:latest .
//                     """
//                 }
//             }
//         }

//         stage('Login to Nexus Registry') {
//             steps {
//                 script {
//                     sh """
//                     echo $DOCKER_CREDENTIAL_PSW | docker login ${REGISTRY} -u $DOCKER_CREDENTIAL_USR --password-stdin
//                     """
//                 }
//             }
//         }

//         stage('Push Docker Image to Nexus') {
//             steps {
//                 script {
//                     sh """
//                     docker push ${REGISTRY}/docker-hosted/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }
//     }
// }



// pipeline {

//     agent {
//         docker {
//             image 'node:18-alpine'
//             args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
//         }
//     }

//     environment {
//         REGISTRY = "nexus.imcc.com"
//         IMAGE_NAME = "ecommerce"
//         SONAR_TOKEN = credentials('sonar-token-2002')
//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 git credentialsId: "${GIT_CREDENTIAL}",
//                     url: "https://github.com/Shraddha06-Bhakare/imcc-semester1-project",
//                     branch: "main"
//             }
//         }

//         stage('Install Dependencies') {
//             steps {
//                 sh 'npm install'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv("${SONAR_SERVER}") {
//                     sh '''
//                         npx sonar-scanner \
//                         -Dsonar.projectKey=2401013_ecommerce \
//                         -Dsonar.projectName=2401013_ecommerce \
//                         -Dsonar.sources=./ \
//                         -Dsonar.host.url=http://sonarqube.imcc.com \
//                         -Dsonar.login=$SONAR_TOKEN
//                     '''
//                 }
//             }
//         }

//         stage('Quality Gate') {
//             steps {
//                 timeout(time: 2, unit: 'MINUTES') {
//                     waitForQualityGate abortPipeline: true
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 sh """
//                     docker build -t ${REGISTRY}/docker-hosted/${IMAGE_NAME}:1.0 .
//                 """
//             }
//         }

//         stage('Login to Nexus Registry') {
//             steps {
//                 sh """
//                     echo "${DOCKER_CREDENTIAL_PSW}" | docker login ${REGISTRY} \
//                     -u "${DOCKER_CREDENTIAL_USR}" --password-stdin
//                 """
//             }
//         }

//         stage('Push Docker Image to Nexus') {
//             steps {
//                 sh """
//                     docker push ${REGISTRY}/docker-hosted/${IMAGE_NAME}:1.0
//                 """
//             }
//         }
//     }

//     post {
//         success {
//             echo "🎉 Pipeline executed successfully!"
//         }
//         failure {
//             echo "❌ Pipeline failed. Please check logs."
//         }
//     }
// }




// pipeline {

//     agent {
//         kubernetes {
//             yaml """
// apiVersion: v1
// kind: Pod
// metadata:
//   labels:
//     jenkins: slave
// spec:
//   containers:
//   - name: node
//     image: node:18
//     command:
//     - cat
//     tty: true
//     volumeMounts:
//     - mountPath: /home/jenkins/agent
//       name: workspace-volume

//   - name: docker
//     image: docker:24-dind
//     securityContext:
//       privileged: true
//     command:
//     - dockerd-entrypoint.sh
//     tty: true
//     volumeMounts:
//     - mountPath: /var/lib/docker
//       name: dind-storage

//   - name: docker-cli
//     image: docker:24-cli
//     command:
//     - cat
//     tty: true
//     volumeMounts:
//     - mountPath: /var/run
//       name: docker-sock

//   volumes:
//   - name: workspace-volume
//     emptyDir: {}
//   - name: dind-storage
//     emptyDir: {}
//   - name: docker-sock
//     emptyDir: {}
// """
//         }
//     }

//     environment {
//         REGISTRY = "nexus.imcc.com"
//         IMAGE_NAME = "ecommerce"
//         SONAR_TOKEN = credentials('sonar-token-2002')
//         SONAR_SERVER = "SonarQubeServer"
//         DOCKER_CREDENTIAL = "nexus-docker-cred"
//         GIT_CREDENTIAL = "github-cred"
//     }

//     stages {

//         stage('Checkout Code') {
//             steps {
//                 container('node') {
//                     git credentialsId: "${GIT_CREDENTIAL}",
//                         url: "https://github.com/Shraddha06-Bhakare/imcc-semester1-project",
//                         branch: "main"
//                 }
//             }
//         }

//         stage('Install Dependencies') {
//             steps {
//                 container('node') {
//                     sh "npm install"
//                 }
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 container('node') {
//                     withSonarQubeEnv("${SONAR_SERVER}") {
//                         sh """
//                           npx sonar-scanner \
//                           -Dsonar.projectKey=2401013_ecommerce \
//                           -Dsonar.sources=./ \
//                           -Dsonar.host.url=http://sonarqube.imcc.com \
//                           -Dsonar.login=$SONAR_TOKEN
//                         """
//                     }
//                 }
//             }
//         }

//         stage('Quality Gate') {
//             steps {
//                 timeout(time: 3, unit: 'MINUTES') {
//                     waitForQualityGate abortPipeline: true
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 container('docker-cli') {
//                     sh """
//                         docker build -t ${REGISTRY}/docker-hosted/${IMAGE_NAME}:1.0 .
//                     """
//                 }
//             }
//         }

//         stage('Push Image') {
//             steps {
//                 container('docker-cli') {
//                     sh """
//                         echo "${DOCKER_CREDENTIAL_PSW}" | docker login ${REGISTRY} \
//                           -u "${DOCKER_CREDENTIAL_USR}" --password-stdin
//                         docker push ${REGISTRY}/docker-hosted/${IMAGE_NAME}:1.0
//                     """
//                 }
//             }
//         }
//     }

//     post {
//         success {
//             echo "✔ Pipeline completed successfully!"
//         }
//         failure {
//             echo "❌ Pipeline failed!"
//         }
//     }
// }




// pipeline {
//     agent {
//         kubernetes {
//             yaml '''
// apiVersion: "v1"
// kind: "Pod"
// metadata:
//   labels:
//     jenkins: "slave"
// spec:
//   containers:
//   - name: node
//     image: node:18
//     command: ["cat"]
//     tty: true
//     volumeMounts:
//     - name: workspace-volume
//       mountPath: /home/jenkins/agent
//   - name: docker
//     image: docker:24-dind
//     command:
//     - "dockerd-entrypoint.sh"
//     securityContext:
//       privileged: true
//     tty: true
//     volumeMounts:
//     - name: dind-storage
//       mountPath: /var/lib/docker
//     - name: workspace-volume
//       mountPath: /home/jenkins/agent
//   - name: docker-cli
//     image: docker:24-cli
//     command: ["cat"]
//     tty: true
//     volumeMounts:
//     - name: docker-sock
//       mountPath: /var/run
//     - name: workspace-volume
//       mountPath: /home/jenkins/agent
//   - name: jnlp
//     image: jenkins/inbound-agent:latest
//     env:
//     - name: JENKINS_URL
//       value: http://my-jenkins.jenkins.svc.cluster.local:8080/
//     volumeMounts:
//     - name: workspace-volume
//       mountPath: /home/jenkins/agent
//   volumes:
//   - name: docker-sock
//     emptyDir: {}
//   - name: dind-storage
//     emptyDir: {}
//   - name: workspace-volume
//     emptyDir: {}
// '''
//         }
//     }

//     environment {
//         REGISTRY = "nexus.imcc.com/docker-hosted"
//         IMAGE_NAME = "ecommerce"
//     }

//     stages {
//         stage('Checkout Code') {
//             steps {
//                 container('node') {
//                     git url: 'https://github.com/Shraddha06-Bhakare/imcc-semester1-project',
//                         credentialsId: 'github-cred',
//                         branch: 'main'
//                 }
//             }
//         }

//         stage('Install Dependencies') {
//             steps {
//                 container('node') {
//                     dir('ecommerce') {      // FIXED
//                         sh 'npm install'
//                     }
//                 }
//             }
//         }

//         stage('SonarQube Analysis') {
//             environment {
//                 SONAR_SERVER = 'sonarqube'
//             }
//             steps {
//                 container('node') {
//                     withSonarQubeEnv("${SONAR_SERVER}") {
//                         dir('ecommerce') {  // FIXED
//                             sh '''
//                                 sonar-scanner \
//                                 -Dsonar.projectKey=2401013_ecommerce \
//                                 -Dsonar.sources=. \
//                                 -Dsonar.host.url=http://sonarqube.imcc.com/ \
//                                 -Dsonar.login=$SONAR_TOKEN
//                             '''
//                         }
//                     }
//                 }
//             }
//         }

//         stage('Quality Gate') {
//             steps {
//                 waitForQualityGate abortPipeline: false
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 container('docker-cli') {
//                     dir('ecommerce') {  // FIXED
//                         sh """
//                             docker build -t ${REGISTRY}/${IMAGE_NAME}:latest .
//                         """
//                     }
//                 }
//             }
//         }

//         stage('Push Image') {
//             steps {
//                 container('docker-cli') {
//                     sh """
//                         echo "$NEXUS_PASSWORD" | docker login ${REGISTRY} -u "$NEXUS_USERNAME" --password-stdin
//                         docker push ${REGISTRY}/${IMAGE_NAME}:latest
//                     """
//                 }
//             }
//         }
//     }

//     post {
//         failure {
//             echo "❌ Pipeline failed!"
//         }
//         success {
//             echo "✅ Pipeline executed successfully!"
//         }
//     }
// }



// pipeline {

//     agent {
//         kubernetes {
//             yaml '''
// apiVersion: v1
// kind: Pod
// metadata:
//   labels:
//     jenkins/label: "2401013-ecommerce-agent"
// spec:
//   restartPolicy: Never
//   nodeSelector:
//     kubernetes.io/os: "linux"

//   volumes:
//     - name: workspace-volume
//       emptyDir: {}
//     - name: kubeconfig-secret
//       secret:
//         secretName: kubeconfig-secret

//   containers:

//     - name: python
//       image: python:3.10
//       tty: true
//       command: ["cat"]
//       volumeMounts:
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent

//     - name: sonar-scanner
//       image: sonarsource/sonar-scanner-cli
//       tty: true
//       command: ["cat"]
//       volumeMounts:
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent

//     - name: kubectl
//       image: bitnami/kubectl:latest
//       tty: true
//       command: ["cat"]
//       env:
//         - name: KUBECONFIG
//           value: /kube/config
//       securityContext:
//         runAsUser: 0
//       volumeMounts:
//         - name: kubeconfig-secret
//           mountPath: /kube/config
//           subPath: kubeconfig
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent

//     - name: dind
//       image: docker:dind
//       args: ["--storage-driver=overlay2", "--insecure-registry=nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085"]
//       securityContext:
//         privileged: true
//       volumeMounts:
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent

//     - name: jnlp
//       image: jenkins/inbound-agent:latest
//       env:
//         - name: JENKINS_AGENT_NAME
//           value: "2401013-ecommerce-agent"
//         - name: JENKINS_AGENT_WORKDIR
//           value: "/home/jenkins/agent"
//       volumeMounts:
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent
// '''
//         }
//     }

//     environment {

//         // Namespace
//         NAMESPACE = '2401013'

//         // Nexus Docker Registry
//         REGISTRY  = 'nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085'
//         APP_NAME  = 'ecommerce'
//         IMAGE_TAG = 'latest'

//         BACKEND_IMAGE = "${REGISTRY}/${NAMESPACE}/${APP_NAME}-backend"

//         NEXUS_USER = 'student'
//         NEXUS_PASS = 'Changeme@2025'

//         // SonarQube
//         SONAR_PROJECT_KEY   = '2401013_ecommerce'
//         SONAR_HOST_URL      = 'http://sonarqube.imcc.com'
//         SONAR_PROJECT_TOKEN = 'sqp_d87fa2386ff55f6bf419f4fdf882d4db34a0edb4'
//     }

//     stages {

//         stage('Install Python Dependencies') {
//             steps {
//                 container('python') {
//                     sh """
//                     pip install --no-cache-dir -r requirements.txt
//                     """
//                 }
//             }
//         }

//         stage('Run SonarQube Analysis') {
//             steps {
//                 container('sonar-scanner') {
//                     sh """
//                     sonar-scanner \
//                       -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
//                       -Dsonar.sources=. \
//                       -Dsonar.host.url=${SONAR_HOST_URL} \
//                       -Dsonar.login=${SONAR_PROJECT_TOKEN}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 container('dind') {
//                     sh '''
//                     # Wait until Docker daemon is fully ready
//                     while ! docker info > /dev/null 2>&1; do 
//                         sleep 3
//                     done

//                     docker build -t ${BACKEND_IMAGE}:${IMAGE_TAG} -f ./Dockerfile .
//                     '''
//                 }
//             }
//         }

//         stage('Login to Nexus Registry') {
//             steps {
//                 container('dind') {
//                     sh """
//                     echo "$NEXUS_PASS" | docker login ${REGISTRY} -u "$NEXUS_USER" --password-stdin
//                     """
//                 }
//             }
//         }

//         stage('Push Docker Image to Nexus') {
//             steps {
//                 container('dind') {
//                     sh """
//                     docker push ${BACKEND_IMAGE}:${IMAGE_TAG}
//                     """
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 container('kubectl') {
//                     sh """
//                     kubectl apply -f K8s/deployment.yaml -n ${NAMESPACE}
//                     kubectl apply -f K8s/service.yaml -n ${NAMESPACE}

//                     kubectl set image deployment/ecommerce-deployment ecommerce=${BACKEND_IMAGE}:${IMAGE_TAG} -n ${NAMESPACE}

//                     kubectl rollout status deployment/ecommerce-deployment -n ${NAMESPACE}
//                     """
//                 }
//             }
//         }
//     }

//     post {
//         success { 
//             echo "✅ Deployment Successful for 2401013 eCommerce Project!" 
//         }
//         failure { 
//             echo "❌ Deployment Failed — Check Jenkins logs." 
//         }
//     }
// }




// pipeline {
//     agent {
//         kubernetes {
//             yaml '''
// apiVersion: v1
// kind: Pod
// metadata:
//   labels:
//     jenkins/label: "2401013-ecommerce-agent"
// spec:
//   restartPolicy: Never
//   nodeSelector:
//     kubernetes.io/os: "linux"
//   volumes:
//     - name: workspace-volume
//       emptyDir: {}
//     - name: kubeconfig-secret
//       secret:
//         secretName: kubeconfig-secret
//   containers:
//     - name: python
//       image: python:3.10
//       command: ["cat"]
//       tty: true
//       volumeMounts:
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent

//     - name: sonar-scanner
//       image: sonarsource/sonar-scanner-cli
//       command: ["cat"]
//       tty: true
//       volumeMounts:
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent

//     - name: kubectl
//       image: bitnami/kubectl:latest
//       command: ["cat"]
//       tty: true
//       env:
//         - name: KUBECONFIG
//           value: /kube/config
//       securityContext:
//         runAsUser: 0
//       volumeMounts:
//         - name: kubeconfig-secret
//           mountPath: /kube/config
//           subPath: kubeconfig
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent

//     - name: dind
//       image: docker:dind
//       args: ["--storage-driver=overlay2", "--insecure-registry=nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085"]
//       securityContext:
//         privileged: true
//       volumeMounts:
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent

//     - name: jnlp
//       image: jenkins/inbound-agent:3345.v03dee9b_f88fc-1
//       env:
//         - name: JENKINS_AGENT_NAME
//           value: "2401013-ecommerce-agent"
//         - name: JENKINS_AGENT_WORKDIR
//           value: "/home/jenkins/agent"
//       volumeMounts:
//         - name: workspace-volume
//           mountPath: /home/jenkins/agent
// '''
//         }
//     }

//     environment {

//         // Student Namespace
//         NAMESPACE = '2401013'

//         // Nexus Registry
//         REGISTRY  = 'nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085'
//         APP_NAME  = 'ecommerce'
//         IMAGE_TAG = 'latest'
//         IMAGE     = "${REGISTRY}/${NAMESPACE}/${APP_NAME}"

//         NEXUS_USER = 'student'
//         NEXUS_PASS = 'Changeme@2025'

//         // SonarQube
//         SONAR_PROJECT_KEY = '2401013_ecommerce'
//         SONAR_HOST_URL    = 'http://sonarqube.imcc.com'
//         SONAR_TOKEN       = credentials('sonar-token-2002')
//     }

//     stages {

//         stage('Install Python Dependencies') {
//             steps {
//                 container('python') {
//                     sh '''
//                     pip install --upgrade pip
//                     pip install -r requirements.txt
//                     '''
//                 }
//             }
//         }

//         stage('Run SonarQube Analysis') {
//             steps {
//                 container('sonar-scanner') {
//                     sh """
//                     sonar-scanner \
//                       -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
//                       -Dsonar.sources=. \
//                       -Dsonar.host.url=${SONAR_HOST_URL} \
//                       -Dsonar.login=${SONAR_TOKEN}
//                     """
//                 }
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 container('dind') {
//                     sh '''
//                     while ! docker info > /dev/null 2>&1; do sleep 3; done

//                     docker build -t ${IMAGE}:${IMAGE_TAG} .
//                     '''
//                 }
//             }
//         }

//         stage('Login to Nexus Registry') {
//             steps {
//                 container('dind') {
//                     sh """
//                     echo "${NEXUS_PASS}" | docker login ${REGISTRY} -u "${NEXUS_USER}" --password-stdin
//                     """
//                 }
//             }
//         }

//         stage('Push Image to Nexus') {
//             steps {
//                 container('dind') {
//                     sh '''
//                     docker push ${IMAGE}:${IMAGE_TAG}
//                     '''
//                 }
//             }
//         }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 container('kubectl') {
//                     sh """
//                     kubectl apply -f deployment.yaml -n ${NAMESPACE}
//                     kubectl apply -f service.yaml -n ${NAMESPACE}

//                     kubectl set image deployment/ecommerce-deployment ecommerce=${IMAGE}:${IMAGE_TAG} -n ${NAMESPACE}

//                     kubectl rollout status deployment/ecommerce-deployment -n ${NAMESPACE}
//                     """
//                 }
//             }
//         }
//     }

//     post {
//         success { echo "✅ Pipeline completed successfully!" }
//         failure { echo "❌ Pipeline failed. Check logs!" }
//     }
// }






//Ajinkya file:-
// pipeline {
//     agent {
//         kubernetes {
//             yaml '''
// apiVersion: v1
// kind: Pod
// spec:
//   containers:
//   - name: sonar-scanner
//     image: sonarsource/sonar-scanner-cli
//     command: [ "cat" ]
//     tty: true

//   - name: kubectl
//     image: bitnami/kubectl:latest
//     command: [ "cat" ]
//     tty: true
//     securityContext:
//       runAsUser: 0
//       readOnlyRootFilesystem: false
//     env:
//     - name: KUBECONFIG
//       value: /kube/config        
//     volumeMounts:
//     - name: kubeconfig-secret
//       mountPath: /kube/config
//       subPath: kubeconfig

//   - name: dind
//     image: docker:dind
//     securityContext:
//       privileged: true
//     env:
//     - name: DOCKER_TLS_CERTDIR
//       value: ""
//     volumeMounts:
//     - name: docker-config
//       mountPath: /etc/docker/daemon.json
//       subPath: daemon.json

//   volumes:
//   - name: docker-config
//     configMap:
//       name: docker-daemon-config
//   - name: kubeconfig-secret
//     secret:
//       secretName: kubeconfig-secret
// '''
//         }
//     }

//     stages {

//         stage('Build Docker Image') {
//             steps {
//                 container('dind') {
//                     sh '''
//                         sleep 15
//                         docker build -t ecommerce:latest .
//                         docker image ls
//                     '''
//                 }
//             }
//         }

//         stage('Run Django Tests') {
//             steps {
//                 container('dind') {
//                     sh '''
//                         docker run --rm ecommerce:latest \
//                         pytest --maxfail=1 --disable-warnings --cov=. --cov-report=xml || true
//                     '''
//                 }
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 container('sonar-scanner') {
//                     withCredentials([string(credentialsId: 'sonar-token-2401013', variable: 'SONAR_TOKEN')]) {
//                         sh '''
//                         sonar-scanner \
//                         -Dsonar.projectKey=2401013_ecommerce \
//                         -Dsonar.host.url=http://my-sonarqube-sonarqube.sonarqube.svc.cluster.local:9000 \
//                         -Dsonar.login=$SONAR_TOKEN \
//                         -Dsonar.python.coverage.reportPaths=coverage.xml
//                         '''
//                     }
//                 }
//             }
//         }

//         stage('Login To Docker Registry') {
//             steps {
//                 container('dind') {
//                     sh '''
//                     docker login nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085 \
//                     -u admin -p Changeme@2025
//                     '''
//                 }
//             }
//         }

//         stage('Build, Tag & Push Image') {
//             steps {
//                 container('dind') {
//                     sh '''
//                     docker tag ecommerce:latest nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085/2401013-project/ecommerce:latest
//                     docker push nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085/2401013-project/ecommerce:latest
//                     docker image ls
//                     '''
//                 }
//             }
//         }

//         stage('Deploy To Kubernetes') {
//             steps {
//                 container('kubectl') {
//                     sh '''
//                     kubectl apply -f K8s/deployment.yaml
//                     kubectl apply -f K8s/service.yaml
//                     kubectl rollout status deployment/ecommerce-deployment -n 2401013
//                     '''
//                 }
//             }
//         }
//     }
// }






pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: sonar-scanner
    image: sonarsource/sonar-scanner-cli
    command: [ "cat" ]
    tty: true

  - name: kubectl
    image: bitnami/kubectl:latest
    command: [ "cat" ]
    tty: true
    securityContext:
      runAsUser: 0
      readOnlyRootFilesystem: false
    env:
    - name: KUBECONFIG
      value: /kube/config        
    volumeMounts:
    - name: kubeconfig-secret
      mountPath: /kube/config
      subPath: kubeconfig

  - name: dind
    image: docker:dind
    securityContext:
      privileged: true
    env:
    - name: DOCKER_TLS_CERTDIR
      value: ""
    volumeMounts:
    - name: docker-config
      mountPath: /etc/docker/daemon.json
      subPath: daemon.json

  volumes:
  - name: docker-config
    configMap:
      name: docker-daemon-config
  - name: kubeconfig-secret
    secret:
      secretName: kubeconfig-secret
'''
        }
    }

    stages {

        stage('Build Docker Image') {
            steps {
                container('dind') {
                    sh '''
                    sleep 15
                    docker build -t ecommerce:latest .
                    docker image ls
                    '''
                }
            }
        }

        stage('Run Django Tests') {
            steps {
                container('dind') {
                    sh '''
                    docker run --rm ecommerce:latest \
                    pytest --maxfail=1 --disable-warnings || true
                    '''
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                container('sonar-scanner') {
                    withCredentials([string(credentialsId: 'sonar-token-2401013', variable: 'SONAR_TOKEN')]) {
                        sh '''
                        sonar-scanner \
                        -Dsonar.projectKey=2401013_ecommerce \
                        -Dsonar.projectName=2401013_ecommerce \
                        -Dsonar.sources=. \
                        -Dsonar.language=py \
                        -Dsonar.host.url=http://my-sonarqube-sonarqube.sonarqube.svc.cluster.local:9000 \
                        -Dsonar.login=$SONAR_TOKEN
                        '''
                    }
                }
            }
        }

        stage('Login To Docker Registry') {
            steps {
                container('dind') {
                    sh '''
                    docker login nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085 \
                    -u admin -p Changeme@2025
                    '''
                }
            }
        }

        stage('Build, Tag & Push Image') {
            steps {
                container('dind') {
                    sh '''
                    docker tag ecommerce:latest nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085/2401013-project/ecommerce:latest
                    docker push nexus-service-for-docker-hosted-registry.nexus.svc.cluster.local:8085/2401013-project/ecommerce:latest
                    docker image ls
                    '''
                }
            }
        }

        stage('Deploy To Kubernetes') {
            steps {
                container('kubectl') {
                    sh '''
                    kubectl apply -f K8s/deployment.yaml
                    kubectl rollout status deployment/ecommerce-deployment -n 2401013
                    '''
                }
            }
        }
    }
}
