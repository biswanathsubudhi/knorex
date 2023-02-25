pipeline {
    agent any
    stages {
        stage('Build Image') {
            steps {
              sh "docker build . -t biswanathsubudhi/project:${latestCommitid() }"
            }
        }

        stage('Publish Image') {
            steps {
              withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerpassword')]) {
                sh "docker login -u biswanathsubudhi -p ${dockerpassword}"
                sh "docker push biswanathsubudhi/project:${latestCommitid() }"
                }
            }
        }
    }
}

def latestCommitid() {
def latestCommitid=sh returnStdout: true, script: 'git rev-parse --short HEAD'
return latestCommitid
}
