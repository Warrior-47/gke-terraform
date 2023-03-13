pipeline {
  agent any
  stages {
    stage('docker build') {
      steps {
        sh 'docker build - < Dockerfile -t $REPO/check:$BUILD_NUMBER'
      }
    }

    stage('Check images') {
      steps {
        sh 'docker images'
        input 'Continue?'
      }
    }

    stage('Push') {
      steps {
        sh 'docker push $REPO/check:$BUILD_NUMBER'
      }
    }

  }
  environment {
    REPO = 'asia-southeast1-docker.pkg.dev/sms-gateway-379408/test-repo'
  }
}