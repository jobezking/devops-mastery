pipeline {
    agent {
        label {
            label 'master'
            customWorkspace "${JENKINS_HOME}/${BUILD_NUMBER}/"
        }
    }
    environment {
        Go111MODULE='on'
    }
    stages {
        stage('Test') {
            steps {
                git 'https://github.com/kodekloudhub/go-webapp-sample.git'
            }
        }
        stage('build') {
            steps {
                script{
                    image = docker.build("adminturneddevops/go-webapp-sample")
                    sh "docker run -p 8090:8000 -d adminturneddevops/go-webapp-sample"
                }
            }
        }
    }
}