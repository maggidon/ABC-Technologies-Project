pipeline {
    agent any
    
    tools {
        maven 'maven'
    }
    
    environment {
        DOCKER_IMAGE = "maggidon/ci-cd"
        WORK_DIR = "/var/lib/jenkins/workspace/ABC_Technologies"
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/maggidon/ABC-Technologies-Project1.git', branch: 'main'
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'cp ${WORK_DIR}/target/ABCtechnologies-1.0.war abc_tech.war'
                sh 'docker build -t ${DOCKER_IMAGE}:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: "maggidon_dockerhub", url: ""]) {
                    sh 'docker push ${DOCKER_IMAGE}:latest'
                }
            }
        }
            
        stage('Deploy as a Container'){
            steps {
                sh 'docker run -itd -p 8082:8082 --name abc_tech ${DOCKER_IMAGE}:latest'
                }
            }
        stage('Deploy to k8s cluster') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig1', variable: 'KUBECONFIG')]) {
                    // Create or update the Kubernetes deployment
                    sh "kubectl delete deployment abcapp1 --ignore-not-found"
                    sh "kubectl create deployment abcapp1 --image=${DOCKER_IMAGE}:latest"
                    sh "kubectl apply -f ${WORK_DIR}/app.yaml"
                }
            }
        }  
    }
    post {
        success {
            echo 'Build Successful!!!'
        }
        failure {
            echo 'Build Failed!! Check logs for details.'
        }
    }
}
