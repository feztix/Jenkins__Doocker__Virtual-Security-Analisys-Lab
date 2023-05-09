pipeline {
  agent any
   parameters {
        string(name: 'DOCKER_IMAGE_NAME', defaultValue: '', description: 'Docker image name')
        string(name: 'DOCKERFILE_PATH', defaultValue: '', description: 'Path to the Dockerfile')
    }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
      	sh "docker build -t '${env.DOCKER_IMAGE_NAME}' -f '${env.DOCKERFILE_PATH}' ."
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh "docker push '${env.DOCKER_IMAGE_NAME}'"
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
