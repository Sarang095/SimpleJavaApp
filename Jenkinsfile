pipeline {
    agent any
    
    environment {
        MAVEN_HOME = tool 'Maven 3.8.4'   // in the global tool and config we added this version of maven, now we are using the cmmds of this maven version for executing tasks
        MAVEN_OPTS = '-Dmaven.repo.local=.m2/repository'
    }
    
    stages {
        stage('Checkout') {
            steps {
                sh 'rm -rf SimpleJavaApp/'
                sh 'git clone https://github.com/Sarang095/SimpleJavaApp.git'
            }
        }
        
        stage('Build') {
            steps {
                dir('SimpleJavaApp') {
                    sh "${MAVEN_HOME}/bin/mvn clean package"  //Now from the installation of the maven version which is done by the jenkins global tool and config we are using that to build the artifact.
                }
            }
        }
        
        stage('Test') {
            steps {
                dir('SimpleJavaApp') { //dir added to go in the directory here the cd dont work
                    sh "${MAVEN_HOME}/bin/mvn test"
                }
            }
        }
    }
    
     post {
        success {
            archiveArtifacts 'SimpleJavaApp/target/*.jar' 
        }
    }
}


