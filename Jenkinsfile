pipeline {
  agent any
  stages {
    stage('terraform initialize') {
      steps {
        sh '''terraform init
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