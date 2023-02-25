#!/usr/bin/env groovy
pipeline {
    agent {
        node any
    }

    stages {
        stage('Build Image') {
            when {
                branch 'master'  //only run these steps on the master branch
            }
            steps {
              sh "docker build . -t biswanathsubudhi/project:${latestCommitid() }"
            }

            // Jenkins Stage to Build the Docker Image

        }

        stage('Publish Image') {
            when {
                branch 'master'  //only run these steps on the master branch
            }
            steps {
              withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerpassword')]) {
                sh "docker login -u biswanathsubudhi -p ${dockerpassword}"
                sh "docker push biswanathsubudhi/myapp:${latestCommitid() }"
        }
      }
            
            // Jenkins Stage to Publish the Docker Image to Dockerhub or any Docker repository of your choice.

        }
    }
}
