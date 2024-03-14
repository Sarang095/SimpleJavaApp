pipeline {
    agent any
    
    environment {
        MAVEN_HOME = tool 'Maven 3.8.4'
        MAVEN_OPTS = '-Dmaven.repo.local=.m2/repository'
        DOCKER_IMAGE_NAME = 'csag095/simple-java-app' // Replace with your Docker Hub username and desired image name
        DOCKER_IMAGE_TAG = 'latest' // You can set a specific tag for the Docker image
    }
    
    stages {

        stage{
            steps{
                sh './var/jenkins_home/docker_installation'
            }
        }
        stage('Cleanup') {
            steps {
                // Remove the folder using shell command
                sh 'rm -rf SimpleJavaApp'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Clone the repository
                sh 'git clone https://github.com/Sarang095/SimpleJavaApp.git'
                
                // Navigate to the cloned repository directory
                dir('SimpleJavaApp') {
                }
                
                // Build Docker image using the provided Dockerfile
                sh 'docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG .'
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
               script{ 
                withCredentials([string(credentialsId: 'docker-hub-creds', variable: 'docker hub creds')]) {
                sh 'docker login -u csag095 -p ${docker hub creds}' 
}
                sh "docker push $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"
               }
            }
        }
        
        stage('Run Docker Image') {
            steps {
                sh "docker run --rm -d -p 8090:8080 $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"
            }
        }
        
    }
}


