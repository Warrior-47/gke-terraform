pipeline {
  agent any
  stages {
    stage('terraform initialize') {
      parallel {
        stage('terraform initialize') {
          steps {
            sh '''terraform init
terraform validate'''
          }
        }

        stage('get credentials') {
          steps {
            input 'Give creds'
          }
        }

      }
    }

    stage('terraform plan') {
      steps {
        sh 'terraform plan -out a.plan'
      }
    }

  }
}