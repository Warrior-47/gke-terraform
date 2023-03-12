pipeline {
  agent any
  stages {
    stage('terraform check') {
      steps {
        sh '''
terraform init
terraform validate'''
      }
    }

    stage('terraform plan') {
      steps {
        sh 'terraform plan -out a.plan'
      }
    }

  }
}