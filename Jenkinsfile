pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        build 'build'
      }
    }
    stage('Test') {
      steps {
        junit 'Test1'
        junit 'Test2'
      }
    }
    stage('Deploy') {
      steps {
        echo 'deploy'
      }
    }
  }
}